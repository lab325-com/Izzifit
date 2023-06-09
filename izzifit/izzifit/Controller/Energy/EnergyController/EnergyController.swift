//
//  EnergyController.swift
//  izzifit
//
//  Created by mob325 on 21.02.2022.
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
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cointLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    
    @IBOutlet weak var energyLottieView: UIView!
    
    @IBOutlet weak var coinsImgVw: UIImageView!
    
    @IBOutlet weak var coinsAnimationView: UIView!
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    @IBOutlet weak var tableView: UITableView!
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
    
    private var animationEnergy: AnimationView?
    var animationCoins: AnimationView?
        
    
    var onboardingShadowView: UIView?
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
        updateMe()
        tableView.reloadData()
        
        
        // Onboarding
        onboardingShadowView?.removeFromSuperview()
        
//        guard !PreferencesManager.sharedManager.gameOnboardingDone,
//              MainGameOnboardingView.currentState == .energy1 else { return }
//        
//        onboardingShadowView = UIView()
//        
//        onboardingShadowView.backgroundColor = UIColor(rgb: 0x574B70, alpha: 0.3)
//        view.ui.genericlLayout(object: onboardingShadowView,
//                               parentView: view,
//                               topC: 0,
//                               bottomC: 0, leadingC: 0, trailingC: 0, centerV: <#T##CGFloat?#>, centerH: <#T##CGFloat?#>, centerVtoO: <#T##Any?#>, centerHtoO: <#T##Any?#>, topToO: <#T##Any?#>, topCG: <#T##CGFloat?#>, bottomToO: <#T##Any?#>, bottomCG: <#T##CGFloat?#>, leadingToO: <#T##Any?#>, leadingCG: <#T##CGFloat?#>, trailingToO: <#T##Any?#>, trailingCG: <#T##CGFloat?#>)
//       
    }

    
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        
        // Create Animation object
        let jsonName = "energy_anim"
        let animation = Animation.named(jsonName)
        animationEnergy = AnimationView(animation: animation)
        energyLottieView.addSubview(animationEnergy!)
        animationEnergy?.contentMode = .scaleAspectFit
        
        animationCoins = .init(name: "coins_header")
        animationCoins?.contentMode = .scaleAspectFit
        
        view.ui.genericlLayout(object: animationCoins!,
                               parentView: coinsAnimationView,
                               width: 30,
                               height: 100,
                               topC: 8,
                               centerH: 3)
        
        
        
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
        //    PreferencesManager.sharedManager.afterOnboarding = true
            let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .dashboard)
        }
        
        if (PreferencesManager.sharedManager.pushOpen != nil) {
            let _ = PaywallPushRouter(presenter: navigationController).presentPaywall(delegate: self)
            PreferencesManager.sharedManager.pushOpen = nil
        }
        

        tableView.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector:#selector(updateEnegyNotification),
                                               name: Constants.Notifications.updateEnergyNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(pushNotification),
                                               name: Constants.Notifications.pushNotification,
                                               object: nil)
        
        AnalyticsHelper.sendFirebaseEvents(events: .dash_open)
        updateMe()
        
        tableView.isHidden = true
        
        presenter.getWidgets(date: getDate())
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30
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
        
        avatarImageView.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""), placeholder: RImage.placeholder_food_ic(), options: [.transition(.fade(0.25))])
    }
    
    //----------------------------------------------
    // MARK: - Notifications
    //----------------------------------------------
    
    @objc func pushNotification() {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            let _ = PaywallPushRouter(presenter: self.navigationController).presentPaywall(delegate: self)
            PreferencesManager.sharedManager.pushOpen = nil
        }
    }
    
    @objc func updateEnegyNotification(_ notification: Notification) {
        presenter.getWidgets(date: getDate())
    }
    
    //----------------------------------------------
    // MARK: - Action
    //----------------------------------------------
    
    @IBAction func actionProfile(_ sender: UIButton) {
        TabBarRouter(presenter: navigationController).pushProfile()
    }
    
    @IBAction func actionGame(_ sender: UIButton) {
        TabBarRouter(presenter: navigationController).pushGame()
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
        
        if presenter.steps.count > 0 {
            presenter.setSteps()
        }
    }
    
    func successWidgetList() {
        tableView.reloadData()
    }
    
    func successStepsEnergy() {
        tableView.reloadData()
    }
    
    func failure() {
        
    }
    
    func showEnergyAnimation() {
        animationEnergy?.play()
    }
    
}


