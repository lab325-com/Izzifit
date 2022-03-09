//
//  MoodWidgetModel.swift
//  izzifit
//
//  Created by Andrey S on 08.03.2022.
//

import Foundation

struct MoodWidgetModel: Codable {
    let moodWidget: MoodWidgetMainModel
}

struct MoodWidgetMainModel: Codable {
    let energy: Int?
    let energyTotal: Int?
    let mood: MoodType?
}

extension MoodType: Codable {
    
}
