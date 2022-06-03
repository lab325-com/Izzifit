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
    
    private lazy var btns: [UIButton] = {[backBtn, spinBtn, buildBtn, mapBtn]}()
    private var tabBarStackView: UIStackView!
    
    var firstLaunch = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
        setupTabBar()
    }
    
    private func createNavController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
        let vc = rootViewController
        vc.tabBarItem.isEnabled = false
        return vc
    }
    
    private func setupVCs() {
        viewControllers = [createNavController(for: LevelController(),
                                               image: view.image(img: .gameTabBarEnergy)!),
                           createNavController(for: ArcticGameController(),
                                               image: view.image(img: .gameTabBarSpin)!),
                           createNavController(for: LevelController(),
                                               image: view.image(img: .gameTabBarBuild)!),
                           createNavController(for:  MapController(),
                                               image: view.image(img: .gameTabBarSpin)!)]
    }
    
    private func setupTabBar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true

        selectedIndex = 1
    
        backBtn.setImage(view.image(img: .gameTabBarEnergy), for: .normal)
        spinBtn.setImage(view.image(img: .gameTabBarSpin), for: .normal)
        buildBtn.setImage(view.image(img: .gameTabBarBuild), for: .normal)
        mapBtn.setImage(view.image(img: .gameTabBarMap), for: .normal)
        
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
        backBtn.addTarget(self, action: #selector(actionBack),for: .touchUpInside)
        spinBtn.addTarget(self, action: #selector(spin), for: .touchUpInside)
        buildBtn.addTarget(self, action: #selector(build), for: .touchUpInside)
        mapBtn.addTarget(self,action: #selector(map), for: .touchUpInside)
        
        tabBar.isHidden = true
    }
    
    @objc func actionBack() { navigationController?.popViewController(animated: true) }
    
    @objc func spin() { selectedIndex = 1 }
    
    @objc func build() {
        selectedIndex = 2
        AnalyticsHelper.sendFirebaseEvents(events: .map_open)
    }
    
    @objc func map() { selectedIndex = 3 }
}
