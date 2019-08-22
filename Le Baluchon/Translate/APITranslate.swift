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
    
    static func run(
        query: String,
        source: String,
        target: String,
        success: ((GoogleTranslateResponse)->Void)?,
        failure: ((Error?)->Void)?) {
        let session = URLSession(configuration: .default)
        
        let request = buildRequest(query, source, target)
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
                //print(String(data: value, encoding: .utf8))
                let model = try JSONDecoder().decode(GoogleTranslateResponse.self, from: value)
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
    static internal func buildRequest(_ query: String, _ source: String, _ target: String) ->URLRequest {
        let urlString = "https://translation.googleapis.com/language/translate/v2"
        var urlComponents = URLComponents(string: urlString)!
        
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "key", value: "AIzaSyBuyEIWZs6ErHmbXHcOo9T_UaJxlSPLSbw"))
        queryItems.append(URLQueryItem(name: "q", value: query))
        queryItems.append(URLQueryItem(name: "target", value: target))
        queryItems.append(URLQueryItem(name: "source", value: source))
        urlComponents.queryItems = queryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        return urlRequest
    }
}

struct GoogleTranslateResponse: Decodable {
    public let data: Data?
}

struct Data: Decodable {
    let translations: [Translation]?
}

struct Translation: Decodable {
    let translatedText: String
}

