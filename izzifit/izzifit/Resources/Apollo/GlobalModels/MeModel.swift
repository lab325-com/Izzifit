//
//  MeModel.swift
//  izzifit
//
//  Created by Andrey S on 16.02.2022.
//

import Foundation

struct MeModel: Codable {
    let me: MeMainModel
}

struct MeMainModel: Codable {
    let age: Int?
    let coins: Int?
    let darkTheme: Bool?
    let doSport: DoSportType?
    let email: String?
    let energy: Int?
    let fitnessPreference: FitnessPreferenceType?
    let foodGroupId: Int?
    let gender: GenderType?
    let goal: GoalType?
    let growth: Int?
    let id: String?
    let name: String?
    let notifications: Bool?
    let reminders: Bool?
    let showOnBoarding: Bool?
    let weight: Float?
}

extension DoSportType: Codable {
    
}

extension FitnessPreferenceType: Codable {
    
}

extension GenderType: Codable {
    
}

extension GoalType: Codable {
    
}
