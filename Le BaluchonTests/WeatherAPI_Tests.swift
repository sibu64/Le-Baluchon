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
    
    func test_api_weather_call_success() {
        let http = APIWeather()
        http.session = URLSessionFake(
            data: WeatherFakeResponseData.data,
            response: WeatherFakeResponseData.responseOK,
            error: nil
        )
        
        var modelResponse: Weather?
        http.run(query: "q", success: { model in
            modelResponse = model
        }, failure: nil)
        
        XCTAssertEqual(modelResponse, Weather.fake)
    }
    
    func test_api_weather_call_failure() {
        let http = APIWeather()
        http.session = URLSessionFake(
            data: nil,
            response: WeatherFakeResponseData.responseKO,
            error: WeatherFakeResponseData.error
        )
        
        var errorResponse: Error?
        http.run(query: "q", success: nil) { error in
            errorResponse = error
        }
        
        XCTAssertEqual(errorResponse?.localizedDescription, "Error")
    }

    /*func testGetFakeWeatherData(){
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
    }*/

}
