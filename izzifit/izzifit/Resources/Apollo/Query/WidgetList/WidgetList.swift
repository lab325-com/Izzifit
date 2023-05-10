//
//  WidgetList.swift
//  izzifit
//
//  Created by mob325 on 19.05.2022.
//

import Foundation

struct WidgetListModel: Codable {
    let widgetList: [WidgetEntityType]?
}

extension WidgetEntityType: Codable {
    
}
