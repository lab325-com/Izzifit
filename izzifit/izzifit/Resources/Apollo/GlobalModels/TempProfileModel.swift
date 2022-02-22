//
//  TempProfileModel.swift
//  izzifit
//
//  Created by Andrey S on 16.02.2022.
//

import Foundation

struct TempProfileModel: Codable {
    var name: String?
    var gender: GenderPlanType?
    var goal: QuizeGoalType?
    var age: Int?
    
    var heightMetric: QuizeHeightType?
    var smHeight: Int?
    var ft: Int?
    var inch: Int?
    
    var weightMetric: QuizeWeightType?
    var weight: Double?
    
    var targetWeightMetric: QuizeWeightType?
    var targetWeight: Double?
    
    var food: FoodGroupModel?
    
    var sport: QuizeSportType?
    
    var email: String?
    
    mutating func setName(_ name: String) {
        self.name = name
    }
    
    mutating func setGender(_ gender: GenderPlanType) {
        self.gender = gender
    }
    
    mutating func setGoal(_ goal: QuizeGoalType) {
        self.goal = goal
    }
    
    mutating func setAge(_ age: Int) {
        self.age = age
    }
    
    mutating func setHeightMetric(_ heightMetric: QuizeHeightType) {
        self.heightMetric = heightMetric
    }
    
    mutating func setSmHeight(_ smHeight: Int?) {
        self.smHeight = smHeight
    }
    
    mutating func setFtHeight(ft: Int, inch: Int) {
        self.ft = ft
        self.inch = inch
    }
    
    mutating func setWeightMetric(_ weightMetric: QuizeWeightType) {
        self.weightMetric = weightMetric
    }
    
    mutating func setWeight(_ weight: Double) {
        self.weight = weight
    }
    
    mutating func setTargetWeightMetric(_ targetWeightMetric: QuizeWeightType) {
        self.targetWeightMetric = targetWeightMetric
    }
    
    mutating func setTargetWeight(_ targetWeight: Double) {
        self.targetWeight = targetWeight
    }
    
    mutating func setFood(_ food: FoodGroupModel?) {
        self.food = food
    }
    
    mutating func setSport(_ sport: QuizeSportType?) {
        self.sport = sport
    }
    
    mutating func setEmail(_ email: String) {
        self.email = email
    }
}
