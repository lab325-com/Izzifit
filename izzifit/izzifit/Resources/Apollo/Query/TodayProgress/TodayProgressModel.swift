//
//  TodayProgressModel.swift
//  izzifit
//
//  Created by Andrey S on 09.03.2022.
//

import Foundation

struct TodayProgressModel: Codable {
    let progress: TodayProgressMainModel
}

struct TodayProgressMainModel: Codable {
    let date: String?
    let progress: Int?
}
