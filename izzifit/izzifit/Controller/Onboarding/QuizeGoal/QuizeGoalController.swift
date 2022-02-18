//
//  QuizeQoalController.swift
//  izzifit
//
//  Created by Andrey S on 15.02.2022.
//

import UIKit

enum QuizeGoalType: Codable {
    case keepFit
    case loseWeight
    case muscle
    case justPlay
    
    var text: String {
        switch self {
        case .keepFit:
            return RLocalization.onboarding_goal_keep_fit()
        case .loseWeight:
            return RLocalization.onboarding_goal_lose_weight()
        case .muscle:
            return RLocalization.onboarding_goal_muscle()
        case .justPlay:
            return RLocalization.onboarding_goal_just_play()
        }
    }
    
    var api: GoalType {
        switch self {
        case .keepFit:
            return .goalTypeFit
        case .loseWeight:
            return .goalTypeLoseWeight
        case .muscle:
            return .goalTypeMuscle
        case .justPlay:
            return .goalTypeFun
        }
    }
}

class QuizeGoalController: BaseController {
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var keepFitButton: UIButton!
    @IBOutlet weak var loseWeightButton: UIButton!
    @IBOutlet weak var muscleButton: UIButton!
    @IBOutlet weak var justPlayButton: UIButton!
    
    private var goalType: QuizeGoalType? {
        didSet {
            updateType()
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setGoal(goalType!)
            PreferencesManager.sharedManager.tempPorifle = model
            
            OnboardingRouter(presenter: navigationController).pushAge()
        }
    }
    
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
        updateType()
        
        countLabel.text = RLocalization.onboarding_count(3, 9)
        mainTitleLabel.text = RLocalization.onboarding_goal_title()
        
        keepFitButton.setTitle(QuizeGoalType.keepFit.text, for: .normal)
        loseWeightButton.setTitle(QuizeGoalType.loseWeight.text, for: .normal)
        muscleButton.setTitle(QuizeGoalType.muscle.text, for: .normal)
        justPlayButton.setTitle(QuizeGoalType.justPlay.text, for: .normal)
    }
    
    private func updateType() {
        
        keepFitButton.layer.borderWidth = 2
        loseWeightButton.layer.borderWidth = 2
        muscleButton.layer.borderWidth = 2
        justPlayButton.layer.borderWidth = 2
        
        keepFitButton.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        loseWeightButton.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        muscleButton.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        justPlayButton.layer.borderColor = UIColor(red: 0.799, green: 0.745, blue: 0.913, alpha: 1).cgColor
        
        keepFitButton.setTitleColor(UIColor(rgb: 0x3F3E56), for: .normal)
        loseWeightButton.setTitleColor(UIColor(rgb: 0x3F3E56), for: .normal)
        muscleButton.setTitleColor(UIColor(rgb: 0x3F3E56), for: .normal)
        justPlayButton.setTitleColor(UIColor(rgb: 0x3F3E56), for: .normal)
        
        keepFitButton.backgroundColor = UIColor.clear
        loseWeightButton.backgroundColor = UIColor.clear
        muscleButton.backgroundColor = UIColor.clear
        justPlayButton.backgroundColor = UIColor.clear
        
        switch goalType {
        case .keepFit:
            keepFitButton.setTitleColor(UIColor.white, for: .normal)
            keepFitButton.backgroundColor = UIColor(rgb: 0xFF42A8)
            keepFitButton.layer.borderColor = UIColor.clear.cgColor
        case .loseWeight:
            loseWeightButton.setTitleColor(UIColor.white, for: .normal)
            loseWeightButton.backgroundColor = UIColor(rgb: 0xFF42A8)
            loseWeightButton.layer.borderColor = UIColor.clear.cgColor
        case .muscle:
            muscleButton.setTitleColor(UIColor.white, for: .normal)
            muscleButton.backgroundColor = UIColor(rgb: 0xFF42A8)
            muscleButton.layer.borderColor = UIColor.clear.cgColor
        case .justPlay:
            justPlayButton.setTitleColor(UIColor.white, for: .normal)
            justPlayButton.backgroundColor = UIColor(rgb: 0xFF42A8)
            justPlayButton.layer.borderColor = UIColor.clear.cgColor
        default:
            break
        }
    }
    
    //----------------------------------------------
    // MARK: - Action
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionFit(_ sender: Any) {
        goalType = .keepFit
    }
    
    @IBAction func actionLoseWeight(_ sender: Any) {
        goalType = .loseWeight
    }
    
    @IBAction func actionMuscle(_ sender: Any) {
        goalType = .muscle
    }
    
    @IBAction func actionJustPlay(_ sender: Any) {
        goalType = .justPlay
    }
}
