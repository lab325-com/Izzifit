//
//  SaveWeightWidgetModel.swift
//  izzifit
//
//  Created by Andrey S on 09.03.2022.
//

import Foundation

struct SaveWeightWidgetModel: Codable {
    let saveWeightWidget: SaveWeightWidgetMainModel
}

struct SaveWeightWidgetMainModel: Codable {
    let energy: Int?
    let energyTotal: Int?
    let measure: WeightMeasure?
    let targetWeight: Float?
    let weight: Float?
}

extension WeightMeasure: Codable {
    var text: String {
        switch self {
        case .weightMeasureTypeLb:
            return "lb"
        case .weightMeasureTypeKg:
            return "kg"
        default:
            return ""
        }
    }
}
