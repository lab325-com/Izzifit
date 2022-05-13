//
//  QuizeSportController.swift
//  izzifit
//
//  Created by Andrey S on 16.02.2022.
//

import UIKit

enum QuizeSportType: Int, Codable {
    case newbie
    case regulary
    case professional
    case notAll
    
    var text: String {
        switch self {
        case .newbie:
            return RLocalization.onboarding_sport_newbie()
        case .regulary:
            return RLocalization.onboarding_sport_regulary()
        case .professional:
            return RLocalization.onboarding_sport_professional()
        case .notAll:
            return RLocalization.onboarding_sport_not_all()
        }
    }
    
    var image: UIImage {
        switch self {
        case .newbie:
            return RImage.onboarding_sport_newbie_ic()!
        case .regulary:
            return RImage.onboarding_sport_regulary_ic()!
        case .professional:
            return RImage.onboarding_sport_professional_ic()!
        case .notAll:
            return RImage.onboarding_sport_not_all_ic()!
        }
    }
    
    var api: DoSportType {
        switch self {
        case .newbie:
            return .doSportTypeNewbie
        case .regulary:
            return .doSportTypeRegular
        case .professional:
            return .doSportTypeProfessional
        case .notAll:
            return .doSportTypeNot
        }
    }
}

class QuizeSportController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet var imagesViews: [UIImageView]!
    @IBOutlet var textsLabels: [UILabel]!
    @IBOutlet var selectedImages: [UIImageView]!
    
    @IBOutlet weak var goNextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet var sportViews: [UIView]!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var type: QuizeSportType? {
        didSet {
            if type == oldValue {
                return
            }
            
            updateUI()
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        goNextButton.alpha = 0.5
        
        countLabel.text = RLocalization.onboarding_count(9, 9)
        titleLabel.text = RLocalization.onboarding_sport_title()
        goNextButton.setTitle(RLocalization.onboarding_go_next(), for: .normal)
        skipButton.setTitle(RLocalization.onboarding_food_skip(), for: .normal)
        
        for image in selectedImages {
            image.isHidden = true
        }
        
        for image in imagesViews {
            image.image = QuizeSportType(rawValue: image.tag)?.image
        }
        
        for textsLabel in textsLabels {
            textsLabel.text = QuizeSportType(rawValue: textsLabel.tag)?.text
        }
    }
    
    private func updateUI() {
        goNextButton.alpha = 1.0
        
        for image in selectedImages {
            image.isHidden = image.tag == type?.rawValue ? false : true
        }
        
        for foodView in sportViews {
            foodView.layer.borderWidth = 2
            if foodView.tag == type?.rawValue {
                foodView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            } else {
                foodView.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionNewbie(_ sender: UIButton) {
        type = .newbie
    }
    
    @IBAction func actionRegular(_ sender: UIButton) {
        type = .regulary
    }
    
    @IBAction func actionProfessional(_ sender: UIButton) {
        type = .professional
    }
    
    @IBAction func actionNotAll(_ sender: UIButton) {
        type = .notAll
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if let type = type {
            AnalyticsHelper.sendFirebaseEvents(events: .onb_set_activity)
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setSport(type)
            PreferencesManager.sharedManager.tempPorifle = model
            OnboardingRouter(presenter: navigationController).pushEmail()
        }
    }
    
    @IBAction func actionSkip(_ sender: UIButton) {
        AnalyticsHelper.sendFirebaseEvents(events: .onb_skip_step)
        var model = PreferencesManager.sharedManager.tempPorifle
        model.setSport(nil)
        PreferencesManager.sharedManager.tempPorifle = model
        OnboardingRouter(presenter: navigationController).pushEmail()
    }
}
