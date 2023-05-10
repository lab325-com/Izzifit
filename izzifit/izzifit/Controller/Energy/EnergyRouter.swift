//
//  EnergyRouter.swift
//  izzifit
//
//  Created by mob325 on 11.03.2022.
//

import Foundation

class EnergyRouter: BaseRouter {
    func pushProgrress() {
        let controller = EnergyProgressController()
        push(controller: controller)
    }
    
    func pushFood(mealsWidget: MealsWidgetMainModel, currentMealType: MealType, delegate: FoodControllerProtocol) {
        let controller = FoodController(mealsWidget: mealsWidget, currentMealType: currentMealType, delegate: delegate)
        push(controller: controller)
    }
    
    func pushWriteToUs() {
        let controller = WriteToUsController()
        push(controller: controller)
    }
    
    func presentAddProduct(sourceByMeal: [SourcesByMealMainModel], isUpdate: Bool, model: ProductsMainModel, mealId: String, delegate: FoodAddControllerProtocol) {
        let controller = FoodAddController(sourceByMeal: sourceByMeal, isUpdate: isUpdate, model: model, mealID: mealId, delegate: delegate)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        present(controller: controller, presentStyle: .overCurrentContext)
    }
    
    func presentUpdateWieght(measureSystem: WeightMeasure?, weight: Float?, delegate: EnergyUpdateWeightProtocol) {
        let controller = EnergyUpdateWeightController(measureSystem: measureSystem, weight: weight, delegate: delegate)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        present(controller: controller, presentStyle: .overCurrentContext)
    }
}
