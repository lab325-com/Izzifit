//
//  QuizeFoodController.swift
//  izzifit
//
//  Created by Andrey S on 16.02.2022.
//

import UIKit

class QuizeFoodController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var goNextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: QuizeFoodCell.self)
    private let foodTypes = KeychainService.standard.me?.FoodGroup ?? []
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
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
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
