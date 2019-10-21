//
//  ShouldFetchCurrencyAPI.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 27/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

class FetchCurrencyAPI {
    let DATE_KEY = "dateKey"
    let userDefault = UserDefaults.standard
    
    func save(with date: Date = Date()) {
        userDefault.set(date, forKey: DATE_KEY)
        userDefault.synchronize()
    }
    
    func shouldFetch() ->Bool {
        guard let date = userDefault.object(forKey: DATE_KEY) as? Date else {
            return true
        }

        if let hour = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour {
            return hour > 24
        }
        return true
    }
}
