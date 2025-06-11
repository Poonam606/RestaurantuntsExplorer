//
//  RestaurantFeedView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import SwiftUI

struct RestaurantFeedView: View {
    @StateObject private var viewModel = RestaurantFeedViewModel()
    @StateObject private var networkMonitor = ConnectionManger()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                //  Internet view
                if !networkMonitor.isConnected {
                    ErrorRetryView(onTap: {
                        Task {
                            await  viewModel.fetchRestaurants()
                        }
                    }, error: FeedConstant.noInternetConnetion)
                } else {
                    Group {
                        //  skelton view
                        if viewModel.isLoading {
                            FeedSkeltonView()
                        } else if let error = viewModel.errorMessage {
                            // error view
                            ErrorRetryView(onTap: {
                                Task {
                                    await  viewModel.fetchRestaurants()
                                }
                            }, error: error)
                        } else {
                            // list view
                            if !viewModel.restaurants.isEmpty{
                                VStack(alignment: .leading,spacing: 16) {
                                    VStack {
                                        Text("Restaurants")
                                            .padding(.leading,16)
                                            .font(.inter(size: 34,weight: .semibold))
                                    }
                                    
                                    RestaurantSearchBar(search: $viewModel.searchtext)
                                    ScrollView {
                                        LazyVStack(spacing: 10) {
                                            ForEach(viewModel.restaurants) { restaurant in
                                                NavigationLink(value: restaurant) {
                                                    RestaurantFeedCell(viewModel: viewModel, restaurant: restaurant)
                                                        .padding()
                                                }
                                            }
                                        }
                                    }
                                }
                                
                            } else {
                                ErrorRetryView(onTap: {
                                    Task {
                                        await  viewModel.fetchRestaurants()
                                    }
                                }, error: FeedConstant.noDataFound)
                            }
                        }
                    }
                    //Navigation Destination
                    .navigationDestination(for: Restaurant.self, destination: { restaurant in
                        RestaurantDetailView(restaurant: restaurant)
                            .navigationBarBackButtonHidden(true)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    BackButton ()
                                }
                            }
                    })
                }
            }
        }
    }
}

#Preview {
    RestaurantFeedView()
}

