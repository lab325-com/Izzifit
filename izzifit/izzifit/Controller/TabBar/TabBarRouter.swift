//
//  TabBarRouter.swift
//  izzifit
//
//  Created by mob325 on 22.02.2022.
//

import Foundation

class TabBarRouter: BaseRouter {
    func pushMenu() {
        let controller = MenuController()
        push(controller: controller)
    }
    
    func pushProfile() {
        let controller = ProfileController()
        push(controller: controller)
    }
    
    func pushGame() {
        let controller = GameTabBarController()
        push(controller: controller)
    }
}
