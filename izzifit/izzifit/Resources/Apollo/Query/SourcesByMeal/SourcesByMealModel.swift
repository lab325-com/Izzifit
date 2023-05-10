//
//  SourcesByMealModel.swift
//  izzifit
//
//  Created by mob325 on 16.03.2022.
//

import Foundation

struct SourcesByMealModel: Codable {
    let sourcesByMeal: [SourcesByMealMainModel]
}

struct SourcesByMealMainModel: Codable {
    let eaten: Int?
    let name: SourceEntityType?
    let needed: Int?
    let id: Int?
}
