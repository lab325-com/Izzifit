//
//  WidgetList.swift
//  izzifit
//
//  Created by Andrey S on 19.05.2022.
//

import Foundation

struct WidgetListModel: Codable {
    let widgetList: [WidgetEntityType]?
}

extension WidgetEntityType: Codable {
    
}
