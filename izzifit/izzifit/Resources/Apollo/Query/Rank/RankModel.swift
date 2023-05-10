//
//  RankModel.swift
//  izzifit
//
//  Created by mob325 on 23.03.2022.
//

import Foundation

struct RankModel: Codable {
    let rank: RankMainModel?
}


struct RankMainModel: Codable {
    let countryPosition: Int?
    let globalPosition: Int?
    let level: Int?
    let rank: Int?
}

