//
//  SpinModel.swift
//  izzifit
//
//  Created by Andrey S on 29.04.2022.
//

import Foundation

struct SpinModel: Codable {
    let spin: [SpinMainModel]
}

struct SpinMainModel: Codable {
    let type: SpinObjectRewardType
    let amount: Int
}

extension SpinObjectRewardType: Codable {}
