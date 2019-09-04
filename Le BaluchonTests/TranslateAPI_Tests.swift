//
//  TranslateAPI_Tests.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 02/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import XCTest
@testable import Le_Baluchon

class TranslateAPI_Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetFakeTranslateData(){
        let expectation = XCTestExpectation(description: "fake translation")
        let api = APITranslate()
        api.getFakeTranslate(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeTranslateDataError(){
        let expectation = XCTestExpectation(description: "fake translation")
        let api = APITranslate()
        api.getFakeTranslateError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNotNil(error)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeTranslateDataIncorrectData(){
        let expectation = XCTestExpectation(description: "fake translation")
        let api = APITranslate()
        api.getFakeTranslateError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            let httpResponse = response as? HTTPURLResponse
            XCTAssertNotEqual(httpResponse?.statusCode, 200)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeTranslateNoData(){
        let expectation = XCTestExpectation(description: "fake translation")
        let api = APITranslate()
        api.getFakeTranslateError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNil(data)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }

}
