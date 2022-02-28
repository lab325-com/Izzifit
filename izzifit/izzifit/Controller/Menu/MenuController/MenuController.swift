//
//  MenuController.swift
//  izzifit
//
//  Created by Andrey S on 21.02.2022.
//

import UIKit

enum SettingsType: Int, CaseIterable {
    case name
    case age
    case email
    case height
    case weight
    case targetWeight
    case foodPreferences
    case fitnessPreferences
    case language
    case notification
    case reminders
    
    var text: String {
        switch self {
        case .name:
            return RLocalization.menu_name()
        case .age:
            return RLocalization.menu_age()
        case .email:
            return RLocalization.menu_email()
        case .height:
            return RLocalization.menu_height()
        case .weight:
            return RLocalization.menu_weight()
        case .targetWeight:
            return RLocalization.menu_target_weight()
        case .foodPreferences:
            return RLocalization.menu_food_preferences()
        case .fitnessPreferences:
            return RLocalization.menu_fitness()
        case .language:
            return RLocalization.menu_language()
        case .notification:
            return RLocalization.menu_notification()
        case .reminders:
            return RLocalization.menu_reminders()
        }
    }

}

class MenuController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var writeToUsButton: UIButton!
    @IBOutlet weak var termsOfUseButton: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: MenuCell.self)
    private lazy var presenter = MenuPresenter(view: self)
    private lazy var presenterFood = QuizeFoodPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        titleLabel.text = RLocalization.menu_title()
        
        writeToUsButton.setTitle(RLocalization.menu_write(), for: .normal)
        termsOfUseButton.setTitle(RLocalization.menu_terms(), for: .normal)
        privacyPolicyButton.setTitle(RLocalization.menu_privacy(), for: .normal)
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
    
    @IBAction func actionPrivacy(_ sender: UIButton) {
        guard let url = URL(string: "https://stackoverflow.com") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func actionTerms(_ sender: UIButton) {
        guard let url = URL(string: "https://stackoverflow.com") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func actionWriteUs(_ sender: UIButton) {
    }
    
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? MenuCell else { return UITableViewCell() }
        
        cell.separatorInset = (SettingsType.allCases.count - 1) == indexPath.row ? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width) : UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        cell.delegate = self
        cell.setupCell(type: SettingsType.allCases[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let type = SettingsType.allCases[safe: indexPath.row] else { return }
        
        switch type {
        case .name:
            MenuRouter(presenter: navigationController).pushNameMenu()
        case .age:
            MenuRouter(presenter: navigationController).pushAgeMenu()
        case .email:
            MenuRouter(presenter: navigationController).pushEmailMenu()
        case .height:
            MenuRouter(presenter: navigationController).pushHeightMenu()
        case .weight:
            MenuRouter(presenter: navigationController).pushWeightMenu()
        case .targetWeight:
            MenuRouter(presenter: navigationController).pushMenuTargetWeight()
        case .foodPreferences:
            MenuRouter(presenter: navigationController).pushMenuFood()
        default:
            break
        }
    }
}

//----------------------------------------------
// MARK: - MenuOutputProtocol
//----------------------------------------------

extension MenuController: MenuOutputProtocol{
    func success() {}
    func failure() {}
}

//----------------------------------------------
// MARK: - MenuCellDelegate
//----------------------------------------------

extension MenuController: MenuCellDelegate {
    func menuCellProfile(cell: MenuCell, notification: Bool) {
        presenter.profileUpdate(notifications: notification)
    }
    
    func menuCellProfile(cell: MenuCell, reminders: Bool) {
        presenter.profileUpdate(reminders: reminders)
    }
}

//----------------------------------------------
// MARK: - QuizeFoodOutputProtocol
//----------------------------------------------

extension MenuController: QuizeFoodOutputProtocol {
    func success(model: FoodGroupsModel) {
        tableView.reloadData()
    }
}
