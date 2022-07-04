//
//  QuizeNameController.swift
//  izzifit
//
//  Created by Andrey S on 15.02.2022.
//

import UIKit

class QuizeNameController: BaseController, UITextFieldDelegate {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var goNextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let isHiddenBackButton: Bool
    private lazy var presenter = QuizeProgressPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(isHiddenBackButton: Bool = false) {
        self.isHiddenBackButton = isHiddenBackButton
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        
        AnalyticsHelper.sendFirebaseEvents(events: .onb_start)
        backButton.isHidden = isHiddenBackButton
        goNextButton.alpha = 0.5

        nameField.becomeFirstResponder()
        countLabel.text = RLocalization.onboarding_count(1, 9)
        nameTitleLabel.text = RLocalization.onboarding_name()
        goNextButton.setTitle(RLocalization.onboarding_go_next(), for: .normal)
        
        
        if PreferencesManager.sharedManager.preOnboardingRemote?.afterPogess == false, let screen =  PreferencesManager.sharedManager.preOnboardingRemote?.screen {
            switch screen {
            case .video:
                OnboardingRouter(presenter: navigationController).presentVideo(delegate: self)
            }
        }
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
        goNextButton.alpha = sender.text!.count == 0 ? 0.5 : 1.0
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if nameField.text!.count > 0 {
            AnalyticsHelper.sendFirebaseEvents(events: .onb_set_name)
            
            AudioManager.sharedManager.playSound()
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setName(nameField.text!)
            PreferencesManager.sharedManager.tempPorifle = model
            
            presenter.profileUpdate()
            
            OnboardingRouter(presenter: navigationController).pushGender()
        }
    }
}

//----------------------------------------------
// MARK: - QuizeVideoPotocol
//----------------------------------------------

extension QuizeNameController: QuizeVideoPotocol {
    func quizeVideoEnd(contoller: QuizeVideoController) {
        
    }
}

//----------------------------------------------
// MARK: - QuizeProgressOutputProtocol
//----------------------------------------------

extension QuizeNameController: QuizeProgressOutputProtocol {
    func success() {
        
    }
    
    func failure() {
        actionBack()
    }
}
