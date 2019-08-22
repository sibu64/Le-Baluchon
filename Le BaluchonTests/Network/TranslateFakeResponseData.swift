//
//  TranslateFakeResponseData.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 08/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

class TranslateFakeResponseData {
    // MARK: - Data
    var weatherCorrectData: Foundation.Data? {
        let bundle = Bundle(for: type(of: self))
        
         let url = bundle.url(forResource: "Translate", withExtension: "json")
         do{
            return try Foundation.Data(contentsOf: url!)
        }catch{
            return nil
        }
        }
    
    
    // MARK: - Response
     let responseOK = HTTPURLResponse(
        url: URL(string: "https://translation.googleapis.com/language/translate/v2?key=AIzaSyBuyEIWZs6ErHmbXHcOo9T_UaJxlSPLSbw&q=Bonjour&target=en&source=fr")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
     let responseKO = HTTPURLResponse(
        url: URL(string: "https://translation.googleapis.com/language/translate/v2?key=AIzaSyBuyEIWZs6ErHmbXHcOo9T_UaJxlSPLSbw&q=Bonjour&target=en&source=fr")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    
    // MARK: - Error
    class TranslateError: Error {}
    let error = TranslateError()
}
