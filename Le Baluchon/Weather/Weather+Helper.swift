//
//  Weather+Helper.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 29/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import Foundation

public extension Weather {
     func imageToWeather() ->String {
        switch (weather.first!.id) {
            case 0...300: return "tstorm1"
            case 301...500: return "light_rain"
            case 501...600: return "shower3"
            case 601...700: return "snow4"
            case 701...771: return "fog"
            case 772...799: return "tstorm3"
            case 801...804 : return "cloudy"
            case 900...902, 905...1000: return "tstorm3"
            case 903: return "snow5"
            case 800, 904: return "sunny"
            default: return "dunno"
        }
    }
}

