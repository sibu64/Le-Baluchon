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
    var controller: WeatherViewController = WeatherViewController()
    var mainView: WeatherView = WeatherView()
    var temperatureView: TemperatureView = TemperatureView()
    
    override func setUp() {
        controller.mainView = self.mainView
        controller.mainView?.firstTemperatureView = self.temperatureView
        controller.mainView?.secondTemperatureView = self.temperatureView
    }
    
    override func tearDown() {
    }
    
    func testViewControllerRun() {
        let expectation = XCTestExpectation(description: "fake weather")
        self.controller.setUp()
       
        DispatchQueue.main.asyncAfter(deadline: .now()+10.00, execute:{
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.00)
    }
    
    func testViewControllerError(){
        self.controller.error(error: WeatherFakeResponseData.WeatherError())
    }
    
    func testHelper(){
        do{
let model = try JSONDecoder().decode(Weather.self, from: WeatherFakeResponseData().weatherCorrectData!)
model.imageToWeather()
        }catch{}
    }
}
