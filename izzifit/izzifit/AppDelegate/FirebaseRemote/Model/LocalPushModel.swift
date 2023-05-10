//
//  LocalPushModel.swift
//  izzifit
//
//  Created by mob325 on 14.06.2022.
//

import Foundation

enum LocalPushType: String, Codable {
    case energyZero
    case goldZero
}

struct LocalPushModel: Codable {
    let type: LocalPushType?
    let title: String
    let description: String
}
