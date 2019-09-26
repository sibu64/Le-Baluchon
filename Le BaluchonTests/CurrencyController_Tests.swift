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
    
    var mainView = CurrencyView()
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func test_api_currency_call_success() {
        let fakeController = CurrencyViewControllerSuccess()
        fakeController.mainView = mainView
        fakeController.api = MockAPICurrencySuccess()
        fakeController.fetcher = MockFetcherAPICurrency(fetch: true)
        
        fakeController.viewDidLoad()
        fakeController.mainView?.actionCurrency(sender: UIButton())
        
        XCTAssertEqual(fakeController.model, Currency.fake)
    }
    
    func test_api_currency_call_failure() {
        let fakeController = CurrencyViewControllerFailure()
        fakeController.mainView = mainView
        fakeController.api = MockAPICurrencyFailure()
        fakeController.fetcher = MockFetcherAPICurrency(fetch: true)
        
        fakeController.viewDidLoad()
        fakeController.mainView?.actionCurrency(sender: UIButton())
        
        let error = fakeController.error!
        XCTAssertEqual((error as NSError).domain, "domain.com")
        XCTAssertEqual((error as NSError).code, 400)
    }
}

class CurrencyViewControllerSuccess: CurrencyViewController {
    private(set) var model: Currency?
    override func success(model: Currency) {
        self.model = model
    }
}

class CurrencyViewControllerFailure: CurrencyViewController {
    private(set) var error: Error?
    override func error(error: Error?) {
        self.error = error
    }
}

class MockAPICurrencySuccess: APICurrency {
    override func run(success: ((Currency) -> Void)?, failure: ((Error?) -> Void)?) {
        success?(Currency.fake)
    }
}

class MockAPICurrencyFailure: APICurrency {
    override func run(success: ((Currency) -> Void)?, failure: ((Error?) -> Void)?) {
        failure?(NSError(domain: "domain.com", code: 400, userInfo: nil))
    }
}

class MockFetcherAPICurrency: FetchCurrencyAPI {
    private(set) var fetch: Bool
    init(fetch: Bool) {
        self.fetch = fetch
    }
    
    override func shouldFetch() -> Bool {
        return fetch
    }
}
