//
//  ExploreViewModel.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 18/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation
import MapKit

protocol ExploreViewable {
    var stores: Box<[Store]> { get }
//    var location: Box<Location> { get }
    func fetchData()
}

class ExploreViewModel: ExploreViewable {
    
    private var storeSearchService = StoreSearchService()
    private let locationViewModel: LocationViewable = LocationViewModel()
    
    var stores: Box<[Store]> = Box([])
    //var location: Box<Location> = Box(Location(lat: 37.42274, lng: -122.139956))
    
    init() {
        locationViewModel
            .currentLocation
            .bind { [weak self] _ in
            self?.fetchData()
        }
    }
    
    func fetchData() {
        guard let location = locationViewModel.currentLocation.value else { return }
        fetchData(for: location)
    }
    
    func fetchData(for location: Location) {
        storeSearchService.location.value = location
        getStoreSearchData(from: storeSearchService)
    }
}

extension ExploreViewModel: StoreSearchServiceHandler {
    func didReceiveData(_ data: [Store]) {
        stores.value = data
    }
    
    func didFailWith(_ error: Error) {
        stores.value = []
        
        var localizedDescription = error.localizedDescription
        if case NetworkError.emptyResponse = error {
            localizedDescription = "Empty response"
        }
        print("Network Error: \(localizedDescription)")
    }
}

extension ExploreViewModel: LocationViewable {
    var regionRadius: Double {
         return locationViewModel.regionRadius
    }
    
    var currentLocation: Box<Location?> {
        return locationViewModel.currentLocation
    }

    var selectedLocation: Box<Location?> {
        return locationViewModel.selectedLocation
    }
}
