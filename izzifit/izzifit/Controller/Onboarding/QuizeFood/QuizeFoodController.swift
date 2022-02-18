//
//  QuizeFoodController.swift
//  izzifit
//
//  Created by Andrey S on 16.02.2022.
//

import UIKit

enum QuizeFoodType: Int, Codable {
    case classic
    case keto
    case pesc
    case vegetarian
    case vegan
    
    var text: String {
        switch self {
        case .classic:
            return RLocalization.onboarding_food_classic()
        case .keto:
            return RLocalization.onboarding_food_keto()
        case .pesc:
            return RLocalization.onboarding_food_pesca()
        case .vegetarian:
            return RLocalization.onboarding_food_vegan()
        case .vegan:
            return RLocalization.onboarding_food_classic()
        }
    }
    
    var image: UIImage {
        switch self {
        case .classic:
            return RImage.onboarding_food_classic_ic()!
        case .keto:
            return RImage.onboarding_food_keto_ic()!
        case .pesc:
            return RImage.onboarding_food_pesca_ic()!
        case .vegetarian:
            return RImage.onboarding_food_vegetarian_ic()!
        case .vegan:
            return RImage.onboarding_food_vegan_ic()!
        }
    }
}

class QuizeFoodController: BaseController {

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
    
    @IBOutlet var foodViews: [UIView]!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var type: QuizeFoodType? {
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
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        goNextButton.alpha = 0.5
        
        countLabel.text = RLocalization.onboarding_count(8, 9)
        titleLabel.text = RLocalization.onboarding_food_title()
        goNextButton.setTitle(RLocalization.onboarding_go_next(), for: .normal)
        skipButton.setTitle(RLocalization.onboarding_food_skip(), for: .normal)
        
        for image in selectedImages {
            image.isHidden = true
        }
        
        for image in imagesViews {
            image.image = QuizeFoodType(rawValue: image.tag)?.image
        }
        
        for textsLabel in textsLabels {
            textsLabel.text = QuizeFoodType(rawValue: textsLabel.tag)?.text
        }
    }
    
    private func updateUI() {
        goNextButton.alpha = 1.0
        
        for image in selectedImages {
            image.isHidden = image.tag == type?.rawValue ? false : true
        }
        
        for foodView in foodViews {
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
    
    @IBAction func actionClassic(_ sender: UIButton) {
        type = .classic
    }
    
    @IBAction func actionKeto(_ sender: UIButton) {
        type = .keto
    }
    
    @IBAction func actionPesc(_ sender: UIButton) {
        type = .pesc
    }
    
    @IBAction func actionVegetarian(_ sender: UIButton) {
        type = .vegetarian
    }
    
    @IBAction func actionVegan(_ sender: UIButton) {
        type = .vegan
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if let type = type {
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setFood(type)
            PreferencesManager.sharedManager.tempPorifle = model
            OnboardingRouter(presenter: navigationController).pushSport()
        }
    }
    
    @IBAction func actionSkip(_ sender: UIButton) {
        var model = PreferencesManager.sharedManager.tempPorifle
        model.setFood(nil)
        PreferencesManager.sharedManager.tempPorifle = model
        OnboardingRouter(presenter: navigationController).pushSport()
    }
}

