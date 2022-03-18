//
//  EnergyRouter.swift
//  izzifit
//
//  Created by Andrey S on 11.03.2022.
//

import Foundation

class EnergyRouter: BaseRouter {
    func pushProgrress() {
        let controller = EnergyProgressController()
        push(controller: controller)
    }
    
    func pushFood(mealsWidget: MealsWidgetMainModel, currentMealType: MealType) {
        let controller = FoodController(mealsWidget: mealsWidget, currentMealType: currentMealType)
        push(controller: controller)
    }
    
    func pushWriteToUs() {
        let controller = WriteToUsController()
        push(controller: controller)
    }
}
