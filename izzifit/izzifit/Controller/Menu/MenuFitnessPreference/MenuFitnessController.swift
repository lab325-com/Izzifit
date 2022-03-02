//
//  MenuFitnessController.swift
//  izzifit
//
//  Created by Andrey S on 01.03.2022.
//

import UIKit

class MenuFitnessController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MenuPresenter(view: self)
    private lazy var presenterFitness = MenuFitnessPresenter(view: self)
    
    private let cellIdentifier = String(describing: QuizeFoodCell.self)
    private let cellTitleIdentifier = String(describing: MenuFoodTitleCellCell.self)
    private let cellSwitcherIdentifier = String(describing: MenuFoodSwitchCell.self)
    
    private let allFitness = FitnessPreferenceType.allCases
    private var selectedType: FitnessPreferenceType? = KeychainService.standard.me?.fitnessPreference {
        didSet {
            if selectedMuscles.count == 0 && selectedType == nil {
                saveButton.alpha = 0.5
            } else {
                saveButton.alpha = 1.0
            }
        }
    }
    private var muscles: [MusclesMainModel] = []
    private var selectedMuscles: Set<MusclesMainModel> = [] {
        didSet {
            if selectedMuscles.count == 0 && selectedType == nil {
                saveButton.alpha = 0.5
            } else {
                saveButton.alpha = 1.0
            }
        }
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
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        
        presenterFitness.getMuscles()
        
        saveButton.alpha = 0.5
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellTitleIdentifier, bundle: nil), forCellReuseIdentifier: cellTitleIdentifier)
        tableView.register(UINib(nibName: cellSwitcherIdentifier, bundle: nil), forCellReuseIdentifier: cellSwitcherIdentifier)
        
        nameTitleLabel.text = RLocalization.menu_fitness()
        saveButton.setTitle(RLocalization.menu_save_changes(), for: .normal)
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionGoNext(_ sender: UIButton) {
        if let type = selectedType {
            presenter.profileUpdate(fitnessPreference: type)
        } else if selectedMuscles.count > 0 {
            presenterFitness.
        }
    }
}



//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension MenuFitnessController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFitness.count + 2 + muscles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellTitleIdentifier) as? MenuFoodTitleCellCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.setupCell(title: RLocalization.menu_fitness_leve())
            return cell
        case 1..<allFitness.count + 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? QuizeFoodCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.setupCellFitness(type: allFitness[indexPath.row - 1], selected: selectedType == allFitness[indexPath.row - 1])
            cell.delegate = self
            return cell
        case allFitness.count + 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellTitleIdentifier) as? MenuFoodTitleCellCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.setupCell(title: RLocalization.menu_fitness_problem())
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSwitcherIdentifier) as? MenuFoodSwitchCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            cell.setupCellMuscle(model: muscles[indexPath.row - (allFitness.count + 2)])
            cell.delegate = self
            return cell
        }
    }
}

//----------------------------------------------
// MARK: - MenuFitnessOutputProtocol
//----------------------------------------------

extension MenuFitnessController: MenuFitnessOutputProtocol {
    func success(models: [MusclesMainModel]) {
        muscles = models
        tableView.reloadData()
    }
    
    func failure() {
        
    }
}

//----------------------------------------------
// MARK: - MenuOutputProtocol
//----------------------------------------------

extension MenuFitnessController: MenuOutputProtocol {
    func success() {
        
    }
}

//----------------------------------------------
// MARK: - MenuFoodSwitchDelegate
//----------------------------------------------

extension MenuFitnessController: MenuFoodSwitchDelegate {
    func menuFoodSwitchMusclee(cell: MenuFoodSwitchCell, model: MusclesMainModel) {
        if selectedMuscles.contains(model) {
            selectedMuscles.remove(model)
        } else {
            selectedMuscles.insert(model)
        }
    }
}

//----------------------------------------------
// MARK: - QuizeFoodCellDelegate
//----------------------------------------------

extension MenuFitnessController: QuizeFoodCellDelegate {
    func quizeFoodCellSelectedFitness(cell: QuizeFoodCell, type: FitnessPreferenceType) {
        selectedType = type
        tableView.reloadData()
    }
}
