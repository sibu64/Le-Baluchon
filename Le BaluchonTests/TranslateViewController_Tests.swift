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
    
    var controller: TranslateController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: TranslateController = storyboard.instantiateViewController(withIdentifier: "translateViewController") as! TranslateController
        self.controller = viewController
        _ = self.controller.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_translateController_api_called_success() {
        self.controller.api = MockApiTranslateSuccess()
        
        self.controller.mainView?.sourceField?.text = "bonjour"
        self.controller.mainView?.actionTranslate()
        
        let model = self.controller.model
        let error = self.controller.error
        XCTAssertNotNil(model)
        XCTAssertNil(error)
    }
    
    func test_translateController_api_called_error() {
        self.controller.api = MockApiTranslateError()
        
        self.controller.mainView?.sourceField?.text = "bonjour"
        self.controller.mainView?.actionTranslate()
        
        let model = self.controller.model
        XCTAssertNil(model)
        let error = self.controller.error!
        XCTAssertEqual((error as NSError).code, 400)
        XCTAssertEqual((error as NSError).domain, "domain.com")
    }
}

class MockApiTranslateError: APITranslate {
    override func run(query: String, source: String, target: String, success: ((GoogleTranslateResponse) -> Void)?, failure: ((Error?) -> Void)?) {
        let error = NSError(domain: "domain.com", code: 400, userInfo: nil)
        failure?(error)
    }
}

class MockApiTranslateSuccess: APITranslate {
    override func run(query: String, source: String, target: String, success: ((GoogleTranslateResponse) -> Void)?, failure: ((Error?) -> Void)?) {
        let model = GoogleTranslateResponse(data: nil)
        success?(model)
    }
}
