//
//  MenuAgeController.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import UIKit

class MenuAgeController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var goNextButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MenuPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        addTapOnScreen = false
        correctionKeyboard = 25
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        mainTitleLabel.text = RLocalization.onboarding_age_title()
        goNextButton.setTitle(RLocalization.menu_save_changes(), for: .normal)
        
        ageTextField.becomeFirstResponder()
        updateUI()
    }
    
    private func updateUI() {
        if ageTextField.text?.count == 2, let age = Int(ageTextField.text!), age <= 80, age >= 18 {
            goNextButton.alpha = 1.0
        } else {
            goNextButton.alpha = 0.5
        }
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionChangeAge(_ sender: UITextField) {
        if sender.text!.count > 2 {
            let text = ageTextField.text!
            ageTextField.text = String(text.dropLast())
        } else if sender.text?.count == 2, let age = Int(sender.text!), age > 80 || age < 18 {
            let text = ageTextField.text!
            ageTextField.text = String(text.dropLast())
        }
        
        updateUI()
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if sender.alpha == 1.0, let age = Int(ageTextField.text!) {
            presenter.profileUpdate(age: age)
        }
    }
}

//----------------------------------------------
// MARK: - MenuOutputProtocol
//----------------------------------------------

extension MenuAgeController: MenuOutputProtocol {
    func success() {
        actionBack()
    }
    
    func failure() {}
}
