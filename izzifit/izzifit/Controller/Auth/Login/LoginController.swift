//
//  LoginController.swift
//  izzifit
//
//  Created by Andrey S on 09.02.2022.
//

import UIKit

class LoginController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var forgotButton: UIButton!
    
    @IBOutlet weak var privacyLabel: UILabel!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var eyeButton: UIButton!
    
    @IBOutlet weak var logInButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = LoginPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        correctionHideKeyboard = 30
        correctionKeyboard = 60
        hiddenNavigationBar = true
        super.viewDidLoad()
        
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        logInButton.alpha = 0.5
        
        mainTitleLabel.text = RLocalization.login_title()
        
        emailTextField.placeholder = RLocalization.login_email()
        passwordTextField.placeholder = RLocalization.login_password()
        
        forgotButton.setTitle(RLocalization.login_fogot_pass(), for: .normal)
        logInButton.setTitle(RLocalization.login_title(), for: .normal)
        
        emailView.layer.cornerRadius = 10
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        
        passwordView.layer.cornerRadius = 10
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        
        createPrivacyLabel()
    }
    
    private func createPrivacyLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56), .paragraphStyle: paragraphStyle]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x797889), .paragraphStyle: paragraphStyle]
        
        let attributedString1 = NSMutableAttributedString(string:RLocalization.login_by_continue(), attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString2 = NSMutableAttributedString(string:" \(RLocalization.login_privacy_policy())\n\(RLocalization.login_terms_use())", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        let attributedString3 = NSMutableAttributedString(string:" \( RLocalization.login_and()) ", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString4 = NSMutableAttributedString(string:RLocalization.login_terms_of_subscribe(), attributes:attrs2 as [NSAttributedString.Key : Any])
        
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        attributedString1.append(attributedString4)
        
        self.privacyLabel.attributedText = attributedString1
        privacyLabel.textAlignment = .center
        self.privacyLabel.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.privacyLabel.addGestureRecognizer(tapgesture)
    }
    
    private func checkingContinue() -> Bool {
        if emailTextField.text!.count > 2 && passwordTextField.text!.count > 2 {
            logInButton.alpha = 1.0
            return true
        } else {
            logInButton.alpha = 0.5
            return false
        }
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionForgotButton(_ sender: UIButton) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: RLocalization.login_forgot_title(), message: RLocalization.login_forgot_subTitle(), preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = RLocalization.login_email()
            textField = alertTextField
        }
        
        let actionCancel = UIAlertAction(title: RLocalization.login_forgot_cancel(), style: .default) { _ in }
        
        let actionSubmit = UIAlertAction(title: RLocalization.login_forgot_submit(), style: .default) { action in
            if let text = textField.text {
                self.presenter.forgotPasswordUpdate(email: text)
            }
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionSubmit)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionEye(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        let image = passwordTextField.isSecureTextEntry ? RImage.auth_note_see_pass_ic() : RImage.auth_see_pass_ic()
        eyeButton.setImage(image, for: .normal)
    }
    
    @IBAction func emailChange(_ sender: UITextField) {
        let _ = checkingContinue()
        if sender.text!.count > 0 {
            emailView.backgroundColor = UIColor.white
            emailView.layer.borderColor = UIColor(rgb: 0xB69EE9).cgColor
        } else {
            emailView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            emailView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        }
    }
    
    @IBAction func passwordChange(_ sender: UITextField) {
        let _ = checkingContinue()
        if sender.text!.count > 0 {
            passwordView.backgroundColor = UIColor.white
            passwordView.layer.borderColor = UIColor(rgb: 0xB69EE9).cgColor
        } else {
            passwordView.backgroundColor = UIColor(rgb: 0xF1EFF5)
            passwordView.layer.borderColor = UIColor(red: 0.879, green: 0.878, blue: 0.917, alpha: 1).cgColor
        }
    }
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = self.privacyLabel.text else { return }
        let privacyPolicyRange = (text as NSString).range(of: RLocalization.login_privacy_policy())
        let termsAndConditionRange = (text as NSString).range(of: RLocalization.login_terms_use())
        let termsAndSubscribeRange = (text as NSString).range(of: RLocalization.login_terms_of_subscribe())
        
        if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: privacyPolicyRange) {
            print("user tapped on privacy policy text")
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "privacy", "screen": "login"])
            guard let url = URL(string: "https://stackoverflow.com") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndConditionRange) {
            print("user tapped on terms and conditions text")
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "terms", "screen": "login"])
            guard let url = URL(string: "https://stackoverflow.com") else { return }
            UIApplication.shared.open(url)
        } else if gesture.didTapAttributedTextInLabel(label: self.privacyLabel, inRange: termsAndSubscribeRange) {
            print("user tapped on terms and subscribe text")
            AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "subscribe", "screen": "login"])
            guard let url = URL(string: "https://stackoverflow.com") else { return }
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        if checkingContinue() {
            presenter.login(email: emailTextField.text!, password: passwordTextField.text!)
        }
    }
}


//----------------------------------------------
// MARK: - LoginOutputProtocol
//----------------------------------------------

extension LoginController: LoginOutputProtocol {
    func successForgotPass() {
        
    }
    
    func successGoMain() {
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
    }
    
    func successGoOnboarding() {
        OnboardingRouter(presenter: navigationController).pushName()
    }
}
