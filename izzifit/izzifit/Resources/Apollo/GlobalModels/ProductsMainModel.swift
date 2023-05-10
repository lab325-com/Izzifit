//
//  ProductsMainModel.swift
//  izzifit
//
//  Created by mob325 on 16.03.2022.
//

import Foundation

struct ProductsMainModel: Codable, Hashable {
    let Image: ImageModel?
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
    var text: String {
        switch self {
        case .productMeasureTypeGram:
            return "g"
        case .productMeasureTypePcs:
            return "pcs"
        case .__unknown(_):
            return ""
        }
    }
}
