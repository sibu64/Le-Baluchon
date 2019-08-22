//
//  CurrencyViewController.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 23/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    @IBOutlet weak var mainView: CurrencyView?
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView?.didCurrencyCallback({
            self.load()
        })
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    private func load() {
        mainView?.loader(true)
        APICurrency.run(success: { model in
            self.mainView?.loader(false)
            self.mainView?.set(model)
        }) { error in
            self.mainView?.loader(false)
            guard let err = error else { return }
            UIAlertWrapper.presentAlert(
                title: "Erreur",
                message: err.localizedDescription,
                cancelButtonTitle: "Ok"
            )
        }
    }
}

