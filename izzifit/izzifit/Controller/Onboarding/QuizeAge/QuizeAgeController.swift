//
//  QuizeAgeController.swift
//  izzifit
//
//  Created by mob325 on 15.02.2022.
//

import UIKit
import Lottie

class QuizeAgeController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var goNextButton: UIButton!
    
    @IBOutlet weak var energyLottieView: UIView!
    @IBOutlet weak var energyLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var animationEnergy: AnimationView?
    private lazy var presenterProfile = QuizeProgressPresenter(view: self)
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        let jsonName = "energy_anim"
        let animation = Animation.named(jsonName)
        animationEnergy = AnimationView(animation: animation)
        energyLottieView.addSubview(animationEnergy!)
        animationEnergy?.contentMode = .scaleAspectFit
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [weak self] in
            self?.animationEnergy?.play()
            self?.energyLabel.text = "6"
        }
        
        countLabel.text = RLocalization.onboarding_count(4, 9)
        mainTitleLabel.text = RLocalization.onboarding_age_title()
        goNextButton.setTitle(RLocalization.onboarding_go_next(), for: .normal)
        
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
            AnalyticsHelper.sendFirebaseEvents(events: .quiz_set_age)
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setAge(age)
            PreferencesManager.sharedManager.tempPorifle = model
            presenterProfile.profileUpdate()
            OnboardingRouter(presenter: navigationController).pushHeight()
        }
    }
}

//----------------------------------------------
// MARK: - QuizeProgressOutputProtocol
//----------------------------------------------

extension QuizeAgeController: QuizeProgressOutputProtocol {
    func success() {
        
    }
    
    func failure() {
        actionBack()
    }
}
