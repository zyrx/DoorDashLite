//
//  Double+Currency.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 18/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import Foundation

extension Double {
    static var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter
    }()
    
    public var currency: String? {
        return Double.currencyFormatter.string(from: self as NSNumber)
    }
}
