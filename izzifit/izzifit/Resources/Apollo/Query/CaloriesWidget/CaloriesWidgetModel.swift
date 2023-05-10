//
//  CaloriesWidgetModel.swift
//  izzifit
//
//  Created by mob325 on 30.03.2022.
//

import Foundation

struct CaloriesWidgetModel: Codable {
    let caloriesWidget: CaloriesWidgetMainModel?
}

struct CaloriesWidgetMainModel: Codable {
    let Calories: [CaloriesModel]
    let target: Int
}

struct CaloriesModel: Codable {
    let amount: Int
    let createdAt: String
}
