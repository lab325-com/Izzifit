//
//  WorkoutsWidgetMainModel.swift
//  izzifit
//
//  Created by mob325 on 22.03.2022.
//

import Foundation

struct WorkoutsWidgetMainModel: Codable, Equatable {
    static func == (lhs: WorkoutsWidgetMainModel, rhs: WorkoutsWidgetMainModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let Image: ImageModel?
    let duration: IntervalRepresentationModel?
    let energy: Int?
    let energyTotal: Int?
    let id: String?
    let description: String?
    let shortDescription: String?
    let isAvailable: Bool?
    let isFinished: Bool?
    let title: String?
    let totalExercises: Int?
    let totalFinishedExercises: Int?
    let isSpecial: Bool?
    let externalId: String?
}

struct IntervalRepresentationModel: Codable {
    let hours: Int?
    let minutes: Int?
    let seconds: Int?
    
    var time: String {
        return String(format: "%02d", minutes ?? 0) + ":" + String(format: "%02d", seconds ?? 0)
    }
}
