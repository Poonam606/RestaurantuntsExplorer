//
//  RestaurantFeedViewModel.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import Foundation
import SwiftUI
class RestaurantFeedViewModel: ObservableObject{
    @Published var restaurants =  [Restaurant]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    init() {
           Task {
               await fetchRestaurants()
           }
       }
    //MARK: fetch restaurant
    @MainActor
    func fetchRestaurants() async {
        isLoading = true
        errorMessage = nil
        defer {
            isLoading = false
        }
        let url = ApiEnumEndPoint.endPointRestaurant
        do {
            let response: RestaurantResponse = try await ApiHelper.shared.getRequest(endPoint: url)
            self.restaurants = response.data
        } catch {
            self.errorMessage = "Failed to load restaurants: \(error.localizedDescription)"
        }
    }
    //MARK: get string from priceLevel
    func priceLevelText(for level: Int?) -> String {
        switch level {
        case 2:
            return "$$"
        case 3:
            return "$$$"
        case 1:
            return "$"
        default:
            return "N/A"
        }
    }
}
