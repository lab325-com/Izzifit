//
//  MainTabBarController.swift
//  izzifit
//
//  Created by Andrey S on 18.02.2022.
//

import UIKit

enum TabBarType {
    case energy
    case workout
    case profile
    case menu
}

class MainTabBarController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var containerEnergyView: UIView!
    @IBOutlet weak var containerWorkoutView: UIView!
    @IBOutlet weak var containerProfileView: UIView!
    @IBOutlet weak var containerMenuView: UIView!
    
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var mainTabBarVw: UIView!
    
    @IBOutlet weak var selectedEnergyLayout: NSLayoutConstraint!
    @IBOutlet weak var selectWorkoutLayout: NSLayoutConstraint!
    @IBOutlet weak var selectedProfileLayout: NSLayoutConstraint!
    @IBOutlet weak var selectedMenuLayout: NSLayoutConstraint!

    @IBOutlet weak var bottomCustomTabBarLayout: NSLayoutConstraint!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    private let heightTabBarConstans: CGFloat = -84
    
    
    private lazy var energy = EnergyController()
    private lazy var workout = WorkoutController()
    private lazy var profile = ProfileController()
    private lazy var menu = MenuController()
    private lazy var game = ArcticGameController()
    
    var onboardingView: MainGameOnboardingView?
    
    
    
    private var tab: TabBarType = .energy {
        didSet {
            if tab == oldValue {
                return
            }
            AudioManager.sharedManager.playSound()
            changeTab()
        }
    }
    
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
        UIView.animate(withDuration: 0.3) {
            self.bottomCustomTabBarLayout.constant = 0
            self.view.layoutIfNeeded()
        }

//PreferencesManager.sharedManager.gameOnboardingDone = false
        guard !PreferencesManager.sharedManager.gameOnboardingDone else { return }
        
        
        let state = MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter]
        
        switch state {
        case .finalPopUp: print("realize here drink Water logic")
           
            if let vc = children.first as? EnergyController {
                let indexPath = IndexPath(row: 1, section: 0)
                          vc.tableView.reloadData()
                
                          if let cell = vc.tableView.cellForRow(at: indexPath) as? EnergyDrinkWaterCell {
                              cell.underView.runSnakeAnim(duration: 2,
                                                          snakeColor: self.view.clr(color: .intensivePurple)!,
                                                          snakeLineWidth: 1,
                                                          cornerRadius: 20)
                          }
                
                vc.tableView.isScrollEnabled = false
                
                onboardingView = MainGameOnboardingView(state: .blockScreen,
                                                            delegate: self)
                        
                view.ui.genericlLayout(object: onboardingView!,
                                       parentView: view,
                                       topC: 390,
                                       bottomC: 0,
                                       leadingC: 0,
                                       trailingC: 0)
                
                //   block all cells except drink cell
            }
        case .blockScreen: break
            
        default:
            onboardingView = MainGameOnboardingView(state: MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter],
                                                        delegate: self)
                    
            view.ui.genericlLayout(object: onboardingView!,
                                   parentView: view,
                                   topC: 0,
                                   bottomC: 0,
                                   leadingC: 0,
                                   trailingC: 0)
            
        }
        

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        changeTab()
        
        NotificationCenter.default.addObserver(self, selector:#selector(openWorkout),
                                               name: Constants.Notifications.openWorkoutNotification,
                                               object: nil)
        
       
    }
    

    private func changeTab() {
        switch tab {
        case .energy:
            containerEnergyView.isHidden = false
            containerWorkoutView.isHidden = true
            containerProfileView.isHidden = true
            containerMenuView.isHidden = true
            self.addContainer(child: energy, to: containerEnergyView)
            energy.updateMe()
            energy.getMe()
        case .workout:
            containerEnergyView.isHidden = true
            containerWorkoutView.isHidden = false
            containerProfileView.isHidden = true
            containerMenuView.isHidden = true
            self.addContainer(child: workout, to: containerWorkoutView)
            workout.updateMe()
        case .profile:
            
            containerEnergyView.isHidden = true
            containerWorkoutView.isHidden = true
            containerProfileView.isHidden = false
            containerMenuView.isHidden = true
            self.addContainer(child: profile, to: containerProfileView)
            
        case .menu:
            containerEnergyView.isHidden = true
            containerWorkoutView.isHidden = true
            containerProfileView.isHidden = true
            containerMenuView.isHidden = false
            self.addContainer(child: menu, to: containerMenuView)
        }
        
        UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 6, options: .curveEaseInOut, animations: {
            switch self.tab {
            case .energy:
                self.selectedEnergyLayout.priority = UILayoutPriority(750)
                self.selectWorkoutLayout.priority = UILayoutPriority(250)
                self.selectedProfileLayout.priority = UILayoutPriority(250)
                self.selectedMenuLayout.priority = UILayoutPriority(250)
            case .workout:
                self.selectedEnergyLayout.priority = UILayoutPriority(250)
                self.selectWorkoutLayout.priority = UILayoutPriority(750)
                self.selectedProfileLayout.priority = UILayoutPriority(250)
                self.selectedMenuLayout.priority = UILayoutPriority(250)
            case .profile:
                self.selectedEnergyLayout.priority = UILayoutPriority(250)
                self.selectWorkoutLayout.priority = UILayoutPriority(250)
                self.selectedProfileLayout.priority = UILayoutPriority(750)
                self.selectedMenuLayout.priority = UILayoutPriority(250)
            case .menu:
                self.selectedEnergyLayout.priority = UILayoutPriority(250)
                self.selectWorkoutLayout.priority = UILayoutPriority(250)
                self.selectedProfileLayout.priority = UILayoutPriority(250)
                self.selectedMenuLayout.priority = UILayoutPriority(750)
            }
            
            self.view.layoutIfNeeded()
        })
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @objc func openWorkout() {
        tab = .workout
    }
    
    @IBAction func actionEnergy(_ sender: UIButton) {
        tab = .energy
    }
    
    @IBAction func actionWorkout(_ sender: UIButton) {
        tab = .workout
    }
    
    @IBAction func actionProfile(_ sender: UIButton) {
        AudioManager.sharedManager.playSound()
        UIView.animate(withDuration: 0.3) {
            self.bottomCustomTabBarLayout.constant = self.heightTabBarConstans
            self.view.layoutIfNeeded()
        }
        TabBarRouter(presenter: navigationController).pushProfile()
    }
    
    @IBAction func actionGame(_ sender: Any) {
        AudioManager.sharedManager.playSound()
        UIView.animate(withDuration: 0.3) {
            self.bottomCustomTabBarLayout.constant = self.heightTabBarConstans
            self.view.layoutIfNeeded()
        }
        navigationController?.navigationBar.isHidden = true
        TabBarRouter(presenter: navigationController).pushGame()
    }

    func goToFun(){
        AudioManager.sharedManager.playSound()
        UIView.animate(withDuration: 0.3) {
            self.bottomCustomTabBarLayout.constant = self.heightTabBarConstans
            self.view.layoutIfNeeded()
        }
        navigationController?.navigationBar.isHidden = true
        TabBarRouter(presenter: navigationController).pushGame()
    }
    
    @IBAction func actionMenu(_ sender: UIButton) {
        AudioManager.sharedManager.playSound()
        UIView.animate(withDuration: 0.3) {
            self.bottomCustomTabBarLayout.constant = self.heightTabBarConstans
            self.view.layoutIfNeeded()
        }

        TabBarRouter(presenter: navigationController).pushMenu()
    }
}



//----------------------------------------------
// MARK: - MainGameOnboardingDelegate
//----------------------------------------------

extension MainTabBarController: MainGameOnboardingDelegate {
    func tapBtn() {
        
        
        switch MainGameOnboardingView.stateCounter {
        case 11:
            PreferencesManager.sharedManager.gameOnboardingDone = true
            onboardingView?.removeFromSuperview()
            if let vc = children.first as? EnergyController {
                vc.tableView.reloadData()
                vc.showEnergyAnimation()
                vc.animationCoins?.play()
            }
     
        default:
            onboardingView?.removeFromSuperview()
            MainGameOnboardingView.stateCounter += 1
            AudioManager.sharedManager.playSound()
            UIView.animate(withDuration: 0.3) {
                self.bottomCustomTabBarLayout.constant = self.heightTabBarConstans
                self.view.layoutIfNeeded()
            }
            navigationController?.navigationBar.isHidden = true
            TabBarRouter(presenter: navigationController).pushGame()
        }
    }
}
