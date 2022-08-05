//
//  MenuRouter.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import Foundation

class MenuRouter: BaseRouter {
    func pushNameMenu(name: String?) {
        let controller = MenuNameController(name: name)
        push(controller: controller)
    }
    
    func pushAgeMenu(age: Int?) {
        let controller = MenuAgeController(age: age)
        push(controller: controller)
    }
    
    func pushEmailMenu(email: String?) {
        let controller = MenuEmailController(email: email)
        push(controller: controller)
    }
    
    func pushHeightMenu(growth: Int?) {
        let controller = MenuHeightController(growth: growth)
        push(controller: controller)
    }
    
    func pushWeightMenu(weight: Float?) {
        let controller = MenuWeightController(weight: weight)
        push(controller: controller)
    }
    
    func pushMenuTargetWeight(targetWeight: Float?) {
        let controller = MenuTargetWeightController(targetWeight: targetWeight)
        push(controller: controller)
    }
    
    func pushMenuFood() {
        let controller = MenuFoodController()
        push(controller: controller)
    }
    
    func pushMenuFitness() {
        let controller = MenuFitnessController()
        push(controller: controller)
    }
    
    func pushMenuLanguage() {
        let controller = MenuLanguageController()
        push(controller: controller)
    }
    
    func pushMenuSubscripyions() {
        let controller = MenuSubscriptionsController()
        push(controller: controller)
    }
    
    func pushMenuQuiestion() {
        let controller = MenuWriteQuestionController()
        push(controller: controller)
    }
}
