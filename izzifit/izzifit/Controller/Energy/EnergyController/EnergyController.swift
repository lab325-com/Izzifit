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
    
    let cellIdentifier = String(describing: EnerdyTodayCell.self)
    let cellWaterIdentifier = String(describing: EnergyDrinkWaterCell.self)
    let cellEnergyMood = String(describing: EnergyMoodCell.self)
    let cellMealsIdentifier = String(describing: EnergyMealsCell.self)
    let cellSleepIdentifier = String(describing: EnergySleepCell.self)
    let cellWeightIdentifier = String(describing: EnergyWeightCell.self)
    let cellChooseActivity = String(describing: EnergyChooseActivityCell.self)
    let cellTraining = String(describing: EnergyTrainingCell.self)
    let cellAddActivity = String(describing: EnergyAddActivityCell.self)
    
    lazy var presenter = EnergyPresenter(view: self)
    
    var currentDate = Date()
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getWidgetList()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        tableView.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector:#selector(updateEnegyNotification),
                                               name: Constants.Notifications.updateEnergyNotification,
                                               object: nil)
        
        AnalyticsHelper.sendFirebaseEvents(events: .dash_open)
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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func getDate() -> String {
        let dateFormmater = DateFormatter()
        dateFormmater.locale = Locale(identifier: "en_US_POSIX")
        dateFormmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormmater.string(from: currentDate)
    }
    
    func getMe() {
        presenter.getMe()
        presenter.getWidgetList()
    }
    
    func updateMe() {
        if !currentDate.isInToday {
            currentDate = Date()
            presenter.getWidgets(date: getDate())
        }
        
        cointLabel.text = "\(KeychainService.standard.me?.coins ?? 0)"
        energyLabel.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
        
        if let name = KeychainService.standard.me?.name {
            nameLabel.text = name
        } else {
            nameLabel.isHidden = true
        }
    }
    
    //----------------------------------------------
    // MARK: - Notifications
    //----------------------------------------------
    
    @objc func updateEnegyNotification(_ notification: Notification) {
        presenter.getWidgets(date: getDate())
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
    
    func successWidgetList() {
        tableView.reloadData()
    }
    
    func failure() {
        
    }
}
