//
//  QuizeNameController.swift
//  izzifit
//
//  Created by Andrey S on 15.02.2022.
//

import UIKit

class QuizeNameController: BaseController {
    
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
        
        AnalyticsHelper.sendFirebaseScreenEvent(screen: .onboarding_screen)
        AnalyticsHelper.sendFirebaseEvents(events: .open)
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        backButton.isHidden = isHiddenBackButton
        goNextButton.alpha = 0.5

        nameField.becomeFirstResponder()
        countLabel.text = RLocalization.onboarding_count(1, 9)
        nameTitleLabel.text = RLocalization.onboarding_name()
        goNextButton.setTitle(RLocalization.onboarding_go_next(), for: .normal)
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
            AnalyticsHelper.sendFirebaseEvents(events: .step, params: ["set_name": nameField.text!])
            AudioManager.sharedManager.playSound()
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setName(nameField.text!)
            PreferencesManager.sharedManager.tempPorifle = model
            
            OnboardingRouter(presenter: navigationController).pushGender()
        }
    }
}
