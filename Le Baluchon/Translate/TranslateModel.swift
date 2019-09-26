//
//  TranslateModel.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 09/09/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

struct GoogleTranslateResponse: Decodable, Equatable {
    public let data: TranslateInfo?
}

struct TranslateInfo: Decodable, Equatable {
    let translations: [Translation]?
}

struct Translation: Decodable, Equatable {
    let translatedText: String
}
