//
//  TranslateFakeResponseData.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 08/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
@testable import Le_Baluchon

extension GoogleTranslateResponse {
    static func fake(with data: Data?) ->GoogleTranslateResponse? {
        guard let value = data else { return nil }
        return try! JSONDecoder().decode(GoogleTranslateResponse.self, from: value)
    }
}

extension GoogleTranslateResponse {
    static var fake: GoogleTranslateResponse {
        let data = TranslateFakeResponseData.data
        return GoogleTranslateResponse.fake(with: data)!
    }
}

extension Bundle {
    static var bundle:Bundle? = {
        let testBundle = Bundle.allBundles
        
        let testTarget = testBundle.filter({ value -> Bool in
            value.bundleURL.lastPathComponent == "Le BaluchonTests.xctest"
        }).first!
        
        let bundle = Bundle(identifier: testTarget.bundleIdentifier!)
        return bundle
    }()
}

extension Data {
    static func from(_ ressource: String) -> Data {
        let path = Bundle.bundle?.path(forResource: ressource, ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
    }
}

class TranslateFakeResponseData {
    // MARK: - Data
    static var data: Data {
        let data = Data.from("Translate")
        return data
    }
    
    static var model: GoogleTranslateResponse? {
        let data = Data.from("Translate")
        return GoogleTranslateResponse.fake(with: data)
    }
    
    
    // MARK: - Response
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://translation.googleapis.com/language/translate/v2?key="+Constantes.google_api_key+"&q=Bonjour&target=en&source=fr")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://translation.googleapis.com/language/translate/v2?key="+Constantes.google_api_key+"&q=Bonjour&target=en&source=fr")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    
    // MARK: - Error
    
    static let error = NSError(domain: "translate.error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Error"])
}
