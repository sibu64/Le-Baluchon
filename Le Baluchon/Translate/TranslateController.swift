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
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView?.didTranslate({ source in
            guard let value = source else { return }
            self.translate(query: value, from: "fr", to: "en", completion: { model in
                let text = model.data?.translations?.first?.translatedText
                self.mainView?.set(valueTranslated: text)
            })
        })
    }
    // ***********************************************
    // MARK: - Private Methods
    // ***********************************************
    private func translate(query: String, from: String, to: String, completion: ((GoogleTranslateResponse)->Void)?) {
        self.mainView?.loader(true)
        APITranslate.run(query: query, source: from, target: to, success: { model in
            self.mainView?.loader(false)
            completion?(model)
        }, failure: { error in
            self.mainView?.loader(false)
            guard let err = error else { return }
            UIAlertWrapper.presentAlert(
                title: "Erreur",
                message: err.localizedDescription,
                cancelButtonTitle: "Ok"
            )
        })
    }

}
