//
//  Mood.swift
//  izzifit
//
//  Created by O l e h on 28.03.2022.
//

import Foundation

struct MoodsModel: Codable {
    let moods: [MoodsMainModel]?
}

struct MoodsMainModel: Codable {
    let date: Date?
    let mood: MoodType?
}

