//
//  QuizeEmailController.swift
//  izzifit
//
//  Created by Andrey S on 16.02.2022.
//

import UIKit

class QuizeEmailController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var goNextButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        addTapOnScreen = false
        correctionKeyboard = 24
        super.viewDidLoad()

        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        goNextButton.alpha = 0.5

        emailField.becomeFirstResponder()
        
        if let me = KeychainService.standard.me, let email = me.email, email != nil {
            emailField.text = email
        }
        
        mainTitleLabel.text = RLocalization.onboarding_email_title()
        goNextButton.setTitle(RLocalization.onboarding_email_get_plan(), for: .normal)
    }
    
    private func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func textFieldChange(_ sender: UITextField) {
        if textFieldValidatorEmail( emailField.text!) && sender.text!.count != 0 {
            goNextButton.alpha = 1.0
        } else {
            goNextButton.alpha = 0.5
        }
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if emailField.text!.count > 0, textFieldValidatorEmail( emailField.text!) {
            AnalyticsHelper.sendFirebaseEvents(events: .onb_set_email)
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setEmail(emailField.text!)
            PreferencesManager.sharedManager.tempPorifle = model
            
            OnboardingRouter(presenter: navigationController).pushProgress()
        }
    }
}
