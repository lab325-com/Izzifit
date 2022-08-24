//
//  WriteToUsController.swift
//  izzifit
//
//  Created by Andrey S on 16.03.2022.
//

import UIKit

class WriteToUsController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var subTItleLabel: UILabel!
    
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var placeholderProductLabel: UILabel!
    
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var mainViewText: UIView!
    
    @IBOutlet weak var placeholderLabel: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var textFieldProductName: UITextField!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = WriteToUsPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        correctionKeyboard = 44
        correctionHideKeyboard = 44
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        mainTitleLabel.text = RLocalization.write_to_us_title()
        placeholderLabel.text = RLocalization.write_to_us_comment()
        sendButton.setTitle(RLocalization.write_to_us_add_product(), for: .normal)
        
        placeholderProductLabel.text = RLocalization.write_to_us_product_name()
        subTItleLabel.text = RLocalization.write_to_us_subtitle()
        
        productView.layer.cornerRadius = 10
        productView.layer.borderWidth = 1
        productView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        
        setupTextView(hidden: true)
    }
    
    
    private func setupTextView(hidden: Bool) {
        if !hidden {
            sendButton.alpha = 1.0
            placeholderLabel.isHidden = true
            mainViewText.backgroundColor = UIColor.white
        } else {
            sendButton.alpha = 0.5
            mainViewText.backgroundColor = UIColor(rgb: 0xF1EFF5)
            placeholderLabel.isHidden = false
            mainViewText.layer.cornerRadius = 10
            mainViewText.layer.borderWidth = 1
            mainViewText.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        }
    }
    
    private func setupTextField(hidden: Bool) {
        if !hidden {
            sendButton.alpha = 1.0
            placeholderProductLabel.isHidden = true
            productView.backgroundColor = UIColor.white
        } else {
            sendButton.alpha = 0.5
            productView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            placeholderProductLabel.isHidden = false
            productView.layer.cornerRadius = 10
            productView.layer.borderWidth = 1
            productView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        }
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionProductChange(_ sender: UITextField) {
        setupTextField(hidden: false)
        
        sendButton.alpha = sender.text!.count > 0 ? 1.0 : 0.5
        
        if sender.text!.count > 300 {
            textFieldProductName.text = String(textFieldProductName.text!.dropLast())
        }
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionSend(_ sender: UIButton) {
        if mainTextView.text.count > 0, textFieldProductName.text!.count > 0 {
            AnalyticsHelper.sendFirebaseEvents(events: .dash_meal_food_add)
            presenter.sendProduct(name: textFieldProductName.text!, description: mainTextView.text)
        }
    }
}

//----------------------------------------------
// MARK: - UITextViewDelegate
//----------------------------------------------

extension WriteToUsController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        setupTextView(hidden: false)
        
        sendButton.alpha = textView.text.count > 0 ? 1.0 : 0.5
        
        if textView.text.count > 300 {
            textView.text = String(textView.text.dropLast())
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        setupTextView(hidden: false)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        setupTextView(hidden: mainTextView.text.count == 0)
    }
}

//----------------------------------------------
// MARK: - UITextFieldDelegate
//----------------------------------------------

extension WriteToUsController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setupTextField(hidden: false)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setupTextField(hidden: textField.text!.count == 0)
    }
}

//----------------------------------------------
// MARK: - WriteToUsOutputProtocol
//----------------------------------------------

extension WriteToUsController: WriteToUsOutputProtocol {
    func success() {
        AnalyticsHelper.sendFirebaseEvents(events: .dash_meal_food_add_true)
        actionBack()
    }
    
    func failure() {}
}

