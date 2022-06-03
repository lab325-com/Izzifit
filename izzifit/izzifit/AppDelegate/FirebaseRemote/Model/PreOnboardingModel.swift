//
//  PreOnboardingModel.swift
//  izzifit
//
//  Created by Andrey S on 03.06.2022.
//

import Foundation

enum PreVideoType: String, Codable {
    case video
}

struct PreOnboardingModel: Codable {
    let video: PreVideoOnboardingModel
}

struct PreVideoOnboardingModel: Codable {
    let afterPogess: Bool
    let screen: PreVideoType?
}
