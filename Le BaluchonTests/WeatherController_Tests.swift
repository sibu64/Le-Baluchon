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
    var label: UILabel = UILabel()
    
    override func setUp() {
        controller.mainView = self.mainView
        self.temperatureView.temperatureLabel = self.label
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
        resultTest()
    }
    
    func testViewControllerError(){
        self.controller.error(error: WeatherFakeResponseData.WeatherError())
        XCTAssert(self.controller.mainView?.firstTemperatureView?.temperatureLabel?.text == "error")
        
    }
    
//    func testHelper(){
//        do{
//let model = try JSONDecoder().decode(Weather.self, from: WeatherFakeResponseData().weatherCorrectData!)
//model.imageToWeather()
//        }catch{}
//    }
    
    
    //then: He should see the temperature
    func resultTest(){
        XCTAssertNotNil(temperatureView.temperatureLabel?.text)
        XCTAssertNotEqual(0, temperatureView.temperatureLabel?.text?.count ?? 0)
        
    }
    
}
