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
    var label: UILabel = UILabel()
    
    //given: the user open the curencyViewCOntroller
    override func setUp() {
        controller.mainView = self.mainView
        controller.mainView?.usdLabel = self.label
        controller.fetcher.save(with: Date(timeIntervalSince1970:
            1536082364))
    }
    
    override func tearDown() {
    }
    //when: click on the UIBUtton to get the currency
    func testViewControllerRun() {
        let expectation = XCTestExpectation(description: "fake currency")
        self.controller.setUp()
       
        controller.mainView?.actionCurrency(sender: UIButton())
        DispatchQueue.main.asyncAfter(deadline: .now()+10.00, execute:{
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.00)
        resultTest()
    }
    
    func testViewControllerError(){
        self.controller.error(error: CurrencyFakeResponseData.CurrencyError())
        XCTAssert(self.controller.mainView?.usdLabel?.text == "error")
    }
    
    func testHelper(){
        let test: Double = 42.00
        print(test.usdFormat as Any)
    }
    
    //then: He should see the currency rate
    func resultTest(){
       XCTAssertNotNil(mainView.usdLabel?.text)
       XCTAssertNotEqual(0, mainView.usdLabel?.text?.count ?? 0)
        
    }
}
