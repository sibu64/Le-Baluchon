//
//  APIWeather.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 24/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

class APIWeather {
    
    //static let shared: APIWeather? = nil
    
    var session = URLSession(configuration: .default)
    //var apiWeather = APIWeather.shared
    
    func run(
        query: String,
        success: ((Weather)->Void)?,
        failure: ((Error?)->Void)?) {
        
        let request = buildRequest(query)
        session.dataTask(with: request) { data, response, error in
            guard let value = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode,
                error == nil else {
                    self.queue { failure?(error) }
                    return
            }
            
            do {
                let model = try JSONDecoder().decode(Weather.self, from: value)
                self.queue { success?(model) }
            } catch let err {
                self.queue { failure?(err) }
            }
            
            }.resume()
    }
    
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    internal func buildRequest(_ query: String) ->URLRequest {
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

extension APIWeather {
    func queue(completion: @escaping ()->Void) {
        Thread.isMainThread ? completion() : DispatchQueue.main.async(execute: completion)
    }
}

