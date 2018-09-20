//
//  MonetaryField.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

struct MonetaryField: Codable {
    var currency: String
    var displayString: String
    var unitAmount: Double?
    var decimalPlaces: Int
    
    enum CodingKeys: String, CodingKey {
        case currency
        case displayString = "display_string"
        case unitAmount = "unit_amount"
        case decimalPlaces = "decimal_places"
    }
}
