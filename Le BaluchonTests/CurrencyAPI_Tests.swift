//
//  CurrencyAPI_Tests.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 02/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import XCTest
@testable import Le_Baluchon

class CurrencyAPI_Tests: XCTestCase {

    override func setUp() {}
        
    override func tearDown() {}
    
    func test_api_currency_call_success() {
        let http = APICurrency()
        http.session = URLSessionFake(
            data: Data.from("Currency"),
            response: CurrencyFakeResponseData.responseOK,
            error: nil
        )
        
        var modelResponse: Currency?
        http.run(success: { model in
            modelResponse = model
        }, failure: nil)
        
        XCTAssertEqual(modelResponse, Currency.fake)
    }
    
    func test_api_currency_call_failure() {
        let http = APICurrency()
        http.session = URLSessionFake(
            data: nil,
            response: CurrencyFakeResponseData.responseKO,
            error: CurrencyFakeResponseData.error
        )
        
        var errorResponse: Error?
        http.run(success: nil) { error in
            errorResponse = error
        }
        
        XCTAssertEqual(errorResponse?.localizedDescription, "Error")
    }
}
