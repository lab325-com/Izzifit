//
//  MenuNameController.swift
//  izzifit
//
//  Created by mob325 on 23.02.2022.
//

import UIKit

class MenuNameController: BaseController, UITextFieldDelegate {
    
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
    private let name: String?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(name: String?) {
        self.name = name
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
        nameField.text = name
        
        saveButton.alpha = 0.5

        nameField.becomeFirstResponder()
        nameTitleLabel.text = RLocalization.onboarding_name()
        saveButton.setTitle(RLocalization.menu_save_changes(), for: .normal)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && string == " " { // prevent space on first character
            return false
        }
        
        if textField.text?.last == " " && string == " " { // allowed only single space
            return false
        }
        
        if string == " " { return true } // now allowing space between name
        
        if string.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil {
            return false
        }
        
        return true
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
        if nameField.text!.count > 0, name != nameField.text {
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
