//
//  StoreSearchServiceHandler.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

protocol StoreSearchServiceHandler {
    func didReceiveData(_ data: [Store])
    func didFailWith(_ error: Error)
}

extension StoreSearchServiceHandler {
    public func getStoreSearchData<T: Gettable> (from service: T) where T.DataType == [Store] {
        service.get() {result in
            switch result {
            case .success(let storeSearchData):
                self.didReceiveData(storeSearchData)
            case .failure(let error):
                self.didFailWith(error)
            }
        }
    }
}
