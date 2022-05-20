//
//  WidgetList.swift
//  izzifit
//
//  Created by Andrey S on 19.05.2022.
//

import Foundation

struct WidgetListModel: Codable {
    let widgetList: [WidgetListMainModel]
}

struct WidgetListMainModel: Codable {
    let type: WidgetEntityType
}

extension WidgetEntityType: Codable {
    
}
