//
//  WeatherFakeResponseData.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 08/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation
@testable import Le_Baluchon

extension Weather {
    static func fake(with data: Data?) ->Weather? {
        guard let value = data else { return nil }
        return try! JSONDecoder().decode(Weather.self, from: value)
    }
}

extension Weather {
    static var fake: Weather {
        let data = WeatherFakeResponseData.data
        return Weather.fake(with: data)!
    }
}

class WeatherFakeResponseData {
    // MARK: - Data
    static var data: Data? {
        let data = Data.from("Weather")
        return data
    }
    
    
    // MARK: - Response
     static let responseOK = HTTPURLResponse(
        url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=New_York,us&appid=abf6fdfc30264a6ecfc02cd694b725d3")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
     static let responseKO = HTTPURLResponse(
        url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=New_York,us&appid=abf6fdfc30264a6ecfc02cd694b725d3")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    
    // MARK: - Error
    static let error = NSError(domain: "weather.error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Error"])
}
