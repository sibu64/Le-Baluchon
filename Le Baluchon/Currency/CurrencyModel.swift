//
//  CurrencyModel.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 09/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

struct Currency: Equatable {
    struct Rates: Decodable, Equatable {
        let USD: Double
    }
    
    let base: String
    let dateString: String
    let rates: Rates?
}
