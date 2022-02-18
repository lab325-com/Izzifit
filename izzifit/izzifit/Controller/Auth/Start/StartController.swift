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
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var mealsLabel: UILabel!
    @IBOutlet weak var plaingLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
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
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        loginLabel.text = RLocalization.login_button()
        mainLabel.text = RLocalization.login_title()
        
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
        guard let url = URL(string: "https://stackoverflow.com") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func actionTerms(_ sender: UIButton) {
        guard let url = URL(string: "https://stackoverflow.com") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        AuthRouter(presenter: navigationController).pushLogin()
    }
    
    @IBAction func actionStart(_ sender: UIButton) {
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
        OnboardingRouter(presenter: navigationController).pushName()
    }
}
