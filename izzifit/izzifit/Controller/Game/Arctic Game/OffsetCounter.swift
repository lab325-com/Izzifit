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
    
    internal lazy var raceBrakeDistance: CGFloat = {
        var distance = CGFloat()
        var first = StrideConstants.firstStride * 12
        var second = StrideConstants.secondStride * 10
        var third = StrideConstants.thirdStride * 10
        var fourth = StrideConstants.fourthStride * 10
        var fifth = StrideConstants.fifthStride * 10
        var sixth = StrideConstants.sixthStride * 10
        var seventh = StrideConstants.seventhStride * 10
        var eighth = StrideConstants.eighthStride * 10
        var nineth = StrideConstants.ninethStride * 10
        var tenth = StrideConstants.tenthStride * 10
        distance = first + second + third + fourth + fifth + sixth + seventh + eighth + nineth + tenth
        return distance
    }()// 552  ( 6 * 1) x 2 // принтани на 8 плюс - должно быть 552
    lazy var startRaceDistance: CGFloat = {
        StrideConstants.minSpeedStride * 48
    }() // принтани на 8 плюс - должно быть 768

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

struct StrideConstants {
    static var firstStride = UIScreen.main.bounds.size.height / 736
    static var secondStride = UIScreen.main.bounds.size.height / 368
    static var thirdStride = UIScreen.main.bounds.size.height / 245.4
    static var fourthStride = UIScreen.main.bounds.size.height / 184
    static var fifthStride = UIScreen.main.bounds.size.height / 147.2
    static var sixthStride = UIScreen.main.bounds.size.height / 122.6
    static var seventhStride = UIScreen.main.bounds.size.height / 105.1
    static var eighthStride = UIScreen.main.bounds.size.height / 92
    static var ninethStride = UIScreen.main.bounds.size.height / 81.7
    static var tenthStride = UIScreen.main.bounds.size.height / 73.6
    static var minSpeedStride = UIScreen.main.bounds.size.height / 46
}
