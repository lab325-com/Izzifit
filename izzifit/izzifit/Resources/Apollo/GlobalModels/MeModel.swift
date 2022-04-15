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
    var energy: Int?
    let fitnessPreference: WorkoutDifficulty?
    let gender: GenderType?
    let goal: GoalType?
    let growth: Int?
    let id: String?
    let name: String?
    let notifications: Bool?
    let reminders: Bool?
    let showOnBoarding: Bool?
    let weight: Float?
    let targetWeight: Float?
    let FoodGroup: FoodGroupModel?
    let Avatar: AvatarModel?
    
//    mutating func updateEnergy(_ by: Int) {
//        self.energy = by
//    }
}

struct FoodGroupModel: Codable {
    let Image: ImageModel?
    let id: Int?
    let name: String?
}

struct AvatarModel: Codable {
    let id: String?
    let url: String?
}

extension DoSportType: Codable {
    
}

extension WorkoutDifficulty: Codable {
    var text: String {
        switch self {
        case .workoutDifficultyTypeLight:
            return "Light"
        case .workoutDifficultyTypeProfessional:
            return "Strong"
        case .workoutDifficultyTypeStrong:
            return "Professional"
        case .__unknown(_):
            return ""
        }
    }
}

extension GenderType: Codable {
    
}

extension GoalType: Codable {
    
}
