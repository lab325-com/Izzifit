//
//  TrigonometryManager.swift
//  izzifit
//
//  Created by O l e h on 04.04.2022.
//

import UIKit

struct TrigonometryManager {
    
    func getBackIntersectedStrokeEnd(by firstPoint: CGPoint,
                                     and secondPoint: CGPoint,
                                     intersectionY: CGFloat) -> CGFloat {
        // 0. два катета целого треугольника
        let oppositeLegWholeTriangle = secondPoint.x - firstPoint.x
        let adjacentLegWholeTriangle = secondPoint.y - firstPoint.y
        // 1. длина гипотенузы целого треугольника
        let hyp = getHyp(leg1: oppositeLegWholeTriangle,
                         leg2: adjacentLegWholeTriangle)
        // 2. угол по гипотенузе и противоположному катету
        let angle = getAngleBy(oppLeg: oppositeLegWholeTriangle,
                               hyp: hyp)
        // 3. прилегающий катет пересеченного треугольника
        let adjacentLegIntersectionTriangle = secondPoint.y - intersectionY
        // 4. гипотенуза пересеченного треугольника
        let intersectedHyp = getHyp(adjLeg: adjacentLegIntersectionTriangle,
                                    angle: angle)
        // 5, сколько процентов гипотенуза пересеченного составляет от гипотенузы целого в формате "0.55"
        return intersectedHyp / hyp
    }
    
    func getForwardIntersectedStrokeEnd(by firstPoint: CGPoint,
                                        and secondPoint: CGPoint,
                                        intersectionY: CGFloat) -> CGFloat {
        // 0. два катета целого треугольника
        let oppositeLegWholeTriangle = secondPoint.x - firstPoint.x
        let adjacentLegWholeTriangle = firstPoint.y - secondPoint.y
        // 1. длина гипотенузы целого треугольника
        let hyp = getHyp(leg1: oppositeLegWholeTriangle,
                         leg2: adjacentLegWholeTriangle)
        // 2. угол по гипотенузе и противоположному катету
        let angle = getAngleBy(oppLeg: oppositeLegWholeTriangle,
                               hyp: hyp)
        // 3. прилегающий катет пересеченного треугольника
        let adjacentLegIntersectionTriangle = firstPoint.y - intersectionY
        // 4. гипотенуза пересеченного треугольника
        let intersectedHyp = getHyp(adjLeg: adjacentLegIntersectionTriangle,
                                    angle: angle)
        // 5, сколько процентов гипотенуза пересеченного составляет от гипотенузы целого в формате "0.55"
        return intersectedHyp / hyp
    }

    func getHyp(leg1: Double, leg2: Double) -> Double {
        let hyp = (leg1 * leg1) + (leg2 * leg2)
        return sqrt(hyp)
    }
    
    func getAngleBy(oppLeg: Double, hyp: Double) -> Double {
        return tan(oppLeg / hyp)
    }

    func getHyp(adjLeg: Double, angle: Double) -> Double {
        return adjLeg / cos(angle)
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

