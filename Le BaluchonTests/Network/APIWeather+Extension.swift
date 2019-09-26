//
//  APIWeather+Extension.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 19/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
@testable import Le_Baluchon

extension APIWeather {
    
    func getFakeWeather(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiWeather = APIWeather()
        let request = buildRequest("")
        apiWeather?.session = URLSessionFake(data: WeatherFakeResponseData.data, response: WeatherFakeResponseData.responseOK, error: nil)
        let task = apiWeather?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeWeatherError(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiWeather = APIWeather()
        let request = buildRequest("")
        apiWeather?.session = URLSessionFake(data: nil, response: nil, error: WeatherFakeResponseData.error)
        let task = apiWeather?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeWeatherNoData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiWeather = APIWeather()
        let request = buildRequest("")
        apiWeather?.session = URLSessionFake(data: nil, response: nil, error: nil)
        let task = apiWeather?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeWeatherIncorrectData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        apiWeather = APIWeather()
        let request = buildRequest("")
        apiWeather?.session = URLSessionFake(data: WeatherFakeResponseData.data, response: WeatherFakeResponseData.responseKO, error: nil)
        let task = apiWeather?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
}
