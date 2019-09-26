//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 25/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var mainView: WeatherView?
    
    var api: APIWeather = APIWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        
    }
    
    public func setUp(){
        self.detectNetwork()
        
        self.mainView?.firstLoader(animated: true)
        self.load(name: "Pau", success: { model in
            self.successPau(model: model)
        })
        
        self.mainView?.secondLoader(animated: true)
        self.load(name: "New York", success: { model in
            self.successNY(model: model)
        })
    }

    private func load(name: String, success: ((Weather)->Void)?) {
        api.run(query: name, success: success) { error in
         self.error(error: error)
        }
    }
    
    public func successNY(model: Weather) {
        self.mainView?.secondLoader(animated: false)
        self.mainView?.setSecond(model)
    }
    
    public func successPau(model: Weather) {
        self.mainView?.firstLoader(animated: false)
        self.mainView?.setFirst(model)
    }
    
    public func error(error: Error?) {
        self.mainView?.firstLoader(animated: false)
        self.mainView?.secondLoader(animated: false)
        self.mainView?.firstTemperatureView?.temperatureLabel?.text = "error"
        guard let err = error else { return }
        UIAlertWrapper.presentAlert(
            title: "Erreur",
            message: err.localizedDescription,
            cancelButtonTitle: "Ok"
        )
    }
    
}
