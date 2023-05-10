//
//  WeightsWidgetModel.swift
//  izzifit
//
//  Created by mob325 on 31.03.2022.
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
    let createdAt: String
    let weight: Float
}
