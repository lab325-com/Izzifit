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
    case logout
    
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
        case .logout:
            return ""
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
    private let cellLogoutIdentifier = String(describing: MenuLogoutCell.self)
    
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
        tableView.register(UINib(nibName: cellLogoutIdentifier, bundle: nil), forCellReuseIdentifier: cellLogoutIdentifier)
        
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
        MenuRouter(presenter: navigationController).pushMenuQuiestion()
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
        if indexPath.row == SettingsType.allCases.count - 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellLogoutIdentifier) as? MenuLogoutCell else { return UITableViewCell() }
            cell.delegate = self
            cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? MenuCell else { return UITableViewCell() }
            
            cell.separatorInset = (SettingsType.allCases.count - 1) == indexPath.row ? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width) : UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            cell.delegate = self
            cell.setupCell(type: SettingsType.allCases[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        AudioManager.sharedManager.playSound()
        
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
        case .fitnessPreferences:
            MenuRouter(presenter: navigationController).pushMenuFitness()
        case .language:
            MenuRouter(presenter: navigationController).pushMenuLanguage()
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
    func successProducts(models: [ProductsMainModel]) {
        
    }
    
    func success(model: FoodGroupsModel) {
        tableView.reloadData()
    }
}

//----------------------------------------------
// MARK: - QuizeFoodOutputProtocol
//----------------------------------------------

extension MenuController: MenuLogoutCellDeleagate {
    func menuLogoutCell(cell: MenuLogoutCell) {
        let alert = UIAlertController(title: "Do you want LogOut", message: nil, preferredStyle: .alert)
            
             let ok = UIAlertAction(title: "No", style: .default, handler: { action in
        
             })
             alert.addAction(ok)
             let cancel = UIAlertAction(title: "Yes", style: .default, handler: { action in
                 KeychainService.standard.removeAll()
                 RootRouter.sharedInstance.loadStart(toWindow: RootRouter.sharedInstance.window!)
             })
        
             alert.addAction(cancel)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
        })
        
        
    }
}
