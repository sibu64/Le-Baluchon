//
//  TranslateAPI_Tests.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 02/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import XCTest
@testable import Le_Baluchon

class TranslateAPI_Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_api_translate_call_success() {
        let http = APITranslate()
        http.session = URLSessionFake(
            data: Data.from("Translate"),
            response: TranslateFakeResponseData.responseOK,
            error: nil
        )
        
        var modelResponse: GoogleTranslateResponse?
        http.run(query: "query", source: "fr", target: "fr", success: { model in
            modelResponse = model
        }, failure: nil)
        
        XCTAssertEqual(modelResponse, GoogleTranslateResponse.fake)
    }

    func test_api_translate_call_failure() {
       let http = APITranslate()
        http.session = URLSessionFake(
            data: nil,
            response: TranslateFakeResponseData.responseKO,
            error: TranslateFakeResponseData.error
        )
        
        var errorResponse: Error?
        http.run(query: "a", source: "a", target: "a", success: nil) { error in
            errorResponse = error
        }
        
        XCTAssertEqual(errorResponse?.localizedDescription, "Error")
    }
}
