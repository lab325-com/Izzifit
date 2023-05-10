//
//  SaveWeightWidgetModel.swift
//  izzifit
//
//  Created by mob325 on 09.03.2022.
//

import Foundation

struct SaveWeightWidgetModel: Codable {
    let saveWeightWidget: SaveWeightWidgetMainModel
}

struct SaveWeightWidgetMainModel: Codable {
    let energy: Int?
    let energyTotal: Int?
    let measure: WeightMeasure?
    let targetWeight: Float?
    let weight: Float?
    let createdAt: String?
    
    var dateString: String? {
        
        let oldDateFormatter = DateFormatter()
        oldDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        oldDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let createdAt = createdAt, let gettedDate = oldDateFormatter.date(from: createdAt) else {
            return nil
        }
        
        if Calendar.current.isDateInToday(gettedDate) {
            return "Today"
        } else if Calendar.current.isDateInYesterday(gettedDate) {
            return "Yesterday"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd LLLL"
            dateFormatter.locale =  Locale(identifier: "en_US_POSIX")
            return dateFormatter.string(from: gettedDate)
        }
    }
}

extension WeightMeasure: Codable {
    var text: String {
        switch self {
        case .weightMeasureTypeLb:
            return "lb"
        case .weightMeasureTypeKg:
            return "kg"
        default:
            return ""
        }
    }
}
