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

}
