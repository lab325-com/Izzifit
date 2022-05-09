//
//  GameTabBarController.swift
//  izzifit
//
//  Created by O l e h on 15.04.2022.
//

import UIKit

class GameTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
        setupTabBar()
        
        print(viewControllers![0].view.sizeHeight)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if selectedViewController == ArcticGameComtroller() {
            
        }
    }
    
    private func createNavController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.navigationBar.isHidden = true
        navController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 0)
        return navController
    }
    
    private func setupVCs() {
        viewControllers = [createNavController(for: LevelController(),
                                               image: view.image(img: .gameTabBarEnergy)!),
                           createNavController(for:  ArcticGameComtroller(),
                                               image: view.image(img: .gameTabBarSpin)!),
                           createNavController(for: LevelController(),
                                               image: view.image(img: .gameTabBarBuild)!)]
    }
    
    private func setupTabBar() {
        UITabBar.appearance().barTintColor = .clear
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
        tabBar.tintColor = .clear
    }
}
