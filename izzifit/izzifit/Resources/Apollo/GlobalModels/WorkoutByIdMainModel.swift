//
//  WorkoutByIdMainModel.swift
//  izzifit
//
//  Created by Andrey S on 30.03.2022.
//

import Foundation

struct WorkoutByIdMainModel: Codable, Equatable {
    static func == (lhs: WorkoutByIdMainModel, rhs: WorkoutByIdMainModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let exerciseGroups: [ExerciseGroupModel]?
    let image: ImageModel?
    let muscleGroupImages: [ImageModel]?
    let muscles: [MuscleModel]?
    let description: String?
    let duration: IntervalRepresentationModel?
    let energy: Int?
    let energyTotal: Int?
    let id: String?
    let isAvailable: Bool?
    let isFinished: Bool?
    let kCal: Int?
    let title: String?
    let totalExercises: Int?
    let totalFinishedExercises: Int?
    
    enum CodingKeys: String, CodingKey {
        case exerciseGroups = "ExerciseGroups"
        case image = "Image"
        case muscleGroupImages = "MuscleGroupImages"
        case muscles = "Muscles"
        case description = "description"
        case duration = "duration"
        case energy = "energy"
        case energyTotal = "energyTotal"
        case id = "id"
        case isAvailable = "isAvailable"
        case isFinished = "isFinished"
        case kCal = "kCal"
        case title = "title"
        case totalExercises = "totalExercises"
        case totalFinishedExercises = "totalFinishedExercises"
    }
}

struct ExerciseGroupModel: Codable {
    let exercises: [ExerciseModel]?
    let id: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case exercises = "Exercises"
        case id = "id"
        case title = "title"
    }
}

struct ExerciseModel: Codable {
    let image: ImageModel?
    let video: VideoModel?
    let description: String?
    let duration: IntervalRepresentationModel?
    let id: String?
    let isFinished: Bool?
    let isRest: Bool?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case image = "Image"
        case video = "Video"
        case description = "description"
        case duration = "duration"
        case id = "id"
        case isFinished = "isFinished"
        case isRest = "isRest"
        case title = "title"
    }
}

struct VideoModel: Codable {
    let createdAt: String?
    let id: String?
    let url: String?
}

struct MuscleModel: Codable {
    let id: String
    let isToggled: Bool
    let name: String
}
