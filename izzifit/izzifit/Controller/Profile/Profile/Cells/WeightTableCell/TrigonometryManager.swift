//
//  TrigonometryManager.swift
//  izzifit
//
//  Created by O l e h on 04.04.2022.
//

import UIKit

struct TrigonometryManager {
    
    func getBackIntersectionPoint(by firstPoint: CGPoint,
                              and secondPoint: CGPoint,
                              intersectionY: CGFloat) -> CGPoint {
        
        let oppositeLegWholeTriangle = secondPoint.x - firstPoint.x
        let adjacentLegWholeTriangle = secondPoint.y - firstPoint.y
        
        // Hypotenuse whole triangle
        let hyp = getHyp(leg1: Double(oppositeLegWholeTriangle),
                         leg2: Double(adjacentLegWholeTriangle))
        
        // Angle
        let angle = getAngleBy(oppLeg: oppositeLegWholeTriangle,
                               hyp: hyp)
        
        // Opposite Leg Intersected Triangle
        
        let adjacentLegIntersectionTriangle = secondPoint.y - intersectionY
        
        let oppositeIntersectedLeg = calculateOppositeLeg(adjacentC: adjacentLegIntersectionTriangle,
                                                          adjacentAngle: angle)
        
        let betwweenFirstAndIntersectionLength = oppositeLegWholeTriangle - oppositeIntersectedLeg
        
        let intersectionX = (firstPoint.x + betwweenFirstAndIntersectionLength) + 1.0
        
        return CGPoint(x: intersectionX,
                       y: intersectionY)
    }
    
    
    func getForwardIntersectionPoint(by firstPoint: CGPoint,
                              and secondPoint: CGPoint,
                              intersectionY: CGFloat) -> CGPoint {
        
        let oppositeLegWholeTriangle = secondPoint.x - firstPoint.x
        let adjacentLegWholeTriangle = firstPoint.y - secondPoint.y
        
        let hyp = getHyp(leg1: Double(oppositeLegWholeTriangle),
                         leg2: Double(adjacentLegWholeTriangle))
        
        let angle = getAngleBy(oppLeg: oppositeLegWholeTriangle,
                               hyp: hyp)
        
        let adjacentLegIntersectionTriangle = firstPoint.y - intersectionY
        
        let oppositeIntersectedLeg = calculateOppositeLeg(adjacentC: adjacentLegIntersectionTriangle,
                                                          adjacentAngle: angle)
        let x = (firstPoint.x + oppositeIntersectedLeg) - 1.0
        
        return CGPoint(x: x,
                       y: intersectionY)
    }
//    func calculateAngleBy(adjacentC: CGFloat, oppositeC: CGFloat) -> CGFloat {
//       let divided =  adjacentC  /   oppositeC
//        let angle = atan(divided)
//        return angle
//    }
    
    func getHyp(leg1: Double, leg2: Double) -> Double {
        let hyp = (leg1 * leg1) + (leg2 * leg2)
        let result = sqrt(hyp)
        
        return result
    }

    
    func getAngleBy(oppLeg: Double, hyp: Double) -> Double {
        let angle = tan(oppLeg / hyp)
        return angle
    }
    
    func calculateOppositeLeg(adjacentC: Double, adjacentAngle: Double) -> Double {
        return (adjacentC * tan(adjacentAngle))
    }
    
    func recognizeCombination(backPoint: CGPoint, forwardPoint: CGPoint, interY: CGFloat) -> ChartCombinations {
        if backPoint.y < interY && forwardPoint.y > interY { return .triangleIntersectionBackToForward }
        else if backPoint.y > interY && forwardPoint.y < interY { return .triangleIntersectionForwardToBack }
        else if backPoint.y > interY && forwardPoint.y > interY { return .twoPointsUnderTarget }
        return .none
    }
}

enum ChartCombinations {
    case triangleIntersectionForwardToBack
    case triangleIntersectionBackToForward
    case twoPointsUnderTarget
    case none
}

