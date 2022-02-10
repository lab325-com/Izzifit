//
//  Int+Extension.swift
//  Hark
//
//  Created by Andrey S on 11.01.2022.
//

import Foundation

extension Int {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)m"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)k"
        }
        else {
            return "\(self)"
        }
    }
    
    var roundedWithAbbreviationsSystem: (countNumber: Int, systemMetrics: String?) {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return (countNumber: Int(round(million*10)/10), systemMetrics: "m")
        }
        else if thousand >= 1.0 {
            return (countNumber: Int(round(thousand*10)/10), systemMetrics: "k")
        }
        else {
            return (countNumber: Int(self), systemMetrics: nil)
        }
    }
}
