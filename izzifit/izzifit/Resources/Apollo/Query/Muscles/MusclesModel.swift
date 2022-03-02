//
//  MusclesModel.swift
//  izzifit
//
//  Created by Andrey S on 02.03.2022.
//

import Foundation

struct MusclesModel: Codable {
    let muscles: [MusclesMainModel]
}

struct MusclesMainModel: Codable, Hashable {
    let id: String
    let isToggled: Bool
    let name: String
}
