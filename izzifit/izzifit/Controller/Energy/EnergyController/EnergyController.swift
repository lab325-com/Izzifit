//
//  EnergyController.swift
//  izzifit
//
//  Created by Andrey S on 21.02.2022.
//

import UIKit
import Kingfisher
import Lottie

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
    let cellStepsIdentifier = String(describing: EnergyStepsCell.self)
    let cellSpecialPriceIdentifier = String(describing: EnergySpecialPriceCell.self)
    let cellSleepIdentifier = String(describing: EnergySleepCell.self)
    let cellWeightIdentifier = String(describing: EnergyWeightCell.self)
    let cellChooseActivity = String(describing: EnergyChooseActivityCell.self)
    let cellTraining = String(describing: EnergyTrainingCell.self)
    let cellAddActivity = String(describing: EnergyAddActivityCell.self)
    
    lazy var presenter = EnergyPresenter(view: self)
    
    var currentDate = Date()
    
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
        presenter.getWidgetList()
        presenter.getSteps()
        updateMe()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        // Create Animation object
        let jsonName = "enerrgy_anim"
        let animation = Animation.named(jsonName)

        // Load animation to AnimationView
        let animationView = AnimationView(animation: animation)
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

        // Add animationView as subview
        energyLabel.addSubview(animationView)
        animationView.loopMode = .loop
        // Play the animation
        animationView.play()
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {(granted, error) in
                DispatchQueue.main.async {
                    if (granted) {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                    else {
                        //Do stuff if unsuccessful...
                    }
                }
            })
        
        if PreferencesManager.sharedManager.afterOnboarding {
            PreferencesManager.sharedManager.afterOnboarding = true
            let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .dashboard)
        }
        
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
        tableView.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 20, right: 0)
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellWaterIdentifier, bundle: nil), forCellReuseIdentifier: cellWaterIdentifier)
        tableView.register(UINib(nibName: cellEnergyMood, bundle: nil), forCellReuseIdentifier: cellEnergyMood)
        tableView.register(UINib(nibName: cellMealsIdentifier, bundle: nil), forCellReuseIdentifier: cellMealsIdentifier)
        tableView.register(UINib(nibName: cellStepsIdentifier, bundle: nil), forCellReuseIdentifier: cellStepsIdentifier)
        tableView.register(UINib(nibName: cellSpecialPriceIdentifier, bundle: nil), forCellReuseIdentifier: cellSpecialPriceIdentifier)
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
        //presenter.getWidgetList()
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
    
    //----------------------------------------------
    // MARK: - Action
    //----------------------------------------------
    
    @IBAction func actionProfile(_ sender: UIButton) {
        debugPrint("open profile")
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
    
    func successGetSteps() {
        if presenter.steps.count > 0 {
            presenter.setSteps()
        }
        
//        if presenter.stepsWidget.count > 0 {
//            var message = ""
//            for steps in presenter.stepsWidget {
//                let hour = steps.hourType
//                let steps = steps.steps
//                if message.isEmpty {
//                    message = "Hour: \(hour.rawValue), Steps: \(steps)"
//                } else {
//                    message += "\nHour: \(hour.rawValue), Steps: \(steps)"
//                }
//            }
//            let alert = UIAlertController(title: "Steps from HealthKit",
//                                          message: message,
//                                          preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK",
//                                         style: .default)
//            alert.addAction(okAction)
//            present(alert, animated: true)
//        }
    }
    
    func successStepsEnergy() {
        tableView.reloadData()
    }
    
    func failure() {
        
    }
}
