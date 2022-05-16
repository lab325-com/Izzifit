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
    lazy var minStridesCount: Int = {
      Int((raceBrakeDistance + forsageDistance) / oneCellStrideOffset) + 1
    }()
    var firstIndexPathRow = 8998
    var startSecondIndexPathRow = 8998
    var startThirdIndexPathRow = 8998
    //[0: SlotImgs.dollar,
    // 1: SlotImgs.snowflake,
    // 2: SlotImgs.moneyBag,
    // 3: SlotImgs.hammer,
    // 4: SlotImgs.lightning]
    var combinations: [MapSpinsModel] = []
    
    init(strideOffset: CGFloat) {
        print(strideOffset)
        self.oneCellStrideOffset = strideOffset
    }
    
   lazy var defaultSpeed: CGFloat = {
      let neededDistance = oneCellStrideOffset * CGFloat(minStridesCount)
       let forsage = neededDistance - raceBrakeDistance
       let speedStride = forsage / 48
       return speedStride
    }()
    
    static var firstArray: [Int] = {
        var array = [Int]()
        for _ in 0...9000 {
            let random = Int.random(in: 1...5)
            array.append(random)
        }
        return array
    }()

    static var secondArray: [Int] = {
        var array = [Int]()
        for _ in 0...9000 {
            let random = Int.random(in: 1...5)
            array.append(random)
        }
        return array

    }()

    static var thirdArray: [Int] = {
        var array = [Int]()
        for _ in 0...9000 {
            let random = Int.random(in: 1...5)
            array.append(random)
        }
        return array
    }()

    var speedIteraror: CGFloat = 48.0
    
    var raceBrakeDistance: CGFloat = {
        let first = StrideConstants.firstStride * 12
        let second = StrideConstants.secondStride * 10
        let third = StrideConstants.thirdStride * 10
        let fourth = StrideConstants.fourthStride * 10
        let fifth = StrideConstants.fifthStride * 10
        let sixth = StrideConstants.sixthStride * 10
        let seventh = StrideConstants.seventhStride * 10
        let eighth = StrideConstants.eighthStride * 10
        let nineth = StrideConstants.ninethStride * 10
        let tenth = StrideConstants.tenthStride * 10
        let distance = first + second + third + fourth + fifth + sixth + seventh + eighth + nineth + tenth
        return distance
    }()
    lazy var forsageDistance: CGFloat = {
        StrideConstants.minSpeedStride * speedIteraror
    }()

    func distanceToTargetCell() -> CGFloat {
        return 0.0
    }

    func overDistance() -> CGFloat {
        return 0.0
    }

    func spiningStride(to elementIndex: Int,
                       from tableInt: Int,
                       currentArray: [Int]) -> CGFloat {
        var indexPathRow = Int()
        
        switch tableInt {
        case 0: indexPathRow = firstIndexPathRow
        case 1: indexPathRow = startSecondIndexPathRow
        case 2: indexPathRow = startThirdIndexPathRow
        default: break
        }
        let newIndex = indexPathRow - minStridesCount//23 // ошибка здесь
        let toElement = SlotRowModel(indexPathRow: newIndex,
                                     slotInt: currentArray[newIndex])
        guard elementIndex != toElement.slotInt else {
            switch tableInt {
            case 0: firstIndexPathRow = indexPathRow - minStridesCount
            case 1: startSecondIndexPathRow = indexPathRow - minStridesCount
            case 2: startThirdIndexPathRow = indexPathRow - minStridesCount
            default: break
            }
            return defaultSpeed }
     
        let arrayModels = get40SlotsUponRandomSlotInt(startElement: toElement.indexPathRow,
                                                      currentArray: currentArray)
        
        guard let matchedElemenIndex = returnMatchedIndexPathRow(matchElement: elementIndex,
                                                                 arrayModels: arrayModels) else { return 0.0 }
            print("MMM\(matchedElemenIndex)")
            let totalDistanceInCells = indexPathRow - matchedElemenIndex
            
            switch tableInt {
            case 0: firstIndexPathRow = indexPathRow - totalDistanceInCells
            case 1: startSecondIndexPathRow = indexPathRow - totalDistanceInCells
            case 2: startThirdIndexPathRow = indexPathRow - totalDistanceInCells
            default: break
            }
            
           
            let totalDistance = CGFloat(totalDistanceInCells) * oneCellStrideOffset
            let raceDistance = totalDistance - raceBrakeDistance
            let speedStride = raceDistance / speedIteraror
            return speedStride
      
    }
    
    func returnMatchedIndexPathRow(matchElement: Int,
                                   arrayModels: [SlotRowModel]) -> Int? {
        for slot in arrayModels {
            if slot.slotInt == matchElement {
                return slot.indexPathRow
            }
        }
        return nil
    }
    
    func get40SlotsUponRandomSlotInt(startElement: Int,
                                     currentArray: [Int]) -> [SlotRowModel] {
        var array = [SlotRowModel]()
        for n in 1...39 {
            array.append(SlotRowModel(indexPathRow: startElement - n,
                                      slotInt: currentArray[(startElement - n)]))
        }
        return array
    }
    
    func calculateVelocityStride() -> CGFloat {
        return 0.0
    }
}

struct StrideConstants {
    static var firstStride: CGFloat = UIScreen.main.bounds.size.height / 736
    static var secondStride: CGFloat = UIScreen.main.bounds.size.height / 368
    static var thirdStride: CGFloat =  UIScreen.main.bounds.size.height / 245.4
    static var fourthStride: CGFloat = UIScreen.main.bounds.size.height / 184
    static var fifthStride: CGFloat = UIScreen.main.bounds.size.height / 147.2
    static var sixthStride: CGFloat = UIScreen.main.bounds.size.height / 122.6
    static var seventhStride: CGFloat = UIScreen.main.bounds.size.height / 105.1
    static var eighthStride: CGFloat = UIScreen.main.bounds.size.height / 92
    static var ninethStride: CGFloat = UIScreen.main.bounds.size.height / 81.7
    static var tenthStride: CGFloat = UIScreen.main.bounds.size.height / 73.6
    static var minSpeedStride: CGFloat = UIScreen.main.bounds.size.height / 46
}
