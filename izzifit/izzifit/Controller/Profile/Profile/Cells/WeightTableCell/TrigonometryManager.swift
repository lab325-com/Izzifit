//
//  TrigonometryManager.swift
//  izzifit
//
//  Created by O l e h on 04.04.2022.
//

import Foundation


struct TrigonometryManager {
    
    func calculateAngleBy(adjacentC: Double, oppositeC: Double) -> Double {
       let divided = oppositeC / adjacentC
        let angle = atan(divided)
        return angle
    }
    
    func calculateOppositeLeg(adjacentC: Double, adjacentAngle: Double) -> Double {
        return adjacentC / adjacentAngle
    }
}
