//
//  TodayProgressModel.swift
//  izzifit
//
//  Created by mob325 on 09.03.2022.
//

import Foundation

struct TodayProgressModel: Codable {
    let progress: TodayProgressMainModel
}

struct TodayProgressMainModel: Codable {
    let createdAt: String?
    let progress: Int?
}
