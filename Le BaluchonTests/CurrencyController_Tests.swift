//
//  CurrencyController_Tests.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 04/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
import XCTest

@testable import Le_Baluchon

class CurrencyViewControllerTests: XCTestCase {
    var controller: CurrencyViewController = CurrencyViewController()
    var mainView: CurrencyView = CurrencyView()
    
    override func setUp() {
        controller.mainView = self.mainView
        controller.fetcher.save(with: Date(timeIntervalSince1970:
            1536082364))
    }
    
    override func tearDown() {
    }
    
    func testViewControllerRun() {
        let expectation = XCTestExpectation(description: "fake currency")
        self.controller.setUp()
       
        controller.mainView?.actionCurrency(sender: UIButton())
        DispatchQueue.main.asyncAfter(deadline: .now()+10.00, execute:{
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.00)
    }
    
    func testViewControllerError(){
        self.controller.error(error: CurrencyFakeResponseData.CurrencyError())
    }
    
    func testHelper(){
        let test: Double = 42.00
        print(test.usdFormat as Any)
    }
}
