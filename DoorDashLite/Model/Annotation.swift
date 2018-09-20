//
//  Annotation.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 18/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    static private let geocoder = CLGeocoder()
    
    let title: String? = nil
    let locationName: String = ""
    let discipline: String = ""
    let coordinate: CLLocationCoordinate2D
    
    let location: Location
    let address: Box<String?> = Box(nil)
    
    required init(with location: Location) {
        self.location = location
        coordinate = location.cllocation.coordinate
        super.init()
        
        Annotation.geocoder.reverseGeocodeLocation(location.cllocation) { [weak self] placemark, error in
            self?.address.value = nil
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let placemark = placemark?.first else { return }
            var address = ""
            if let name = placemark.name {
                address += "\(name), "
            }
            if let thoroughfare = placemark.thoroughfare {
                address += "\(thoroughfare), "
            }
            if let locality = placemark.locality {
                address += "\(locality), "
            }
            if let administrativeArea = placemark.administrativeArea {
                address += "\(administrativeArea)"
            }
            self?.address.value = address
        }
    }
}
