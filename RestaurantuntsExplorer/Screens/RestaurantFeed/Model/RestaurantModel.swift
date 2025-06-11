//
//  RestaurantModel.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import Foundation
struct RestaurantResponse: Codable {
    let data: [Restaurant]
    let meta: Meta
    let links: Links
}

struct Restaurant: Codable, Identifiable,Hashable {
    var id: String
    let type: String
    let attributes: RestaurantAttributes
    let relationships: Relationships?
}

struct RestaurantAttributes: Codable,Hashable {
    let name: String
    let priceLevel: Int?
    let phone: String?
    let menuURL: String?
    let requireBookingPreferenceEnabled: Bool
    let difficult: Bool
    let cuisine: String
    let imageURL: String?
    let latitude: Double
    let longitude: Double
    let addressLine1: String
    let ratingsAverage: String?
    let ratingsCount: Int?
    let labels: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name, phone, cuisine, difficult, latitude, longitude, labels
        case priceLevel = "price_level"
        case menuURL = "menu_url"
        case requireBookingPreferenceEnabled = "require_booking_preference_enabled"
        case imageURL = "image_url"
        case addressLine1 = "address_line_1"
        case ratingsAverage = "ratings_average"
        case ratingsCount = "ratings_count"
    }
}

struct Relationships: Codable,Hashable {
    let region: RegionDataWrapper?
}

struct RegionDataWrapper: Codable ,Hashable{
    let data: RegionData?
}

struct RegionData: Codable ,Hashable{
    let id: String
    let type: String
}

struct Meta: Codable,Hashable {
    let limit: Int
    let totalPages: Int
    let totalCount: Int
    let currentPage: Int
    
    enum CodingKeys: String, CodingKey {
        case limit
        case totalPages = "total_pages"
        case totalCount = "total_count"
        case currentPage = "current_page"
    }
}

struct Links: Codable,Hashable {
    let first: String
    let next: String?
    let prev: String?
    let last: String
}
