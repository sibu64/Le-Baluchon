//
//  WeatherFakeResponseData.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 08/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

class WeatherFakeResponseData {
    // MARK: - Data
    var weatherCorrectData: Foundation.Data? {
        let bundle = Bundle(for: type(of: self))
        
         let url = bundle.url(forResource: "Weather", withExtension: "json")
         do{
            return try Foundation.Data(contentsOf: url!)
        }catch{
            return nil
        }
        }
    
    
    // MARK: - Response
     let responseOK = HTTPURLResponse(
        url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=New_York,us&appid=abf6fdfc30264a6ecfc02cd694b725d3")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
     let responseKO = HTTPURLResponse(
        url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=New_York,us&appid=abf6fdfc30264a6ecfc02cd694b725d3")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    
    // MARK: - Error
    class WeatherError: Error {}
    let error = WeatherError()
}
