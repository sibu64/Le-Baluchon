//
//  TranslateController_Tests.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 04/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
import XCTest

@testable import Le_Baluchon

class TranslateViewControllerTests: XCTestCase {
    var controller: TranslateController = TranslateController()
    var mainView: TranslateView = TranslateView()
    var sourceField: UITextView = UITextView()
    
    override func setUp() {
        controller.mainView = self.mainView
        self.mainView.sourceField = self.sourceField
        self.mainView.sourceField?.text = "Bonjour, comment ça va?"
        
    }
    
    override func tearDown() {
    }
    
    func testTranslateViewControllerRun() {
        let expectation = XCTestExpectation(description: "fake translate")
        self.controller.setUp()
       
        controller.mainView?.actionTranslate(sender: UIButton())
        DispatchQueue.main.asyncAfter(deadline: .now()+10.00, execute:{
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.00)
    }
    
    func testTranslateViewControllerError(){
        self.controller.error(error: TranslateFakeResponseData.TranslateError())
    }
    
    func testTranslateView(){
        self.controller.mainView?.actionRemoveKeyboard(sender: UITapGestureRecognizer())
        self.controller.mainView?.textViewDidEndEditing(self.sourceField)
        self.controller.mainView?.textViewDidBeginEditing(self.sourceField)
        
    }
}