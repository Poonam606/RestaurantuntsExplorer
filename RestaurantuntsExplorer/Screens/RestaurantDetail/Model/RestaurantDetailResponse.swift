//
//  RestaurantDetailResponse.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import Foundation
struct RestaurantDetailResponse: Codable {
    let data: RestaurantDetailData
    let included: [IncludedItem]?
}
struct RestaurantDetailData: Codable {
    let id: String
    let type: String
    let attributes: RestaurantDetailAttributes
    let relationships: RestaurantDetailRelationships?
}
struct RestaurantDetailAttributes: Codable {
    let name: String
    let priceLevel: Int?
    let phone: String?
    let menuURL: String?
    let requireBookingPreferenceEnabled: Bool?
    let difficult: Bool
    let cuisine: String?
    let imageURL: String?
    let latitude: Double?
    let longitude: Double?
    let addressLine1: String?
    let ratingsAverage: String?
    let ratingsCount: Int?
    let labels: [String]?
    let alcohol: Bool?
    let description: String?
    let establishmentType: String?
    let externalRatingsURL: String?
    let imageURLs: [String]?
    let neighborhoodName: String?
    let operatingHours: String?
    let outdoorSeating: Bool?
    let province: String?
    let smoking: Bool?
    let valet: Bool?
    let slug: String?
    let addressLine2: String?
    let city: String?
    let ratingsImg: String?
    let notice : String?

    enum CodingKeys: String, CodingKey {
        case name, phone, cuisine, difficult, latitude, longitude, labels, alcohol, description, slug, city, smoking, valet, province,notice
        case priceLevel = "price_level"
        case menuURL = "menu_url"
        case requireBookingPreferenceEnabled = "require_booking_preference_enabled"
        case imageURL = "image_url"
        case addressLine1 = "address_line_1"
        case ratingsAverage = "ratings_average"
        case ratingsCount = "ratings_count"
        case establishmentType = "establishment_type"
        case externalRatingsURL = "external_ratings_url"
        case imageURLs = "image_urls"
        case neighborhoodName = "neighborhood_name"
        case operatingHours = "operating_hours"
        case outdoorSeating = "outdoor_seating"
        case ratingsImg = "ratings_img"
        case addressLine2 = "address_line_2"
    }
}
struct RestaurantDetailRelationships: Codable {
    let region: RegionWrapper?
    let promotionalGroups: PromotionalGroupWrapper?
    let rating: RatingWrapper?
    let experiences: ExperienceWrapper?
    let onlineSeatingShifts: SeatingShiftWrapper?

    enum CodingKeys: String, CodingKey {
        case region
        case promotionalGroups = "promotional_groups"
        case rating, experiences
        case onlineSeatingShifts = "online_seating_shifts"
    }
}

struct RegionWrapper: Codable {
    let data: IDType?
}
struct PromotionalGroupWrapper: Codable {
    let data: [IDType]?
}
struct RatingWrapper: Codable {
    let data: IDType?
}
struct ExperienceWrapper: Codable {
    let data: [IDType]?
}
struct SeatingShiftWrapper: Codable {
    let data: [IDType]?
}

struct IDType: Codable {
    let id: String
    let type: String?
}
enum IncludedItem: Codable {
    case seatingShift(OnlineSeatingShift)
    case promoGroup(PromotionalGroup)
    case rating(Rating)

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "online_seating_shift":
            self = .seatingShift(try OnlineSeatingShift(from: decoder))
        case "promotional_group":
            self = .promoGroup(try PromotionalGroup(from: decoder))
        case "rating":
            self = .rating(try Rating(from: decoder))
        default:
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Unknown type: \(type)")
        }
    }

    // MARK: - Encodable

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .seatingShift(let seatingShift):
            try container.encode("online_seating_shift", forKey: .type)
            try seatingShift.encode(to: encoder) // Encode the associated value
        case .promoGroup(let promoGroup):
            try container.encode("promotional_group", forKey: .type)
            try promoGroup.encode(to: encoder) // Encode the associated value
        case .rating(let rating):
            try container.encode("rating", forKey: .type)
            try rating.encode(to: encoder) // Encode the associated value
        }
    }

    enum CodingKeys: String, CodingKey {
        case type
    }
}
struct OnlineSeatingShift: Codable {
    let id: String
    let type: String?
    let attributes: SeatingShiftAttributes?
}

struct SeatingShiftAttributes: Codable {
    let firstSeating: Int?
    let lastSeating: Int?
    let shiftType: String?
    let daysOfWeek: [Int]?

    enum CodingKeys: String, CodingKey {
        case firstSeating = "first_seating"
        case lastSeating = "last_seating"
        case shiftType = "shift_type"
        case daysOfWeek = "days_of_week"
    }
}
struct PromotionalGroup: Codable {
    let id: String
    let type: String?
    let attributes: PromotionalGroupAttributes?
}

struct PromotionalGroupAttributes: Codable {
    let name: String?
    let description: String?
    let regionID: String?
    let restaurantsCount: Int?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case name, description
        case regionID = "region_id"
        case restaurantsCount = "restaurants_count"
        case imageURL = "image_url"
    }
}
struct Rating: Codable {
    let id: String
    let type: String?
    let attributes: RatingAttributes?
}

struct RatingAttributes: Codable {
    let average: String?
    let imageURL: String?
    let total: Int?
    let reviews: [Review]?

    enum CodingKeys: String, CodingKey {
        case average
        case imageURL = "image_url"
        case total, reviews
    }
}

struct Review: Codable {
    let publishedDate: String?
    let rating: Int?
    let ratingImageURL: String?
    let url: String?
    let text: String?
    let user: ReviewUser?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case publishedDate = "published_date"
        case rating, ratingImageURL = "rating_image_url", url, text, user, title
    }
}

struct ReviewUser: Codable {
    let username: String?
    let userLocation: UserLocation?
}

struct UserLocation: Codable {
    let name: String?
    let id: String?
}
