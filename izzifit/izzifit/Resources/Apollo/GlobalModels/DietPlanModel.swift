//
//  DietPlanModel.swift
//  izzifit
//
//  Created by mob325 on 12.08.2022.
//

import Foundation

struct DietPlanModel: Codable {
    let id: String?
    let title: String
    let description: String
    let schedule: [ScheduleModel]
    let kgLosePerWeek: Int
    let externalId: String?
    let image: ImageModel
    let kCal: Int
    let isAvailable: Bool?
    let energyTotal: Int?
    let shortDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case schedule = "Schedule"
        case kgLosePerWeek = "kgLosePerWeek"
        case externalId = "externalId"
        case image = "Image"
        case isAvailable = "isAvailable"
        case energyTotal = "energyTotal"
        case kCal = "kCal"
        case shortDescription = "shortDescription"
    }
}

struct ScheduleModel: Codable {
    let day: Int
    let meals: [ScheduleMealModel]
    
    enum CodingKeys: String, CodingKey {
        case day = "day"
        case meals = "Meals"
    }
}

struct ScheduleMealModel: Codable {
    let id: String
    let title: String
    let description: String
    let image: ImageModel
    let amount: String
    let prot: Int
    let carbs: Int
    let fats: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case image = "Image"
        case amount = "amount"
        case prot = "prot"
        case carbs = "carbs"
        case fats = "fats"
    }
}
