//
//  DrinkWidgetModel.swift
//  izzifit
//
//  Created by mob325 on 05.03.2022.
//

import Foundation

struct DrinkWidgetModel: Codable {
    let drinkWidget: DrinkWidgetMainModel?
}

struct DrinkWidgetMainModel: Codable {
    let doneCups: Int
    let energy: Float
    let energyTotal: Int
    let left: Int
    let totalCups: Int
}
