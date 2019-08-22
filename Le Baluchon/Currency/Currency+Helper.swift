//
//  Currency+Helper.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 23/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

extension Double {
    var usdFormat: String? {
        // Number
        let number = NSNumber(value: self)
        // Formatter
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 6
        // Returns
        return formatter.string(from: number)
    }

}
