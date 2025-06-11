//
//  RestaurantDetailViewModel.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import Foundation
import Foundation
import SwiftUI
class RestaurantDetailViewModel: ObservableObject{
    @Published var restaurant: RestaurantDetailData?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
   
    //MARK: fetch restaurant Detail
    @MainActor
    func fetchRestaurants(id:String) async {
        isLoading = true
        errorMessage = nil
        defer {
            isLoading = false
        }
        let url = ApiEnumEndPoint.endPointRestaurantDetails + id
        do {
            let response: RestaurantDetailResponse = try await ApiHelper.shared.getRequest(endPoint: url)
            self.restaurant = response.data
        } catch {
            self.errorMessage = "Failed to load restaurants: \(error.localizedDescription)"
        }
        
    }
    
    //MARK: get image from price level
    func priceLevelImage(for level: Int?) -> String {
        switch level {
        case 2:
            return "dollar1"
        case 3:
            return "dollar3"
        case 1:
            return "dollar2"
        default:
            return "N/A"
        }
    }
    
}
