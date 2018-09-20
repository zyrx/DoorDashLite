//
//  PopularItem.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

struct PopularItem: Codable {
    var id: Int
    var name: String
    var price: Double
    var description: String
    var imgUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case description
        case imgUrl = "img_url"
    }
}
