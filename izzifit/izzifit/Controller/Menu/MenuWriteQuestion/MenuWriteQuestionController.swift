//
//  MenuWriteQuestionController.swift
//  izzifit
//
//  Created by Andrey S on 01.03.2022.
//

import UIKit

class MenuWriteQuestionController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var mainViewText: UIView!
    
    @IBOutlet weak var placeholderLabel: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MenuWriteQuestionPresenter(view: self)
    
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
        mainTitleLabel.text = RLocalization.menu_write_us_title()
        placeholderLabel.text = RLocalization.menu_write_us_plcaheloder()
        sendButton.setTitle(RLocalization.menu_write_us_send(), for: .normal)
        
        emailLabel.text = KeychainService.standard.me?.email ?? ""
        
        emailView.layer.cornerRadius = 10
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        
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
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionSend(_ sender: UIButton) {
        if mainTextView.text.count > 0 {
            guard let email = KeychainService.standard.me?.email else { return }
            presenter.sendQuestion(email: email, message: mainTextView.text)
        }
    }
}

//----------------------------------------------
// MARK: - UITextViewDelegate
//----------------------------------------------

extension MenuWriteQuestionController: UITextViewDelegate {
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
// MARK: - MenuWriteQuestionOutputProtocol
//----------------------------------------------

extension MenuWriteQuestionController: MenuWriteQuestionOutputProtocol {
    func success() {
        actionBack()
    }
    
    func failure() {}
}
