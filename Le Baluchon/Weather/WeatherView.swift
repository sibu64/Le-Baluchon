//
//  WeatherView.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 25/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    @IBOutlet weak public var firstTemperatureView: TemperatureView?
    @IBOutlet weak public var secondTemperatureView: TemperatureView?
    @IBOutlet weak private var firstLoader: UIActivityIndicatorView?
    @IBOutlet weak private var secondLoader: UIActivityIndicatorView?
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setFirst(_ weather: Weather) {
        self.firstTemperatureView?.set(with: weather)
    }
    
    func setSecond(_ weather: Weather) {
        self.secondTemperatureView?.set(with: weather)
    }
    
    func firstLoader(animated: Bool) {
        if animated {
            self.firstLoader?.startAnimating()
        } else {
            self.firstLoader?.stopAnimating()
        }
    }
    
    func secondLoader(animated: Bool) {
        if animated {
            self.secondLoader?.startAnimating()
        } else {
            self.secondLoader?.stopAnimating()
        }
    }
}

class TemperatureView: UIView {
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var temperatureLabel: UILabel?
    
    func set(with weather: Weather) {
        self.imageView?.image = UIImage(named: weather.imageToWeather())
        self.temperatureLabel?.text = "\(weather.main.temp)°C"
    }
}


