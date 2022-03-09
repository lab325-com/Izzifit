//
//  ProducsModel.swift
//  izzifit
//
//  Created by Andrey S on 28.02.2022.
//

import Foundation

struct ProductsModel: Codable {
    let products: [ProductsMainModel]
}

struct ProductsMainModel: Codable, Hashable {
    let id: String?
    let isToggled: Bool?
    let name: String?
    let measure: ProductMeasure?
    let amount: Int?
    let ProductSources: [ProductSourceModel?]?
}

struct ProductSourceModel: Codable, Hashable {
    let amount: Int?
    let name: SourceEntityType?
}

extension ProductMeasure: Codable {
    
}

