//
//  EnergyController.swift
//  izzifit
//
//  Created by Andrey S on 21.02.2022.
//

import UIKit
import Kingfisher

class EnergyController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var topView: ShadowView!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cointLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: EnerdyTodayCell.self)
    private let cellWaterIdentifier = String(describing: EnergyDrinkWaterCell.self)
    private let cellEnergyMood = String(describing: EnergyMoodCell.self)
    private let cellMealsIdentifier = String(describing: EnergyMealsCell.self)
    private let cellSleepIdentifier = String(describing: EnergySleepCell.self)
    
    private lazy var presenter = EnergyPresenter(view: self)

    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        
        cointLabel.text = "\(KeychainService.standard.me?.coins ?? 0)"
        energyLabel.text = "\(KeychainService.standard.me?.energy ?? 0)"
        
        if let name = KeychainService.standard.me?.name {
            nameLabel.text = RLocalization.energy_header_title(name)
        } else {
            nameLabel.isHidden = true
        }
        
        tableView.isHidden = true
        
        let dateFormmater = DateFormatter()
        dateFormmater.locale = Locale(identifier: "en_US_POSIX")
        dateFormmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        presenter.getWidgets(date: dateFormmater.string(from: Date()))
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellWaterIdentifier, bundle: nil), forCellReuseIdentifier: cellWaterIdentifier)
        tableView.register(UINib(nibName: cellEnergyMood, bundle: nil), forCellReuseIdentifier: cellEnergyMood)
        tableView.register(UINib(nibName: cellMealsIdentifier, bundle: nil), forCellReuseIdentifier: cellMealsIdentifier)
        tableView.register(UINib(nibName: cellSleepIdentifier, bundle: nil), forCellReuseIdentifier: cellSleepIdentifier)
        
        topView.layer.cornerRadius = 30
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        avatarView.gradientBorder(width: 2, colors: [UIColor(rgb: 0xFF42A8), UIColor(rgb: 0x7759B7)], startPoint: .unitCoordinate(.top), endPoint: .unitCoordinate(.bottom), andRoundCornersWithRadius: 20)
        
        avatarImageView.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""), placeholder: RImage.placeholder_food_ic(), options: [.transition(.fade(0.25))])
    }
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension EnergyController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? EnerdyTodayCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellWaterIdentifier) as? EnergyDrinkWaterCell else { return UITableViewCell() }
            if let model = presenter.drinkWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellEnergyMood) as? EnergyMoodCell else { return UITableViewCell() }
            if let model = presenter.moodWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellMealsIdentifier) as? EnergyMealsCell else { return UITableViewCell() }
            if let model = presenter.mealsWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSleepIdentifier) as? EnergySleepCell else { return UITableViewCell() }
            if let model = presenter.sleepWidget {
                cell.setupCell(model: model)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//----------------------------------------------
// MARK: - EnergyOutputProtocol
//----------------------------------------------

extension EnergyController: EnergyOutputProtocol {
    func success() {
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func failure() {
        
    }
}
