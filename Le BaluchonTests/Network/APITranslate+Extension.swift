//
//  APITranslate+Extension.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 19/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
@testable import Le_Baluchon

extension APITranslate {
    
    func getFakeTranslate(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiTranslate = APITranslate()
        let request = APITranslate().buildRequest("","","")
        apiTranslate?.session = URLSessionFake(data: TranslateFakeResponseData.data, response: TranslateFakeResponseData.responseOK, error: nil)
        let task = apiTranslate?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeTranslateError(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiTranslate = APITranslate()
        let request = APITranslate().buildRequest("","","")
        apiTranslate?.session = URLSessionFake(data: nil, response: nil, error: TranslateFakeResponseData.error)
        let task = apiTranslate?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeTranslateNoData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiTranslate = APITranslate()
        let request = APITranslate().buildRequest("","","")
        apiTranslate?.session = URLSessionFake(data: nil, response: nil, error: nil)
        let task = apiTranslate?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeTranslateIncorrectData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiTranslate = APITranslate()
        let request = APITranslate().buildRequest("","","")
        apiTranslate?.session = URLSessionFake(data: TranslateFakeResponseData.data, response: TranslateFakeResponseData.responseKO, error: nil)
        let task = apiTranslate?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
}
