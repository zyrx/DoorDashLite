//
//  Address.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

struct Address: Codable {
    var city: String
    var state: String
    var street: String
    var lat: Double
    var lng: Double
    var printableAddress: String
    
    enum CodingKeys: String, CodingKey {
        case city
        case state
        case street
        case lat
        case lng
        case printableAddress = "printable_address"
    }
}
