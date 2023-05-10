//
//  Mood.swift
//  izzifit
//
//  Created by mob325 on 28.03.2022.
//

import Foundation

struct MoodsModel: Codable {
    let moods: [MoodsMainModel]
}

struct MoodsMainModel: Codable {
    let createdAt: String
    let mood: MoodType
}

