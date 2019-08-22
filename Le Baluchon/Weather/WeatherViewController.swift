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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        mainView?.didActionFirstButton({
            self.mainView?.firstLoader(animated: true)
            self.load(name: "Pau", success: { model in
                self.mainView?.firstLoader(animated: false)
                self.mainView?.setFirst(model)
            })
        })
        
        mainView?.didActionSecondButton({
            self.mainView?.secondLoader(animated: true)
            self.load(name: "New York", success: { model in
                self.mainView?.secondLoader(animated: false)
                self.mainView?.setSecond(model)
            })
        })
    }

    private func load(name: String, success: ((Weather)->Void)?) {
        let apiWeather = APIWeather()
        apiWeather.run(query: name, success: success) { error in
            self.mainView?.firstLoader(animated: false)
            self.mainView?.secondLoader(animated: false)
            guard let err = error else { return }
            UIAlertWrapper.presentAlert(
                title: "Erreur",
                message: err.localizedDescription,
                cancelButtonTitle: "Ok"
            )
        }
    }
    
}
