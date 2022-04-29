//
//  OffsetCounter.swift
//  izzifit
//
//  Created by O l e h on 28.04.2022.
//

import UIKit

protocol OffsetCounterProtocol {

    static var firstArray: [Int] { get set }
    static var secondArray: [Int] { get set }
    static var thirdArray: [Int] { get set }

    var oneCellStrideOffset: CGFloat {get set}
    
    var speedIteraror: CGFloat { get set }
    var raceBrakeDistance: CGFloat { get set }

    func distanceToTargetCell() -> CGFloat
    func overDistance() -> CGFloat
    func calculateVelocityStride() -> CGFloat
}

class OffsetCounter: OffsetCounterProtocol {

    var oneCellStrideOffset: CGFloat
    
    init(strideOffset: CGFloat) {
        print(strideOffset)
        self.oneCellStrideOffset = strideOffset
    }
    
   lazy var defaultSpeed: CGFloat = {
       var totalDistance = raceBrakeDistance + startRaceDistance
       let residue = -(totalDistance.remainder(dividingBy: oneCellStrideOffset))
       let minimalWholeRaceDistance = startRaceDistance + residue
       let speedStride = minimalWholeRaceDistance / speedIteraror
       return speedStride
    }()
    
    static var firstArray: [Int] = {
        var array = [Int]()
        for _ in 0...2800 {
            let random = Int(arc4random_uniform(5))
            array.append(random)
        }
        return array

    }()

    static var secondArray: [Int] = {
        var array = [Int]()
        for _ in 0...2800 {
            let random = Int(arc4random_uniform(5))
            array.append(random)
        }
        return array

    }()

    static var thirdArray: [Int] = {
        var array = [Int]()
        for _ in 0...2800 {
            let random = Int(arc4random_uniform(5))
            array.append(random)
        }
        return array
    }()

    var speedIteraror: CGFloat = 48.0
    var raceBrakeDistance: CGFloat = 552.0
    var startRaceDistance: CGFloat = 768.0

    func distanceToTargetCell() -> CGFloat {
        return 0.0
    }

    func overDistance() -> CGFloat {
        return 0.0
    }

    func calculateVelocityStride() -> CGFloat {
        return 0.0
    }


}
