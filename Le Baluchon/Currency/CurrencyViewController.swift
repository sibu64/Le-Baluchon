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
    var api: APICurrency = APICurrency()
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        let tap = UITapGestureRecognizer(target: self, action: #selector(CurrencyViewController.tapFunction))
        mainView?.euroSum?.isUserInteractionEnabled = true
        mainView?.euroSum?.addGestureRecognizer(tap)
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
    }
    
    
    
    private func load() {
        mainView?.loader(true)
        api.run(success: { model in
           self.success(model: model)
        }) { error in
          self.error(error: error)
        }
    }
    
    public func setUp(){
        self.detectNetwork()
        mainView?.didCurrencyCallback({
            if self.fetcher.shouldFetch() == true {
                self.load()
            }
        })

    }
    
    public func success(model: Currency){
        self.mainView?.loader(false)
        self.mainView?.set(model)
        self.fetcher.save()
    }
    
    public func error(error: Error?){
        self.mainView?.loader(false)
        self.mainView?.usdLabel?.text = "error"
        guard let err = error else { return }
        UIAlertWrapper.presentAlert(
            title: "Erreur",
            message: err.localizedDescription,
            cancelButtonTitle: "Ok"
        )
    }
    
}

