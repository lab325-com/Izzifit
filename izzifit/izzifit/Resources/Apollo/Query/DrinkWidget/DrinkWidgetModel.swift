//
//  DrinkWidgetModel.swift
//  izzifit
//
//  Created by Andrey S on 05.03.2022.
//

import Foundation

struct DrinkWidgetModel: Codable {
    let drinkWidget: DrinkWidgetMainModel?
}

struct DrinkWidgetMainModel: Codable {
    let doneCups: Int
    let energy: Int
    let energyTotal: Int
    let left: Int
    let totalCups: Int
}
