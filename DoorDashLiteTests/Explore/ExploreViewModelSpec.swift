//
//  ExploreViewModelSpec.swift
//  DoorDashLiteTests
//
//  Created by Lech H. Conde on 20/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Quick
import Nimble

@testable import DoorDashLite

class ExploreViewModelSpec: QuickSpec {
    override func spec() {
        var subject: ExploreViewModel!
        var mockStoreSearchService: MockStoreSearchService!
        
        describe("ExploreViewModelSpec") {
            beforeEach {
                subject = ExploreViewModel()
            }
            
            context("when fetching stores") {
                beforeEach {
                    
                }
                
                it("") {
                    
                }
            }
        }
    }
}

class MockStoreSearchService: Gettable {

    let endpoint = "https://api.doordash.com/v1/store_search/?lat=%.06f&lng=%.06f"
    var location: Box<Location> = Box(Location(lat: 37.42274, lng: -122.139956))
    
    var getCalled: Bool = false
    
    func get(_ completion: @escaping (Result<[Store]>) -> Void) {
        getCalled = true
    
    }
    
}
