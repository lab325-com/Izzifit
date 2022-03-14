//
//  ProgressesModel.swift
//  izzifit
//
//  Created by Andrey S on 11.03.2022.
//

import Foundation

struct ProgressesModel: Codable {
    let progresses: [ProgressesMainModel]
}

struct ProgressesMainModel: Codable {
    let date: String?
    let progress: Int?
}
