//
//  QuizeFoodController.swift
//  izzifit
//
//  Created by Andrey S on 16.02.2022.
//

import UIKit
import Lottie

class QuizeFoodController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var goNextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var energyLottieView: UIView!
    @IBOutlet weak var energyLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    private var animationEnergy: AnimationView?
    private lazy var presenterProfile = QuizeProgressPresenter(view: self)
    
    private lazy var presenter = QuizeFoodPresenter(view: self)
    
    private let cellIdentifier = String(describing: QuizeFoodCell.self)
    private var foodTypes: [FoodGroupModel] = PreferencesManager.sharedManager.foods ?? []
    private var selectedType: FoodGroupModel? {
        didSet {
            goNextButton.alpha = 1.0
        }
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        addTapOnScreen = false
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
            self?.energyLabel.text = "14"
        }
        
        presenter.getFoods()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        goNextButton.alpha = 0.5
        
        countLabel.text = RLocalization.onboarding_count(8, 9)
        titleLabel.text = RLocalization.onboarding_food_title()
        goNextButton.setTitle(RLocalization.onboarding_go_next(), for: .normal)
        skipButton.setTitle(RLocalization.onboarding_food_skip(), for: .normal)
        tableView.reloadData()
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
   
    @IBAction func actionGoNext(_ sender: UIButton) {
        if let type = selectedType {
            var model = PreferencesManager.sharedManager.tempPorifle
            model.setFood(type)
            PreferencesManager.sharedManager.tempPorifle = model
            AnalyticsHelper.sendFirebaseEvents(events: .quiz_set_diet)
            presenterProfile.profileUpdate()
            OnboardingRouter(presenter: navigationController).pushSport(isSkip: false)
        }
    }
    
    @IBAction func actionSkip(_ sender: UIButton) {
        AnalyticsHelper.sendFirebaseEvents(events: .quiz_skip_step)
        var model = PreferencesManager.sharedManager.tempPorifle
        model.setFood(nil)
        PreferencesManager.sharedManager.tempPorifle = model
        OnboardingRouter(presenter: navigationController).pushSport(isSkip: true)
    }
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension QuizeFoodController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? QuizeFoodCell else { return UITableViewCell() }
        cell.setupCell(model: foodTypes[indexPath.row], selected: selectedType?.id == foodTypes[indexPath.row].id)
        cell.delegate = self
        return cell
    }
}

//----------------------------------------------
// MARK: - QuizeFoodCellDelegate
//----------------------------------------------

extension QuizeFoodController: QuizeFoodCellDelegate {
    func quizeFoodCellSelected(cell: QuizeFoodCell, model: FoodGroupModel) {
        selectedType = model
        tableView.reloadData()
    }
}

//----------------------------------------------
// MARK: - QuizeFoodOutputProtocol
//----------------------------------------------

extension QuizeFoodController: QuizeFoodOutputProtocol {
    func successProducts(models: [ProductsMainModel]) {
        
    }
    
    func success(model: FoodGroupsModel) {
        foodTypes = model.foodGroups
        tableView.reloadData()
    }
    
    func failure() {
        actionBack()
    }
}


//----------------------------------------------
// MARK: - QuizeProgressOutputProtocol
//----------------------------------------------

extension QuizeFoodController: QuizeProgressOutputProtocol {
    func success() {
        
    }
}
