//
//  WorkoutsModel.swift
//  izzifit
//
//  Created by mob325 on 31.03.2022.
//

import Foundation

struct WorkoutsModel: Codable {
    let workouts: WorkoutsMainModel
}

struct WorkoutsMainModel: Codable {
    let pagination: PaginationModel?
    let workouts: [WorkoutByIdMainModel]
    
    enum CodingKeys: String, CodingKey {
        case pagination = "Pagination"
        case workouts = "Workouts"
    }
}

struct PaginationModel: Codable {
    let nextPageExists: Bool?
    let prevPageExist: Bool?
    let total: Int?
    let totalPages: Int?
}
