//
//  APITranslate+Extension.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 19/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

extension APITranslate {
    
    func getFakeTranslate(completionHandler: @escaping (Foundation.Data?, URLResponse?, Error?) -> Void){
        apiTranslate = APITranslate()
        let request = APITranslate.buildRequest("","","")
        let weatherFakeData = TranslateFakeResponseData()
        apiTranslate?.session = URLSessionFake(data: weatherFakeData.weatherCorrectData, response: weatherFakeData.responseOK, error: nil)
        let task = apiTranslate?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeTranslateError(completionHandler: @escaping (Foundation.Data?, URLResponse?, Error?) -> Void){
        apiTranslate = APITranslate()
        let request = APITranslate.buildRequest("","","")
        let weatherFakeData = TranslateFakeResponseData()
        apiTranslate?.session = URLSessionFake(data: nil, response: nil, error: weatherFakeData.error)
        let task = apiTranslate?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeTranslateNoData(completionHandler: @escaping (Foundation.Data?, URLResponse?, Error?) -> Void){
        apiTranslate = APITranslate()
        let request = APITranslate.buildRequest("","","")
        apiTranslate?.session = URLSessionFake(data: nil, response: nil, error: nil)
        let task = apiTranslate?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeTranslateIncorrectData(completionHandler: @escaping (Foundation.Data?, URLResponse?, Error?) -> Void){
        apiTranslate = APITranslate()
        let request = APITranslate.buildRequest("","","")
        let weatherFakeData = TranslateFakeResponseData()
        apiTranslate?.session = URLSessionFake(data: weatherFakeData.weatherCorrectData, response: weatherFakeData.responseKO, error: nil)
        let task = apiTranslate?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
}
