//
//  ProgressesModel.swift
//  izzifit
//
//  Created by Andrey S on 11.03.2022.
//

import Foundation

struct ProgressesModel: Codable {
    let progresses: [ProgressesMainModel]
}

struct ProgressesMainModel: Codable {
    let createdAt: String
    let progress: Int?
    
    var date: Int? {
        let oldDateFormatter = DateFormatter()
        oldDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        oldDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = oldDateFormatter.date(from: createdAt) else {
            return nil
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        return components.day
    }
}
