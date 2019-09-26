//
//  APICurrency.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 17/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

extension Currency: Decodable {
    enum CurrencyKeys: String, CodingKey {
        case dateString = "date"
        case base, rates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CurrencyKeys.self)
        self.base = try container.decode(String.self, forKey: .base)
        self.dateString = try container.decode(String.self, forKey: .dateString)
        self.rates = try? container.decode(Currency.Rates.self, forKey: .rates)
    }
}

class APICurrency {
    static let shared: APICurrency? = nil
    
    var session = URLSession(configuration: .default)
    var apiCurrency = APICurrency.shared
    
    func run(success: ((Currency)->Void)?, failure: ((Error?)->Void)?) {
        let request = buildRequest()
        session.dataTask(with: request) { data, response, error in
            guard let value = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode,
                error == nil else {
                    self.queue { failure?(error) }
                    return
            }
            
            do {
                let model = try JSONDecoder().decode(Currency.self, from: value)
                self.queue { success?(model) }
            } catch let err {
                self.queue { failure?(err) }
            }
            
            }.resume()
    }
    
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    internal func buildRequest() ->URLRequest {
        let urlString = "http://data.fixer.io/api/latest?access_key=6d7719c7c18c4bac22c93fae44f9c4b5&base=EUR&symbols=USD"
        
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}

extension APICurrency {
    func queue(completion: @escaping ()->Void) {
        Thread.isMainThread ? completion() : DispatchQueue.main.async(execute: completion)
    }
}
