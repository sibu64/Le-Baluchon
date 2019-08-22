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
    @IBOutlet weak private var firstButton: UIButton?
    @IBOutlet weak private var secondButton: UIButton?
    @IBOutlet weak private var firstTemperatureView: TemperatureView?
    @IBOutlet weak private var secondTemperatureView: TemperatureView?
    @IBOutlet weak private var firstLoader: UIActivityIndicatorView?
    @IBOutlet weak private var secondLoader: UIActivityIndicatorView?
    // Properties
    private var didActionFirstButton: (()->Void)?
    private var didActionSecondButton: (()->Void)?
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    override func awakeFromNib() {
        super.awakeFromNib()
        firstButton?.layer.cornerRadius = 8.0
        secondButton?.layer.cornerRadius = 8.0
    }
    
    func didActionFirstButton(_ completion: (()->Void)?) {
        didActionFirstButton = completion
    }
    
    func didActionSecondButton(_ completion: (()->Void)?) {
        didActionSecondButton = completion
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
            self.firstButton?.isHidden = true
        } else {
            self.firstLoader?.stopAnimating()
            self.firstButton?.isHidden = false
        }
    }
    
    func secondLoader(animated: Bool) {
        if animated {
            self.secondLoader?.startAnimating()
            self.secondButton?.isHidden = true
        } else {
            self.secondLoader?.stopAnimating()
            self.secondButton?.isHidden = false
        }
    }
    // ***********************************************
    // MARK: - Actions
    // ***********************************************
    @IBAction func actionFirstButton(sender: UIButton) {
        self.didActionFirstButton?()
    }
    
    @IBAction func actionSecondButton(sender: UIButton) {
        self.didActionSecondButton?()
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


