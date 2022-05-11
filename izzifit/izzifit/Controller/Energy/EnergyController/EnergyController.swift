//
//  EnergyController.swift
//  izzifit
//
//  Created by Andrey S on 21.02.2022.
//

import UIKit
import Kingfisher
 
protocol EnergyControllerProtocol: AnyObject {
    func energControllerSetProfile(controller: EnergyController, model: WorkoutsWidgetMainModel)
}

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
    private let cellWeightIdentifier = String(describing: EnergyWeightCell.self)
    private let cellChooseActivity = String(describing: EnergyChooseActivityCell.self)
    private let cellTraining = String(describing: EnergyTrainingCell.self)
    private let cellAddActivity = String(describing: EnergyAddActivityCell.self)
    
    private lazy var presenter = EnergyPresenter(view: self)

    private var currentDate = Date()
    
    
    weak var delegate: EnergyControllerProtocol?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: EnergyControllerProtocol) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        updateMe()
        
        tableView.isHidden = true
        
        
        
        presenter.getWidgets(date: getDate())
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellWaterIdentifier, bundle: nil), forCellReuseIdentifier: cellWaterIdentifier)
        tableView.register(UINib(nibName: cellEnergyMood, bundle: nil), forCellReuseIdentifier: cellEnergyMood)
        tableView.register(UINib(nibName: cellMealsIdentifier, bundle: nil), forCellReuseIdentifier: cellMealsIdentifier)
        tableView.register(UINib(nibName: cellSleepIdentifier, bundle: nil), forCellReuseIdentifier: cellSleepIdentifier)
        tableView.register(UINib(nibName: cellWeightIdentifier, bundle: nil), forCellReuseIdentifier: cellWeightIdentifier)
        tableView.register(UINib(nibName: cellChooseActivity, bundle: nil), forCellReuseIdentifier: cellChooseActivity)
        tableView.register(UINib(nibName: cellTraining, bundle: nil), forCellReuseIdentifier: cellTraining)
        tableView.register(UINib(nibName: cellAddActivity, bundle: nil), forCellReuseIdentifier: cellAddActivity)
        
        topView.layer.cornerRadius = 30
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        avatarView.gradientBorder(width: 2, colors: [UIColor(rgb: 0xFF42A8), UIColor(rgb: 0x7759B7)], startPoint: .unitCoordinate(.top), endPoint: .unitCoordinate(.bottom), andRoundCornersWithRadius: 20)
        
        avatarImageView.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""), placeholder: RImage.placeholder_food_ic(), options: [.transition(.fade(0.25))])
    }
    
    private func getDate() -> String {
        let dateFormmater = DateFormatter()
        dateFormmater.locale = Locale(identifier: "en_US_POSIX")
        dateFormmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormmater.string(from: currentDate)
    }
    
    func getMe() {
        presenter.getMe()
    }
    
    func updateMe() {
        if !currentDate.isInToday {
            currentDate = Date()
            presenter.getWidgets(date: getDate())
        }
        
        cointLabel.text = "\(KeychainService.standard.me?.coins ?? 0)"
        energyLabel.text = "\(KeychainService.standard.me?.energy ?? 0)"
        
        if let name = KeychainService.standard.me?.name {
            nameLabel.text = name
        } else {
            nameLabel.isHidden = true
        }
    }
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension EnergyController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7 + presenter.workoutWidgets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? EnerdyTodayCell else { return UITableViewCell() }
            
            cell.delegate = self
            if let model = presenter.todayProgress {
                cell.setupCell(model: model)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellWaterIdentifier) as? EnergyDrinkWaterCell else { return UITableViewCell() }
            cell.delegate = self
            if let model = presenter.drinkWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellEnergyMood) as? EnergyMoodCell else { return UITableViewCell() }
            
            if let model = presenter.moodWidget {
                cell.setupCell(model: model)
            }
            
            cell.delegate = self
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellMealsIdentifier) as? EnergyMealsCell else { return UITableViewCell() }
            if let model = presenter.mealsWidget {
                cell.delegate = self
                cell.setupCell(model: model)
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSleepIdentifier) as? EnergySleepCell else { return UITableViewCell() }
            cell.delegate = self
            if let model = presenter.sleepWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellWeightIdentifier) as? EnergyWeightCell else { return UITableViewCell() }
            cell.delegate = self
            if let model = presenter.weightWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellChooseActivity) as? EnergyChooseActivityCell else { return UITableViewCell() }
            cell.delegate = self
            cell.setupCell(models: presenter.chooseWorkoutWidgets)
            return cell
        case 7..<7 + presenter.workoutWidgets.count:
            if presenter.workoutWidgets.count == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellAddActivity) as? EnergyAddActivityCell else { return UITableViewCell() }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellTraining) as? EnergyTrainingCell else { return UITableViewCell() }
                cell.delegate = self
                cell.setupCell(model: presenter.workoutWidgets[indexPath.row - 7])
                return cell
            }
        case 7 + presenter.workoutWidgets.count:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellAddActivity) as? EnergyAddActivityCell else { return UITableViewCell() }
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
        updateMe()
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func failure() {
        
    }
}

//----------------------------------------------
// MARK: - EnergyTodayProtocol
//----------------------------------------------

extension EnergyController: EnergyTodayProtocol {
    func energyTodayProgress(cell: EnerdyTodayCell) {
        EnergyRouter(presenter: navigationController).pushProgrress()
    }
}

//----------------------------------------------
// MARK: - EnergyMealsDeleagate
//----------------------------------------------

extension EnergyController: EnergyMealsDeleagate {
    func energyMealsAdd(cell: EnergyMealsCell, type: MealType) {
        guard let meals = presenter.mealsWidget else { return }
        EnergyRouter(presenter: navigationController).pushFood(mealsWidget: meals, currentMealType: type, delegate: self)
    }
}

//----------------------------------------------
// MARK: - EnergyDrinkWaterProtocol
//----------------------------------------------

extension EnergyController: EnergyDrinkWaterProtocol {
    func energyDrinkWaterSelectIndex(cell: EnergyDrinkWaterCell, index: Int) {
        presenter.setWater(index: index, date: getDate())
    }
}

//----------------------------------------------
// MARK: - EnergyMoodProtocol
//----------------------------------------------

extension EnergyController: EnergyMoodProtocol {
    func energyMoodSelected(cell: EnergyMoodCell, type: MoodType) {
        presenter.setMood(mood: type, date: getDate())
    }
}

//----------------------------------------------
// MARK: - EnergySleepCellProtocol
//----------------------------------------------

extension EnergyController: EnergySleepCellProtocol {
    func energySleepCellSeleep(cell: EnergySleepCell, sleep: SleepQualityType) {
        presenter.setSeleep(sleep: sleep, date: getDate())
    }
}

//----------------------------------------------
// MARK: - EnergyWeightProtocol
//----------------------------------------------

extension EnergyController: EnergyWeightProtocol {
    func energyWeightUpdate(cell: EnergyWeightCell) {
        EnergyRouter(presenter: navigationController).presentUpdateWieght(delegate: self)
    }
}

//----------------------------------------------
// MARK: - EnergyUpdateWeightProtocol
//----------------------------------------------

extension EnergyController: EnergyUpdateWeightProtocol {
    func energyUpdateWeight(controller: EnergyUpdateWeightController) {
        presenter.updateWeight()
    }
}

//----------------------------------------------
// MARK: - EnergyChooseActivityProtocol
//----------------------------------------------

extension EnergyController: EnergyChooseActivityProtocol {
    func energyChooseActivitySelect(cell: EnergyChooseActivityCell, model: WorkoutsWidgetMainModel) {
        delegate?.energControllerSetProfile(controller: self, model: model)
    }
}

//----------------------------------------------
// MARK: - EnergyTrainingProtocol
//----------------------------------------------

extension EnergyController: EnergyTrainingProtocol {
    func energyTrainingSelect(cell: EnergyTrainingCell, model: WorkoutsWidgetMainModel) {
        guard let id = model.id else { return }
        WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id)
    }
}

//----------------------------------------------
// MARK: - FoodControllerProtocol
//----------------------------------------------

extension EnergyController: FoodControllerProtocol {
    func foodControllerUpdate(controller: FoodController) {
        presenter.getWidgets(date: getDate())
    }
}
