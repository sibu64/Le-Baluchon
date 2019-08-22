//
//  APIWeather+Extension.swift
//  Le BaluchonTests
//
//  Created by Darrieumerlou on 19/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

extension APIWeather {
    
    func getFakeWeather(completionHandler: @escaping (Foundation.Data?, URLResponse?, Error?) -> Void){
        apiWeather = APIWeather()
        let request = APIWeather.buildRequest("")
        let weatherFakeData = WeatherFakeResponseData()
        apiWeather?.session = URLSessionFake(data: weatherFakeData.weatherCorrectData, response: weatherFakeData.responseOK, error: nil)
        let task = apiWeather?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeWeatherError(completionHandler: @escaping (Foundation.Data?, URLResponse?, Error?) -> Void){
        apiWeather = APIWeather()
        let request = APIWeather.buildRequest("")
        let weatherFakeData = WeatherFakeResponseData()
        apiWeather?.session = URLSessionFake(data: nil, response: nil, error: weatherFakeData.error)
        let task = apiWeather?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeWeatherNoData(completionHandler: @escaping (Foundation.Data?, URLResponse?, Error?) -> Void){
        apiWeather = APIWeather()
        let request = APIWeather.buildRequest("")
        apiWeather?.session = URLSessionFake(data: nil, response: nil, error: nil)
        let task = apiWeather?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
    
    func getFakeWeatherIncorrectData(completionHandler: @escaping (Foundation.Data?, URLResponse?, Error?) -> Void){
        apiWeather = APIWeather()
        let request = APIWeather.buildRequest("")
        let weatherFakeData = WeatherFakeResponseData()
        apiWeather?.session = URLSessionFake(data: weatherFakeData.weatherCorrectData, response: weatherFakeData.responseKO, error: nil)
        let task = apiWeather?.session.dataTask(with: request, completionHandler: completionHandler)
        task?.resume()
    }
}
