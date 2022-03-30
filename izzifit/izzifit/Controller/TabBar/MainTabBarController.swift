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
    
    
    private lazy var energy = EnergyController(delegate: self)
    private lazy var workout = WorkoutController()
    private lazy var profile = ProfileController()
    private lazy var menu = MenuController()
    
    private var tab: TabBarType = .energy {
        didSet {
            if tab == oldValue {
                return
            }
            changeTab()
        }
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
        UIView.animate(withDuration: 0.3) {
            self.bottomCustomTabBarLayout.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        changeTab()
    }
    
    
    private func changeTab() {
        switch tab {
        case .energy:
            containerEnergyView.isHidden = false
            containerWorkoutView.isHidden = true
            containerProfileView.isHidden = true
            containerMenuView.isHidden = true
            self.addContainer(child: energy, to: containerEnergyView)
        case .workout:
            containerEnergyView.isHidden = true
            containerWorkoutView.isHidden = false
            containerProfileView.isHidden = true
            containerMenuView.isHidden = true
            self.addContainer(child: workout, to: containerWorkoutView)
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
    
    @IBAction func actionEnergy(_ sender: UIButton) {
        tab = .energy
    }
    
    @IBAction func actionWorkout(_ sender: UIButton) {
        tab = .workout
    }
    
    @IBAction func actionProfile(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bottomCustomTabBarLayout.constant = self.heightTabBarConstans
            self.view.layoutIfNeeded()
        }

        TabBarRouter(presenter: navigationController).pushProfile()
    }
    
    @IBAction func actionMenu(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bottomCustomTabBarLayout.constant = self.heightTabBarConstans
            self.view.layoutIfNeeded()
        }

        TabBarRouter(presenter: navigationController).pushMenu()
    }
    
    @IBAction func actionLogOut(_ sender: UIButton) {
        RootRouter.sharedInstance.logout()
    }
}

//----------------------------------------------
// MARK: - EnergyControllerProtocol
//----------------------------------------------

extension MainTabBarController: EnergyControllerProtocol {
    func energControllerSetProfile(controller: EnergyController, model: WorkoutsWidgetMainModel) {
        tab = .workout
    }
}
