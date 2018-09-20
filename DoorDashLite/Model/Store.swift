//
//  Store.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

struct Store: Codable {
    var id: Int
    var isTimeSurging: Bool
    var maxOrderSize: Int?
    var deliveryFee: Double
    var maxCompositeScore: Int
    var merchantPromotions: [MerchantPromotion]
    var averageRating: Double
    var menus: [Menu]?
    var compositeScore: Int
    var statusType: String
    var isOnlyCatering: Bool
    var status: String
    var numberOfRatings: Int
    var description: String
    var business: Business
    var tags: [String]
    var asapTime: Int?
    var extraSosDeliveryFee: Double
    var coverImgUrl: String
    var headerImgUrl: String
    var address: Address
    var priceRange: Int
    var slug: String
    var name: String
    var isNewlyAdded: Bool
    var url: String
    var serviceRate: Int
    var promotion: String?
    var featuredCategoryDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isTimeSurging = "is_time_surging"
        case maxOrderSize = "max_order_size"
        case deliveryFee = "delivery_fee"
        case maxCompositeScore = "max_composite_score"
        case merchantPromotions = "merchant_promotions"
        case averageRating = "average_rating"
        case menus
        case compositeScore = "composite_score"
        case statusType = "status_type"
        case isOnlyCatering = "is_only_catering"
        case status
        case numberOfRatings = "number_of_ratings"
        case description
        case business
        case tags
        case asapTime = "asap_time"
        case extraSosDeliveryFee = "extra_sos_delivery_fee"
        case coverImgUrl = "cover_img_url"
        case headerImgUrl = "header_img_url"
        case address
        case priceRange = "price_range"
        case slug
        case name
        case isNewlyAdded = "is_newly_added"
        case url
        case serviceRate = "service_rate"
        case promotion
        case featuredCategoryDescription = "featured_category_description"
    }
}
