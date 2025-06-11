//
//  RestaurantDetailView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant : Restaurant
    @StateObject var detailViewModel = RestaurantDetailViewModel()
    @StateObject private var networkMonitor = ConnectionManger()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            // check internet connection
            if !networkMonitor.isConnected {
                ErrorRetryView(onTap: {
                    Task {
                        await detailViewModel.fetchRestaurants(id: restaurant.id)
                    }
                }, error: FeedConstant.noInternetConnetion)
            } else {
                Group {
                    //loader view
                    if detailViewModel.isLoading {
                        ProgressView()
                            .frame(width: 30,height: 30,alignment: .center)
                    }
                    //error view
                    else if let error = detailViewModel.errorMessage {
                        ErrorRetryView(onTap: {
                            Task {
                                await detailViewModel.fetchRestaurants(id: restaurant.id)
                            }
                        }, error: error)
                    }
                    // detail view
                    else {
                        if let _ = detailViewModel.restaurant {
                            // header image
                            RestaurantDetailHeader(detailViewModel: detailViewModel, onBack: {
                                dismiss()
                            })
                            // scrollableView
                            RestaurantDetailScrollableView(detailViewModel: detailViewModel)
                                .padding(.top,-200)
                        } else {
                            ErrorRetryView(onTap: {
                                Task {
                                    await  detailViewModel.fetchRestaurants(id: restaurant.id)
                                }
                            }, error: FeedConstant.noDataFound)
                        }
                    }
                }
                .task {
                    await detailViewModel.fetchRestaurants(id: restaurant.id)
                }
                .ignoresSafeArea()
            }

        }
        
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(id: "b9be0a20-0e6e-435b-82fa-04d4801c4aff", type: "", attributes: RestaurantAttributes(name: "Firefly Longue", priceLevel: 2, phone: "", menuURL: "", requireBookingPreferenceEnabled: false, difficult: false, cuisine: "international", imageURL: "", latitude: 2.2245, longitude: 4.4444, addressLine1: "", ratingsAverage: "4.0", ratingsCount: 4, labels: ["valet parking","Smoking allowed","Outdoor sitting"]), relationships: nil))
}
