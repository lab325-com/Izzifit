//
//  SleepWidgetModel.swift
//  izzifit
//
//  Created by Andrey S on 07.03.2022.
//

import Foundation

struct SleepWidgetModel: Codable {
    let sleepWidget: SleepWidgetMainModel
}

struct SleepWidgetMainModel: Codable {
    let energy: Int?
    let energyTotal: Int?
    let quality: SleepQualityType?
}

extension SleepQualityType: Codable {
    
}
