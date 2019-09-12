//
//  TranslateModel.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 09/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

struct GoogleTranslateResponse: Decodable {
    public let data: Data?
}

struct Data: Decodable {
    let translations: [Translation]?
}

struct Translation: Decodable {
    let translatedText: String
}
