//
//  CheckNetwork.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 27/08/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit
import Network

struct CheckNetwork {
    static let monitor = NWPathMonitor()
    
    static func isConnected(_ completion: ((Bool)->Void)?) {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                completion?(true)
            } else {
                completion?(false)
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}


extension UIViewController {
    func detectNetwork() {
        CheckNetwork.isConnected { value in
            if value == false {
                UIAlertWrapper.presentAlert(title: "Attention", message: "Aucune connexion internet", cancelButtonTitle: "OK")
            }
        }
    }
}
