//
//  StoreSearchService.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

struct StoreSearchService: Gettable {
    let endpoint = "https://api.doordash.com/v1/store_search/?lat=%.06f&lng=%.06f"
    var location: Box<Location> = Box(Location(lat: 37.42274, lng: -122.139956))
    
    func get(_ completion: @escaping (Result<[Store]>) -> Void) {
        guard let url = URL(string: String(format: endpoint, location.value.lat, location.value.lng)) else {
            fatalError()
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            let decoder = JSONDecoder()
//            guard let data = data, let dataResponse = try? decoder.decode([Store].self, from: data) else {
//                completion(.failure(NetworkError.emptyResponse))
//                return
//            }
            guard let data = data else {
                return completion(.failure(NetworkError.emptyResponse))
            }
//            guard let dataResponse = try? decoder.decode([Store].self, from: data) else {
//                return completion(.failure(NetworkError.decodingError(nil)))
//            }
            let dataResponse = try! decoder.decode([Store].self, from: data)
            completion(.success(dataResponse))
        }.resume()
    }
}
