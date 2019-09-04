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
    
    func testGetFakeCurrencyData(){
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
    }

}
