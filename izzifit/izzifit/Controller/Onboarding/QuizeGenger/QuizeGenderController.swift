//
//  QuizeGenderController.swift
//  izzifit
//
//  Created by Andrey S on 15.02.2022.
//

import UIKit
import Lottie

enum GenderPlanType: Codable {
    case female
    case male
    case other
    
    var api: GenderType {
        switch self {
        case .female:
            return .genderTypeWoman
        case .male:
            return .genderTypeMan
        case .other:
            return .genderTypeCommon
        }
    }
}

class QuizeGenderController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var femaleLabel: UILabel!
    @IBOutlet weak var maleLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    
    @IBOutlet weak var femaleView: UIView!
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var otherView: UIView!
    
    @IBOutlet weak var getPlanButton: UIButton!
    @IBOutlet weak var energyLottieView: UIView!
    @IBOutlet weak var energyLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var type: GenderPlanType? {
        didSet {
            changeGender()
        }
    }
    private var animationEnergy: AnimationView?
    private lazy var presenter = QuizeProgressPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Lie cycle
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
        
        
        let jsonName = "energy_anim"
        let animation = Animation.named(jsonName)
        animationEnergy = AnimationView(animation: animation)
        energyLottieView.addSubview(animationEnergy!)
        animationEnergy?.contentMode = .scaleAspectFit
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [weak self] in
            self?.animationEnergy?.play()
            self?.energyLabel.text = "2"
        }
        
        countLabel.text = RLocalization.onboarding_count(2, 9)
        mainTitle.text = RLocalization.onboarding_gender_title()
        femaleLabel.text = RLocalization.onboarding_female()
        maleLabel.text = RLocalization.onboarding_male()
        otherLabel.text = RLocalization.onboarding_other()
        
        getPlanButton.setTitle("Go next", for: .normal)
        
        femaleView.layer.borderWidth = 2
        maleView.layer.borderWidth = 2
        otherView.layer.borderWidth = 2
        
        changeGender()
    }
    
    
    private func changeGender() {
        getPlanButton.alpha = 1.0
        switch type {
        case .female:
            
            femaleView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            maleView.layer.borderColor = UIColor.clear.cgColor
            otherView.layer.borderColor = UIColor.clear.cgColor
            
        case .male:
            femaleView.layer.borderColor = UIColor.clear.cgColor
            maleView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            otherView.layer.borderColor = UIColor.clear.cgColor
        case .other:
            femaleView.layer.borderColor = UIColor.clear.cgColor
            maleView.layer.borderColor = UIColor.clear.cgColor
            otherView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
        default:
            getPlanButton.alpha = 0.5
            femaleView.layer.borderColor = UIColor.clear.cgColor
            maleView.layer.borderColor = UIColor.clear.cgColor
            otherView.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    
    //----------------------------------------------
    // MARK: - Action
    //----------------------------------------------
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionFemale(_ sender: UIButton) {
        type = .female
    }
    
    @IBAction func actionMale(_ sender: UIButton) {
        type = .male
    }
    
    @IBAction func actionOther(_ sender: UIButton) {
        type = .other
    }
    
    @IBAction func actionGetPlan(_ sender: UIButton) {
        if let type = type {
            AnalyticsHelper.sendFirebaseEvents(events: .onb_set_gender)
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setGender(type)
            PreferencesManager.sharedManager.tempPorifle = model
            presenter.profileUpdate()
            OnboardingRouter(presenter: navigationController).pushGoal()
        }
    }
}

//----------------------------------------------
// MARK: - QuizeProgressOutputProtocol
//----------------------------------------------

extension QuizeGenderController: QuizeProgressOutputProtocol {
    func success() {
        
    }
    
    func failure() {
        actionBack()
    }
}
