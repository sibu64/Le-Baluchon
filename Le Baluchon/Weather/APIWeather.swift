//
//  APIWeather.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 24/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

public struct Weather: Decodable {
    public struct Main: Decodable {
        public let temp: Double
    }
    
    public struct WeatherValue: Decodable {
        public let id: Int
    }
    
    public let main: Main
    public let weather: [WeatherValue]
}

class APIWeather {
    
    static let shared: APIWeather? = nil
    
    var session = URLSession(configuration: .default)
    var apiWeather = APIWeather.shared
    
    
      func run(
        query: String,
        success: ((Weather)->Void)?,
        failure: ((Error?)->Void)?) {
        
        let request = APIWeather.buildRequest(query)
        session.dataTask(with: request) { data, response, error in
            guard let value = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode,
                error == nil else {
                    OperationQueue.main.addOperation {
                        failure?(error)
                    }
                    return
            }
            
            do {
                let model = try JSONDecoder().decode(Weather.self, from: value)
                OperationQueue.main.addOperation {
                    success?(model)
                }
            } catch let err {
                OperationQueue.main.addOperation {
                    failure?(err)
                }
            }
            
            }.resume()
    }
    
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    static internal func buildRequest(_ query: String) ->URLRequest {
        let urlString = "https://api.openweathermap.org/data/2.5/weather"
        var urlComponents = URLComponents(string: urlString)!
        
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "appid", value: Constantes.weather_api_key))
        queryItems.append(URLQueryItem(name: "q", value: query))
        queryItems.append(URLQueryItem(name: "units", value: "metric"))
        urlComponents.queryItems = queryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}


