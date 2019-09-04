//
//  WeatherAPI_Tests.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 02/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import XCTest
@testable import Le_Baluchon

class WeatherAPI_Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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

}
