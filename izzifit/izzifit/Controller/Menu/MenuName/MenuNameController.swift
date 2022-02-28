//
//  MenuNameController.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import UIKit

class MenuNameController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!

    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MenuPresenter(view: self)
    
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
        saveButton.alpha = 0.5

        nameField.becomeFirstResponder()
        nameTitleLabel.text = RLocalization.onboarding_name()
        saveButton.setTitle(RLocalization.menu_save_changes(), for: .normal)
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func textFieldChange(_ sender: UITextField) {
        if sender.text!.count > 9 {
            let text = nameField.text!
            nameField.text = String(text.dropLast())
        }
        saveButton.alpha = sender.text!.count == 0 ? 0.5 : 1.0
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if nameField.text!.count > 0 {
            presenter.profileUpdate(name: nameField.text!)
        }
    }
}

//----------------------------------------------
// MARK: - MenuOutputProtocol
//----------------------------------------------

extension MenuNameController: MenuOutputProtocol {
    func success() {
        actionBack()
    }
    
    func failure() {}
}
