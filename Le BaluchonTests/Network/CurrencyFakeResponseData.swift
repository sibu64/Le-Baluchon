//
//  CurrencyFakeResponseData.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 08/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
@testable import Le_Baluchon

extension Currency {
    static func fake(with data: Data?) ->Currency? {
        guard let value = data else { return nil }
        return try! JSONDecoder().decode(Currency.self, from: value)
    }
}

extension Currency {
    static var fake: Currency {
        let data = CurrencyFakeResponseData.data
        return Currency.fake(with: data)!
    }
}


class CurrencyFakeResponseData {
    // MARK: - Data
    static var data: Data? {
        let data = Data.from("Currency")
        return data
    }
    
    
    // MARK: - Response
    static let responseOK = HTTPURLResponse(
        url: URL(string: "http://data.fixer.io/api/latest?access_key=6d7719c7c18c4bac22c93fae44f9c4b5&base=EUR&symbols=USD")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
    static let responseKO = HTTPURLResponse(
        url: URL(string: "http://data.fixer.io/api/latest?access_key=6d7719c7c18c4bac22c93fae44f9c4b5&base=EUR&symbols=USD")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    
    // MARK: - Error
    static let error = NSError(domain: "currency.error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Error"])
}
