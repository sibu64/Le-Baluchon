//
//  TranslateView.swift
//  Le Baluchon
//
//  Created by Darrieumerlou on 15/07/2019.
//  Copyright © 2019 Darrieumerlou. All rights reserved.
//

import UIKit

class TranslateView: UIView {
    // ***********************************************
    // MARK: - Interface
    // ***********************************************
    @IBOutlet weak var sourceField: UITextView?
    @IBOutlet weak var targetLabel: UILabel?
    @IBOutlet weak var translateButton: UIButton?
    @IBOutlet weak var loader: UIActivityIndicatorView?
    // Properties
    private var didTranslateCallback: ((String?)->Void)?
    // ***********************************************
    // MARK: - Implementation
    // ***********************************************
    override func awakeFromNib() {
        super.awakeFromNib()
        translateButton?.layer.cornerRadius = 8.0
        sourceField?.delegate = self
        sourceField?.text = "Insérer une phrase ou un mot"
        sourceField?.textColor = UIColor.lightGray
    }
    
    func hideKeyboard() {
        sourceField?.resignFirstResponder()
    }
    
    func didTranslate(_ completion: ((String?)->Void)?) {
        self.didTranslateCallback = completion
    }
    
    func set(valueTranslated value: String?) {
        self.targetLabel?.text = value
    }
    
    func actionTranslate() {
        self.targetLabel?.text = nil
        let value = sourceField?.text
        didTranslateCallback?(value)
    }
    
    func loader(_ animated: Bool) {
        if animated {
            loader?.startAnimating()
            translateButton?.isHidden = true
        } else {
            loader?.stopAnimating()
            translateButton?.isHidden = false
        }
    }
    // ***********************************************
    // MARK: - Actions
    // ***********************************************
    @IBAction func actionTranslate(sender: UIButton) {
        if sourceField?.text?.isEmpty == false {
            self.actionTranslate()
        }
    }
    
    @IBAction func actionRemoveKeyboard(sender: UITapGestureRecognizer) {
        self.hideKeyboard()
    }
}

extension TranslateView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if sourceField?.textColor == UIColor.lightGray {
            sourceField?.text = ""
            sourceField?.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if sourceField?.text == "" {
            sourceField?.text = "Insérer une phrase ou un mot"
            sourceField?.textColor = UIColor.lightGray
        }
    }
}
