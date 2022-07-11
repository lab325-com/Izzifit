//
//  GameTabBarController.swift
//  izzifit
//
//  Created by O l e h on 15.04.2022.
//

import UIKit

class GameTabBarController: UITabBarController {
    
    private let backBtn = UIButton()
    private let spinBtn = UIButton()
    private let buildBtn = UIButton()
    private let mapBtn = UIButton()
    private var gradientView = UIView()
    private let profileBtn = UIButton()
    
    private lazy var btns: [UIButton] = {[backBtn, spinBtn, buildBtn, mapBtn]}()
    private var tabBarStackView: UIStackView!
    
    var firstLaunch = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVCs()
        self.setupTabBar()
    }
    
    private func createNavController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
        let vc = rootViewController
        vc.tabBarItem.isEnabled = false
        return vc
    }
    
    private func setupVCs() {
        viewControllers = [createNavController(for: GameBaseController(firstVC: ArcticGameController(),
                                                                       secondVC: EnglandGameController()),
                                               image: view.image(img: .gameTabBarSpin)!),
                           createNavController(for: GameBaseController(firstVC: LevelController(),
                                                                       secondVC: EngLevelController()),
                                               image: view.image(img: .gameTabBarBuild)!) ,
                           createNavController(for:  MapController(),
                                               image: view.image(img: .gameTabBarSpin)!)
        ]
    }
    
    private func setupTabBar() {
        
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
        
        // gradient Layer View
        
        gradientView = UIView(frame: CGRect(x: 0, y: 0, width: view.w, height: view.h/5.6))
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        
        
        gradient.colors = [UIColor(rgb: 0x3E3A47,alpha: 0).cgColor, UIColor(rgb: 0x3F3E56,alpha: 0.3).cgColor]
        
        gradientView.layer.insertSublayer(gradient, at: 0)
        view.ui.genericlLayout(object: gradientView,
                               parentView: view,
                               height: view.h/5.6,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
        
        view.ui.genericlLayout(object: profileBtn,
                               parentView: view,
                               width: 200.0,
                               height: 90.0,
                               topC: 0,
                               leadingC: 0)
        profileBtn.addTarget(self, action: #selector(profile), for: .touchUpInside)
        
        // stackView
        backBtn.setImage(view.image(img: .gameTabBarEnergy), for:   .normal)
        spinBtn.setImage(view.image(img: .gameTabBarSpin), for:     .normal)
        buildBtn.setImage(view.image(img: .gameTabBarBuild), for:   .normal)
        mapBtn.setImage(view.image(img: .gameTabBarMap), for:       .normal)
        spinBtn.setImage(view.image(img: .gameTabBarSpinSelected), for:     .selected)
        buildBtn.setImage(view.image(img: .gameTabBarBuildSelected), for:   .selected)
        mapBtn.setImage(view.image(img: .gameTabBarMapSelected), for:       .selected)
        
        for btn in btns {
            NSLayoutConstraint.activate([btn.widthAnchor.constraint(equalToConstant: view.h/11.6),
                                         btn.heightAnchor.constraint(equalToConstant: view.h/10.15)])
        }
        
        tabBarStackView = UIStackView(arrangedSubviews: btns)
        tabBarStackView.alignment = .center
        tabBarStackView.axis = .horizontal
        tabBarStackView.spacing = view.w/26.78
        
        view.ui.genericlLayout(object: tabBarStackView,
                               parentView: view,
                               bottomC: view.h/27.06,
                               centerH: 0)
        
        // Targets
        backBtn.addTarget(self, action:     #selector(actionBack),for:  .touchUpInside)
        spinBtn.addTarget(self, action:     #selector(spin), for:       .touchUpInside)
        buildBtn.addTarget(self, action:    #selector(build), for:      .touchUpInside)
        mapBtn.addTarget(self,action:       #selector(map), for:        .touchUpInside)
        spinBtn.isSelected = true
        
        tabBar.isHidden = true
        
        guard !PreferencesManager.sharedManager.gameOnboardingDone else { return }
        
        selectedIndex = 1
    }
    func selectBtn(_ number: Int) {
        for (index, btn) in btns.enumerated() {
            switch index {
            case number: btn.isSelected = true
            default: btn.isSelected = false
            }
        }
    }
    
    @objc func actionBack() { navigationController?.popViewController(animated: true) }
    
    @objc func spin() {
        selectedIndex = 0
        selectBtn(1)
    }
    
    @objc func build() {
        selectedIndex = 1
        selectBtn(2)
        AnalyticsHelper.sendFirebaseEvents(events: .map_open)
    }
    
    @objc func map() {
        selectBtn(3)
        selectedIndex = 2 }
    
    @objc func profile() {
        navigationController?.popToRootViewController(animated: true)
        TabBarRouter(presenter: navigationController).pushProfile()
    }
}

enum MapName: String {
    case snow_map, england_map
}
