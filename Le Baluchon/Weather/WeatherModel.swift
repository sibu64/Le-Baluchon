//
//  WeatherModel.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 09/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation


public struct Weather: Decodable, Equatable {
    public struct Main: Decodable, Equatable {
        public let temp: Double
    }
    
    public struct WeatherValue: Decodable, Equatable {
        public let id: Int
    }
    
    public let main: Main
    public let weather: [WeatherValue]
}
