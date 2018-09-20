//
//  LocationViewModel.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 18/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation
import MapKit

protocol LocationViewModelDelegate {
    
}

protocol LocationViewable {
    var currentLocation: Box<Location?> { get }
    var selectedLocation: Box<Location?> { get }
    var regionRadius: Double { get }
}

class LocationViewModel: NSObject, LocationViewable {
    
    var delegate: LocationViewModelDelegate?
    
    let locationManager = CLLocationManager()
    let regionRadius: Double = 1500
    let currentLocation: Box<Location?> = Box(nil)
    let selectedLocation: Box<Location?> = Box(nil)
    
    override init() {
        super.init()
        setupLocationServices()
    }
    
    deinit {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    
    func setupLocationServices() {
        guard CLLocationManager.locationServicesEnabled() else {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate  else { return }
        currentLocation.value = Location(lat: coordinate.latitude, lng: coordinate.longitude)
    }
    
}
