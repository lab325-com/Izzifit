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
    lazy var minimalCellsScrollStrideCount: Int = {
      Int((raceBrakeDistance + startRaceDistance) / oneCellStrideOffset) + 1
    }()
    var firstIndexPathRow = 2798
    var startSecondIndexPathRow = 2798
    var startThirdIndexPathRow = 2798
    //[0: SlotImgs.dollar,
    // 1: SlotImgs.snowflake,
    // 2: SlotImgs.moneyBag,
    // 3: SlotImgs.hammer,
    // 4: SlotImgs.lightning]
    var combinations: [[Int]] = [[2,0,0],
                                 [0,0,0],
                                 [1,1,0],
                                 [1,1,1],
                                 [2,2,1],
                                 [2,2,2],
                                 [1,3,3],
                                 [3,3,3],
                                 [4,4,1],
                                 [4,4,4]]
    
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
    
    var raceBrakeDistance: CGFloat = 552
    var startRaceDistance: CGFloat = 768

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
        let newIndex = indexPathRow - minimalCellsScrollStrideCount//23 // ошибка здесь
        let toElement = SlotRowModel(indexPathRow: newIndex,
                                     slotInt: currentArray[newIndex])
        guard elementIndex != toElement.slotInt else {
            indexPathRow -= minimalCellsScrollStrideCount//23
            switch tableInt {
            case 0: firstIndexPathRow = indexPathRow
            case 1: startSecondIndexPathRow = indexPathRow
            case 2: startThirdIndexPathRow = indexPathRow
            default: break
            }
            return defaultSpeed}
     
        let arrayModels = get40SlotsUponRandomSlotInt(startElement: toElement.indexPathRow,
                                                      currentArray: currentArray)
        
        if let matchedElemenIndex = returnMatchedIndexPathRow(matchElement: elementIndex,
                                                              arrayModels: arrayModels) {
            print("MMM\(matchedElemenIndex)")
            let totalDistanceInCells = indexPathRow - matchedElemenIndex
            indexPathRow -= totalDistanceInCells
            
            switch tableInt {
            case 0: firstIndexPathRow = indexPathRow
            case 1: startSecondIndexPathRow = indexPathRow
            case 2: startThirdIndexPathRow = indexPathRow
            default: break
            }
            
           
            let totalDistance = CGFloat(totalDistanceInCells) * oneCellStrideOffset
            let raceDistance = totalDistance - raceBrakeDistance
            let speedStride = raceDistance / speedIteraror
            return speedStride
        }
        return 0.0
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
    static var firstStride: CGFloat = 1 // UIScreen.main.bounds.size.height / 736
    static var secondStride: CGFloat = 2 //UIScreen.main.bounds.size.height / 368
    static var thirdStride: CGFloat = 3 // UIScreen.main.bounds.size.height / 245.4
    static var fourthStride: CGFloat = 4 //UIScreen.main.bounds.size.height / 184
    static var fifthStride: CGFloat = 5 //UIScreen.main.bounds.size.height / 147.2
    static var sixthStride: CGFloat = 6 //UIScreen.main.bounds.size.height / 122.6
    static var seventhStride: CGFloat = 7 //UIScreen.main.bounds.size.height / 105.1
    static var eighthStride: CGFloat = 8//UIScreen.main.bounds.size.height / 92
    static var ninethStride: CGFloat = 9// UIScreen.main.bounds.size.height / 81.7
    static var tenthStride: CGFloat = 10//UIScreen.main.bounds.size.height / 73.6
    static var minSpeedStride: CGFloat = 16//UIScreen.main.bounds.size.height / 46
}
