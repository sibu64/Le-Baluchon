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
    @IBOutlet weak var euroSum: UITextField?
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
        guard let euroValue = Double(euroSum!.text!) else { return }
        guard let rateUSD = model.rates?.USD else { return }
        let usdTotal = euroValue * rateUSD
        
        self.euroSum?.text = euroValue.toStringNumber(with: .EUR)
        self.usdLabel?.text = usdTotal.toStringNumber(with: .USD)
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
    
    func hideKeyboard() {
        euroSum?.resignFirstResponder()
    }
    // ***********************************************
    // MARK: - Actions
    // ***********************************************
    @IBAction func actionCurrency(sender: UIButton) {
        if euroSum?.text?.isEmpty == false {
            self.didCurrencyCallback?()
        }
    }

    @IBAction func actionHideKeyboard(sender: UITapGestureRecognizer) {
        self.hideKeyboard()
    }
}

extension Double {
    func toStringNumber(with currency: CurrencyStyle) ->String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: currency.rawValue)
        let priceString = currencyFormatter.string(from: NSNumber(value: self))!
        return priceString
    }
}

public enum CurrencyStyle: String {
    case EUR = "fr_FR"
    case USD = "en_US"
}
