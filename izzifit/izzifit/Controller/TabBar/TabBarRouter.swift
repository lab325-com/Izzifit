//
//  TabBarRouter.swift
//  izzifit
//
//  Created by Andrey S on 22.02.2022.
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
        let controller = ArcticGameComtroller()
        push(controller: controller)
    }
}
