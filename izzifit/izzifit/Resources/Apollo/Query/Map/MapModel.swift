//
//  MapModel.swift
//  izzifit
//
//  Created by Andrey S on 29.04.2022.
//

import Foundation

struct MapModel: Codable {
    let map: MapMainModel
}

struct MapMainModel: Codable {
    let id: String
    let name: String
    let buildings: [BuildingsModel]
    
    let spins: [SpinsModel]
    let spinObjects: [SpinObjectsModel]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case buildings = "Buildings"
        case spins = "Spins"
        case spinObjects = "SpinObjects"
    }
}

struct BuildingsModel: Codable {
    let id: String
    let name: String
    let maxLevel: Int
    let level: Int
}

struct SpinsModel: Codable {
    let id: String
    let spinObjectIds: [Int]
}

struct SpinObjectsModel: Codable {
    let id: String
    let type: SpinObjectType
    let image: ImageModel
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case image = "Image"
    }
}

extension SpinObjectType: Codable {
    
}
