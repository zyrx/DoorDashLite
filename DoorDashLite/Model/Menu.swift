//
//  Menu.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

struct Menu: Codable {
    var id: Int
    var isCatering: Bool
    var name: String
    var subtitle: String
    var popularItems: [PopularItem]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isCatering = "is_catering"
        case name
        case subtitle
        case popularItems = "popular_items"
    }
}
