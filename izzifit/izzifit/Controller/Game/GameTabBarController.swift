//
//  GameTabBarController.swift
//  izzifit
//
//  Created by O l e h on 15.04.2022.
//

import UIKit

class GameTabBarController: UITabBarController {
    
    var kBarHeight: CGFloat = 110
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
                           createNavController(for:  ArcticGameController(),
                                               image: view.image(img: .gameTabBarSpin)!),
                           createNavController(for: LevelController(),
                                               image: view.image(img: .gameTabBarBuild)!)]
    }
    
    private func setupTabBar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true

        selectedIndex = 1
        
        let backBtn = UIButton()
        let spinBtn = UIButton()
        let buildBtn = UIButton()
        
        view.ui.setButton(button: backBtn,
                          view: view,
                          image: view.image(img: .gameTabBarEnergy),
                          controlState: .normal)
        view.ui.setButton(button: spinBtn,
                          view: view,
                          image: view.image(img: .gameTabBarSpin),
                          controlState: .normal)
        view.ui.setButton(button: buildBtn,
                          view: view,
                          image: view.image(img: .gameTabBarBuild),
                          controlState: .normal)
        
        let sideConstant = (view.sizeWidth / 3 ) - 70
        
        view.ui.btnLayout(button: backBtn,
                          view: view,
                          width: view.h / 11.6,
                          height: view.h / 10.15,
                          bottomC: view.h / 27.06,
                          leadingC: sideConstant)
        
        view.ui.btnLayout(button: spinBtn,
                          view: view,
                          width: view.h / 11.6,
                          height: view.h / 10.15,
                          bottomC: view.h / 27.06,
                          centerH: 0)

        view.ui.btnLayout(button: buildBtn,
                          view: view,
                          width: view.h / 11.6,
                          height: view.h / 10.15,
                          bottomC: view.h / 27.06,
                          trailingC: sideConstant)
        
        backBtn.addTarget(self,
                          action: #selector(actionBack),
                          for: .touchUpInside)
        
        spinBtn.addTarget(self,
                          action: #selector(spin),
                          for: .touchUpInside)
        
        buildBtn.addTarget(self,
                           action: #selector(build),
                           for: .touchUpInside)
        tabBar.isHidden = true
    }
    
    @objc
    func actionBack() {
      navigationController?.popViewController(animated: true)
    }
    
    @objc
    func spin() {
        selectedIndex = 1
    }
    @objc
    func build() {
        selectedIndex = 2
        AnalyticsHelper.sendFirebaseEvents(events: .map_open)
    }
}
