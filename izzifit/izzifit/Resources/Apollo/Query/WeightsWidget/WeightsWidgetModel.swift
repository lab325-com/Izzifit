//
//  WeightsWidgetModel.swift
//  izzifit
//
//  Created by O l e h on 31.03.2022.
//

import Foundation

struct WeightsWidgetModel: Codable {
    let weightsWidget: WeightsWidgetMainModel?
}

struct WeightsWidgetMainModel: Codable {
    let Weights: [Weight]
    let measure: WeightMeasure
    let targetWeight: Float
}

struct Weight: Codable {
    let date: String
    let weight: Float
}
