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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
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
            response: TranslateFakeResponseData.responseKO,
            error: TranslateFakeResponseData.error
        )
        
        var errorResponse: Error?
        http.run(success: nil) { error in
            errorResponse = error
        }
        
        XCTAssertEqual(errorResponse?.localizedDescription, "Error")
    }
    
    /*func testGetFakeCurrencyData(){
        let expectation = XCTestExpectation(description: "fake currency")
        let api = APICurrency()
        api.getFakeCurrency(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeCurrencyDataError(){
        let expectation = XCTestExpectation(description: "fake currency")
        let api = APICurrency()
        api.getFakeCurrencyError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNotNil(error)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeCurrencyDataIncorrectData(){
        let expectation = XCTestExpectation(description: "fake currency")
        let api = APICurrency()
        api.getFakeCurrencyError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            let httpResponse = response as? HTTPURLResponse
            XCTAssertNotEqual(httpResponse?.statusCode, 200)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeCurrencyNoData(){
        let expectation = XCTestExpectation(description: "fake currency")
        let api = APICurrency()
        api.getFakeCurrencyError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNil(data)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }*/

}
