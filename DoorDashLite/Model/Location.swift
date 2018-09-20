//
//  Location.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation
import MapKit

struct Location {
    var lat: Double
    var lng: Double
    
    var cllocation: CLLocation {
        return CLLocation(latitude: lat, longitude: lng)
    }
}
