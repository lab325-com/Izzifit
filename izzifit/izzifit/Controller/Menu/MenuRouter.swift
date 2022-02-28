//
//  MenuRouter.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import Foundation

class MenuRouter: BaseRouter {
    func pushNameMenu() {
        let controller = MenuNameController()
        push(controller: controller)
    }
    
    func pushAgeMenu() {
        let controller = MenuAgeController()
        push(controller: controller)
    }
    
    func pushEmailMenu() {
        let controller = MenuEmailController()
        push(controller: controller)
    }
    
    func pushHeightMenu() {
        let controller = MenuHeightController()
        push(controller: controller)
    }
    
    func pushWeightMenu() {
        let controller = MenuWeightController()
        push(controller: controller)
    }
    
    func pushMenuTargetWeight() {
        let controller = MenuTargetWeightController()
        push(controller: controller)
    }
    
    func pushMenuFood() {
        let controller = MenuFoodController()
        push(controller: controller)
    }
}
