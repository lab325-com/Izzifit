//
//  StartController.swift
//  izzifit
//
//  Created by Andrey S on 15.02.2022.
//

import UIKit

class StartController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var mealsLabel: UILabel!
    @IBOutlet weak var plaingLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = StartPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
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
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 1).cgColor
        
        loginButton.setTitle(RLocalization.login_button(), for: .normal)
        mainLabel.text = RLocalization.login_title_update()
        
        workoutLabel.text = RLocalization.login_workouts()
        mealsLabel.text = RLocalization.login_meals()
        plaingLabel.text = RLocalization.login_playing()
        
        startButton.setTitle(RLocalization.login_start(), for: .normal)
        termsButton.setTitle(RLocalization.login_terms(), for: .normal)
        privacyButton.setTitle(RLocalization.login_privacy(), for: .normal)
    }
    
    //----------------------------------------------
    // MARK: - Action
    //----------------------------------------------
    
    @IBAction func actionPrivacy(_ sender: UIButton) {
        AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "privacy", "screen": "start"])
        guard let url = URL(string: "https://mob325.com/izzifit/privacy_policy.html") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func actionTerms(_ sender: UIButton) {
        AnalyticsHelper.sendFirebaseEvents(events: .other_legal_open, params: ["open": "terms", "screen": "start"])
        guard let url = URL(string: "https://mob325.com/izzifit/terms_and_conditions.html") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        AuthRouter(presenter: navigationController).pushLogin()
    }
    
    @IBAction func actionStart(_ sender: UIButton) {
        AnalyticsHelper.sendFirebaseEvents(events: .login_skip)
        AudioManager.sharedManager.playSound()
        presenter.login()
    }
}

//----------------------------------------------
// MARK: - StartOutputProtocol
//----------------------------------------------

extension StartController: StartOutputProtocol {
    func successGoMain() {
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
    }
    
    func successGoOnboarding() {
        OnboardingRouter(presenter: navigationController).pushSwipe()
    }
}
