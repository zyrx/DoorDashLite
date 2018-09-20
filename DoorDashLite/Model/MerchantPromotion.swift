//
//  MerchantPromotion.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

struct MerchantPromotion: Codable {
    var id: Int
    var minimumSubtotalMonetaryFields: MonetaryField
    var deliveryFee: Double?
    var deliveryFeeMonetaryFields: MonetaryField
    var minimumSubtotal: Double?
    var newStoreCustomersOnly: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case minimumSubtotalMonetaryFields = "minimum_subtotal_monetary_fields"
        case deliveryFee = "delivery_fee"
        case deliveryFeeMonetaryFields = "delivery_fee_monetary_fields"
        case minimumSubtotal = "minimum_subtotal"
        case newStoreCustomersOnly = "new_store_customers_only"
    }
}
