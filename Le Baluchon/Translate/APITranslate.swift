//
//  Translate_network_manager.swift
//  
//
//  Created by Darrieumerlou on 17/07/2019.
//

import Foundation

class APITranslate {
    static let shared: APITranslate? = nil
    
    var session = URLSession(configuration: .default)
    var apiTranslate = APITranslate.shared
    
    /// Lauching of the API
    func run(
        query: String,
        source: String,
        target: String,
        success: ((GoogleTranslateResponse)->Void)?,
        failure: ((Error?)->Void)?) {
        
        let request = buildRequest(query, source, target)
        session.dataTask(with: request) { data, response, error in
            guard let value = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode,
                error == nil else {
                    self.queue { failure?(error) }
                    return
            }
            
            do {
                let model = try JSONDecoder().decode(GoogleTranslateResponse.self, from: value)
                self.queue { success?(model) }
            } catch let err {
                self.queue { failure?(err) }
            }
            
        }.resume()
    }
    
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    internal func buildRequest(_ query: String, _ source: String, _ target: String) ->URLRequest {
        let urlString = "https://translation.googleapis.com/language/translate/v2"
        var urlComponents = URLComponents(string: urlString)!
        
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "key", value: Constants.google_api_key))
        queryItems.append(URLQueryItem(name: "q", value: query))
        queryItems.append(URLQueryItem(name: "target", value: target))
        queryItems.append(URLQueryItem(name: "source", value: source))
        urlComponents.queryItems = queryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        return urlRequest
    }
}

extension APITranslate {
    func queue(completion: @escaping ()->Void) {
        Thread.isMainThread ? completion() : DispatchQueue.main.async(execute: completion)
    }
}
