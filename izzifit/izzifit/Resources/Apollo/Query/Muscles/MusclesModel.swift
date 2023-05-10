//
//  MusclesModel.swift
//  izzifit
//
//  Created by mob325 on 02.03.2022.
//

import Foundation

struct MusclesModel: Codable {
    let muscles: [MusclesMainModel]
}

struct MusclesMainModel: Codable, Hashable {
    let id: Int
    let isToggled: Bool?
    let name: String
}
