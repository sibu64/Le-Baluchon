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
    
    var controller: WeatherViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: WeatherViewController = storyboard.instantiateViewController(withIdentifier: "weatherViewController") as! WeatherViewController
        self.controller = viewController
        //_ = self.controller.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_weatherController_api_called_success() {
        self.controller.api = MockApiWeatherSuccess()
        self.controller.viewDidLoad()
        
        let weatherPau = self.controller.weatherPau
        let weatherNY = self.controller.weatherNY
        
        let error = self.controller.error
        XCTAssertNotNil(weatherPau)
        XCTAssertNotNil(weatherNY)
        XCTAssertNil(error)
    }
    
    func test_weatherController_api_called_failure() {
        self.controller.api = MockApiWeatherFailure()
        self.controller.viewDidLoad()
        
        let weatherPau = self.controller.weatherPau
        let weatherNY = self.controller.weatherNY
        XCTAssertNil(weatherPau)
        XCTAssertNil(weatherNY)
        
        let error = self.controller.error!
        XCTAssertEqual((error as NSError).code, 400)
        XCTAssertEqual((error as NSError).domain, "domain.com")
    }
    
    /*func test_weather() {
        let fakeController = FakeWeatherController()
        fakeController.api = MockApiWeatherFailure()
        fakeController.viewDidLoad()
        
        XCTAssertEqual(fakeController.errorCountCalled, 2)
    }*/
}

class MockApiWeatherSuccess: APIWeather {
    override func run(query: String, success: ((Weather) -> Void)?, failure: ((Error?) -> Void)?) {
        let data = WeatherFakeResponseData().weatherCorrectData
        let model = try! JSONDecoder().decode(Weather.self, from: data!)
        success?(model)
    }
}

class MockApiWeatherFailure: APIWeather {
    override func run(query: String, success: ((Weather) -> Void)?, failure: ((Error?) -> Void)?) {
        let error = NSError(domain: "domain.com", code: 400, userInfo: nil)
        failure?(error)
    }
}

/*class FakeWeatherController: WeatherViewController {
    private(set) var errorCountCalled = 0
    override func error(error: Error?) {
        self.errorCountCalled += 1
    }
}*/
