//
//  ViewController.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 11/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit

class TranslateController: UIViewController {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    @IBOutlet weak var mainView: TranslateView?
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    private func translate(query: String, from: String, to: String, completion: ((GoogleTranslateResponse)->Void)?) {
        self.mainView?.loader(true)
        APITranslate.run(query: query, source: from, target: to, success: { model in
            self.sucess(model: model, completion: completion)
        }, failure: { error in
            self.error(error: error)
        })
    }
    
    public func setUp(){
        mainView?.didTranslate({ source in
            guard let value = source else { return }
            self.translate(query: value, from: "fr", to: "en", completion: { model in
                let text = model.data?.translations?.first?.translatedText
                self.mainView?.set(valueTranslated: text)
            })
        })
    }
    
    public func sucess(model: GoogleTranslateResponse,completion: ((GoogleTranslateResponse)->Void)?){
        self.mainView?.loader(false)
        completion?(model)
    }
    
    public func error(error: Error?){
        self.mainView?.loader(false)
        self.mainView?.targetLabel?.text = "error"
        guard let err = error else { return }
        UIAlertWrapper.presentAlert(
            title: "Erreur",
            message: err.localizedDescription,
            cancelButtonTitle: "Ok"
        )
    }

}
