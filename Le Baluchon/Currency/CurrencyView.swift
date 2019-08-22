//
//  CurrencyView.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 23/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit

class CurrencyView: UIView {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    @IBOutlet weak var currencyButton: UIButton?
    @IBOutlet weak var usdLabel: UILabel?
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var loader: UIActivityIndicatorView?
    // Properties
    private var didCurrencyCallback: (()->Void)?
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    override func awakeFromNib() {
        super.awakeFromNib()
        currencyButton?.layer.cornerRadius = 8.0
    }
    
    func set(_ model: Currency) {
        guard let result = model.rates?.USD else { return }
        self.usdLabel?.text = result.usdFormat
        self.timeLabel?.text = "Mise à jour le \(model.dateString)"
    }
    
    func didCurrencyCallback(_ completion: (()->Void)?) {
        self.didCurrencyCallback = completion
    }
    
    func loader(_ animated: Bool) {
        if animated {
            loader?.startAnimating()
            currencyButton?.isHidden = true
        } else {
            loader?.stopAnimating()
            currencyButton?.isHidden = false
        }
    }
    // ***********************************************
    // MARK: - Actions
    // ***********************************************
    @IBAction func actionCurrency(sender: UIButton) {
        self.didCurrencyCallback?()
    }

}
