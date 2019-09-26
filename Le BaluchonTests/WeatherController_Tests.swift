//
//  WeatherController_Tests.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 04/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
import XCTest
@testable import Le_Baluchon

class WeatherViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_weatherController_api_called_success() {
        let controller = WeatherViewControllerSuccess()
        controller.api = MockApiWeatherSuccess()
        
        controller.viewDidLoad()
        
        XCTAssertEqual(controller.modelNY, Weather.fake)
        XCTAssertEqual(controller.modelPau, Weather.fake)
    }
    
    func test_weatherController_api_called_failure() {
        let controller = WeatherViewControllerFailure()
        controller.api = MockApiWeatherFailure()
        
        controller.viewDidLoad()
        
        XCTAssertEqual((controller.error! as NSError).domain, "domain.com")
        XCTAssertEqual((controller.error! as NSError).code, 400)
    }
}

class WeatherViewControllerSuccess: WeatherViewController {
    private(set) var modelNY: Weather?
    private(set) var modelPau: Weather?
    override func successNY(model: Weather) {
        self.modelNY = model
    }
    
    override func successPau(model: Weather) {
        self.modelPau = model
    }
}

class WeatherViewControllerFailure: WeatherViewController {
    private(set) var error: Error?
    override func error(error: Error?) {
        self.error = error
    }
}

class MockApiWeatherSuccess: APIWeather {
    override func run(query: String, success: ((Weather) -> Void)?, failure: ((Error?) -> Void)?) {
        success?(Weather.fake)
    }
}

class MockApiWeatherFailure: APIWeather {
    override func run(query: String, success: ((Weather) -> Void)?, failure: ((Error?) -> Void)?) {
        let error = NSError(domain: "domain.com", code: 400, userInfo: nil)
        failure?(error)
    }
}
