//
//  CaloriesWidgetModel.swift
//  izzifit
//
//  Created by O l e h on 30.03.2022.
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
    let date: String
}
