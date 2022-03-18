//
//  MealsWidgetModel.swift
//  izzifit
//
//  Created by Andrey S on 07.03.2022.
//

import Foundation

struct MealsWidgetModel: Codable {
    let mealsWidget: MealsWidgetMainModel
}

struct MealsWidgetMainModel: Codable {
    let energy: Int?
    let energyTotal: Int?
    let meals: [MealModel?]?
    let sources: [SourceModel?]?
}

struct MealModel: Codable {
    let id: String?
    let eatenAt: String?
    let products: [ProductsMainModel?]?
    let type: MealType?
    
    var textProduct: String {
        var text: [String] = []
        guard let allProduct = products else { return text.joined(separator: ", ")}
        for product in allProduct {
            if let product = product {
                if product.measure == .productMeasureTypeGram {
                    text.append("\(product.name ?? "") \(product.amount ?? 0)g")
                } else {
                    text.append("\(product.name ?? "") \(product.amount ?? 0)g")
                }
            }
        }
        
        return text.joined(separator: ", ")
    }
}

struct SourceModel: Codable {
    let donePercents: Int?
    let left: Int?
    let name: SourceEntityType?
    let needed: Int?
}

extension SourceEntityType: Codable {
    
}

extension MealType: Codable {
    var text: String {
        switch self {
        case .mealTypeDinner:
            return RLocalization.food_dinner()
        case .mealTypeLunch:
            return RLocalization.food_lunch()
        case .mealTypeSnack:
            return RLocalization.food_snack()
        case .mealTypeBreakfast:
            return RLocalization.food_breakfast()
        case .__unknown(_):
            return ""
        }
    }
}
