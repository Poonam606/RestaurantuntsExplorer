//
//  ApiEnum.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import Foundation
enum ApiEnumError: Error{
    case invalidUrl 
    case invalidResponse
    case error(Error)
}
struct ApiEnumEndPoint{
   static let endPointRestaurant = "https://api.eat-sandbox.co/consumer/v2/restaurants?region_id=3906535a-d96c-47cf-99b0-009fc9e038e0"
    static let endPointRestaurantDetails = "https://api.eat-sandbox.co/consumer/v2/restaurants/"
}
