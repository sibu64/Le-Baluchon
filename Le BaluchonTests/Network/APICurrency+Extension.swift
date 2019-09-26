//
//  APICurrency+Extension.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 19/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
@testable import Le_Baluchon

extension APICurrency {
    
    func getFakeCurrency(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiCurrency = APICurrency()
        let request = buildRequest()
        apiCurrency?.session = URLSessionFake(data: CurrencyFakeResponseData.data, response: CurrencyFakeResponseData.responseOK, error: nil)
        let task = apiCurrency?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeCurrencyError(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiCurrency = APICurrency()
        let request = buildRequest()
        apiCurrency?.session = URLSessionFake(data: nil, response: nil, error: CurrencyFakeResponseData.error)
        let task = apiCurrency?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeCurrencyNoData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiCurrency = APICurrency()
        let request = buildRequest()
        apiCurrency?.session = URLSessionFake(data: nil, response: nil, error: nil)
        let task = apiCurrency?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeCurrencyIncorrectData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiCurrency = APICurrency()
        let request = buildRequest()
        apiCurrency?.session = URLSessionFake(data: CurrencyFakeResponseData.data, response: CurrencyFakeResponseData.responseKO, error: nil)
        let task = apiCurrency?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
}
