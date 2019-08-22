//
//  Le_BaluchonTests.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 11/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import XCTest
@testable import Le_Baluchon

class Le_BaluchonTests: XCTestCase {

    func testGetFakeWeatherData(){
        let expectation = XCTestExpectation(description: "fake weather")
    let api = APIWeather()
        api.getFakeWeather(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeWeatherDataError(){
        let expectation = XCTestExpectation(description: "fake weather")
        let api = APIWeather()
        api.getFakeWeatherError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNotNil(error)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeWeatherDataIncorrectData(){
        let expectation = XCTestExpectation(description: "fake weather")
        let api = APIWeather()
        api.getFakeWeatherError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            let httpResponse = response as? HTTPURLResponse
            XCTAssertNotEqual(httpResponse?.statusCode, 200)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetFakeWeatherNoData(){
        let expectation = XCTestExpectation(description: "fake weather")
        let api = APIWeather()
        api.getFakeWeatherError(completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            XCTAssertNil(data)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
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
