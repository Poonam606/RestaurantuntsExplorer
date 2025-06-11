//
//  RestaurantFeedViewModel.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import Foundation
import SwiftUI
import Combine
class RestaurantFeedViewModel: ObservableObject{
    @Published var restaurants =  [Restaurant]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchtext : String = ""
    private var cancellables = Set<AnyCancellable>()
    init() {
        $searchtext
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                Task {
                    await self.fetchRestaurants(searchText: text)
                }
            }
            .store(in: &cancellables)
    }
    //MARK: fetch restaurant
    @MainActor
    func fetchRestaurants(searchText: String? = nil) async {
        isLoading = true
        errorMessage = nil
        defer {
            isLoading = false
        }
        var  url = ""
        if let text = searchText, !text.isEmpty {
           url = ApiEnumEndPoint.endPointRestaurant + "&q=" +  text
        } else {
            url = ApiEnumEndPoint.endPointRestaurant
        }
        do {
            let response: RestaurantResponse = try await ApiHelper.shared.getRequest(endPoint: url)
            self.restaurants = response.data
           // self.replicaRestaurant  = self.restaurants
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
