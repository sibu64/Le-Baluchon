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
    // Properties
    var fetcher = FetchCurrencyAPI()
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView?.didCurrencyCallback({
            if self.fetcher.shouldFetch() == true {
                self.load()
            }
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
            self.fetcher.save()
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

