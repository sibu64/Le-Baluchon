//
//  CurrencyFakeResponseData.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 08/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

class CurrencyFakeResponseData {
    // MARK: - Data
    var currencyCorrectData: Foundation.Data? {
        let bundle = Bundle(for: type(of: self))
        
        let url = bundle.url(forResource: "Currency", withExtension: "json")
        do{
            return try Foundation.Data(contentsOf: url!)
        }catch{
            return nil
        }
    }
    
    
    // MARK: - Response
    let responseOK = HTTPURLResponse(
        url: URL(string: "http://data.fixer.io/api/latest?access_key=6d7719c7c18c4bac22c93fae44f9c4b5&base=EUR&symbols=USD")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
    let responseKO = HTTPURLResponse(
        url: URL(string: "http://data.fixer.io/api/latest?access_key=6d7719c7c18c4bac22c93fae44f9c4b5&base=EUR&symbols=USD")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    
    // MARK: - Error
    class CurrencyError: Error {}
    let error = CurrencyError()
}
