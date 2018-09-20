//
//  ExploreViewControllerSpec.swift
//  DoorDashLiteTests
//
//  Created by Lech H. Conde on 20/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Quick
import Nimble

@testable import DoorDashLite

class ExploreViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: ExploreViewController!
        var mockEploreViewModel: MockExploreViewModel!
        
        describe("ExploreViewControllerSpec") {
            
            beforeEach {
                mockEploreViewModel = MockExploreViewModel()
                subject = ExploreViewController()
                subject.exploreViewModel = mockEploreViewModel
            }
            
            context("when the view loads") {
                beforeEach {
                   subject.viewDidLoad()
                }
                it("should fetch the data and load the table view") {
                    expect(mockEploreViewModel.fetchDataCalled).to(beTrue())
                    expect(subject.tableView.numberOfRows(inSection: 0)).to(equal(1))
                }
            }
        }
    }
}

class MockExploreViewModel: ExploreViewable, LocationViewable {
    var currentLocation: Box<Location?> = Box(nil)
    
    var selectedLocation: Box<Location?> = Box(nil)
    
    var regionRadius: Double = 1500
    
    var stores: Box<[Store]> = Box([])
    
    var fetchDataCalled: Bool = false
    
    let aBusiness = Business(id: 1, name: "A Business")
    
    let anAddress = Address(city: "A City", state: "A State", street: "123 A Street", lat: 0, lng: 0, printableAddress: "123 A Street, A City, A State")
    
    lazy var aStore: Store = {
        return Store(id: 1, isTimeSurging: true, maxOrderSize: nil, deliveryFee: 0.0, maxCompositeScore: 1, merchantPromotions: [], averageRating: 10, menus: nil, compositeScore: 1, statusType: "", isOnlyCatering: false, status: "", numberOfRatings: 1, description: "", business: aBusiness, tags: [], asapTime: nil, extraSosDeliveryFee: 0, coverImgUrl: "", headerImgUrl: "", address: anAddress, priceRange: 1, slug: "", name: "", isNewlyAdded: false, url: "", serviceRate: 1, promotion: nil, featuredCategoryDescription: nil)
    }()
    
    func fetchData() {
        fetchDataCalled = true
        stores.value = [aStore]
    }
}
