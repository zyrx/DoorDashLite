//
//  Networking.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case emptyResponse
    case decodingError(String?)
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol Gettable {
    associatedtype DataType
    func get(_ completion: @escaping (Result<DataType>) -> Void)
}
