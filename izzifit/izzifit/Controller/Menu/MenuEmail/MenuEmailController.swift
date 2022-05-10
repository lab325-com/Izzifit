//
//  MenuEmailController.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import UIKit

class MenuEmailController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var goNextButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MenuPresenter(view: self)
    private let email: String?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(email: String?) {
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        emailField.text = email
        goNextButton.alpha = 0.5

        emailField.becomeFirstResponder()
        
        mainTitleLabel.text = RLocalization.onboarding_email_title()
        goNextButton.setTitle(RLocalization.menu_save_changes(), for: .normal)
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func textFieldChange(_ sender: UITextField) {
        goNextButton.alpha = sender.text!.count == 0 ? 0.5 : 1.0
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if emailField.text!.count > 0, emailField.text! != email {
            presenter.profileUpdate(email: emailField.text!)
        }
    }
}

//----------------------------------------------
// MARK: - MenuOutputProtocol
//----------------------------------------------

extension MenuEmailController: MenuOutputProtocol {
    func success() {
        actionBack()
    }
    
    func failure() {}
}
