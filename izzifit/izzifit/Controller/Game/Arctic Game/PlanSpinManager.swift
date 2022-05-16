//
//  PlanSpinManager.swift
//  izzifit
//
//  Created by O l e h on 22.04.2022.
//

import UIKit

struct SlotRowModel {
    let indexPathRow: Int
    let slotInt: Int
}

protocol PlanSpinProtocol {
    var combinations: [[Int]] { get }
    var firstSpinCounter: Int { get set }
//    func get40SlotsUponRandomSlotInt(startElement: Int) -> [SlotRowModel] // cнизу вверх
//    func spin(to elementIndex: Int, check currentRandomSlotModel: SlotRowModel) -> Int // Indexpath.row of necessary element - это мы отдаем вместо randomSlotInt
}
//[0: SlotImgs.dollar,
// 1: SlotImgs.snowflake,
// 2: SlotImgs.moneyBag,
// 3: SlotImgs.hammer,
// 4: SlotImgs.lightning]

class PlanSpinManager: PlanSpinProtocol {
    var combinations: [[Int]] = [[0,1,2],
                                 [0,0,0],
                                 [1,2,0],
                                 [1,1,1],
                                 [2,0,1],
                                 [2,2,2],
                                 [1,2,3],
                                 [3,3,3],
                                 [2,3,1],
                                 [4,4,4]]
    
    var firstSpinCounter: Int = 0
    var secondSpinCounter: Int = 0
    var thirdSpinCounter: Int = 0
    
    var firstCurrentCombination: [Int]  {
        combinations[firstSpinCounter]
    }
    
    var secondCurrentCombination: [Int] {
        combinations[secondSpinCounter]
    }
    
    var thirdCurrentCombination: [Int] {
        combinations[thirdSpinCounter]
    }
    
    // баг   комбинация с индексом 3 отдает два одинкавых числа - хотя не должна
//    func get40SlotsUponRandomSlotInt(startElement: Int) -> [SlotRowModel] {
//        var array = [SlotRowModel]()
//        for n in 1...39 {
//            array.append(SlotRowModel(indexPathRow: startElement - n,
//                                      slotInt: SpinLogicManager.array[(startElement - n)]))
//        }
//        return array
//    }
////
//    func spin(to elementIndex: Int,
//              check currentRandomSlotModel: SlotRowModel) -> Int {
//        guard elementIndex != currentRandomSlotModel.slotInt else { return currentRandomSlotModel.indexPathRow }
//
//        let arrayUponSlot = get40SlotsUponRandomSlotInt(startElement: currentRandomSlotModel.indexPathRow)
//        for slot in arrayUponSlot {
//            if slot.slotInt == elementIndex {
//                return slot.indexPathRow
//            }
//        }
//        return currentRandomSlotModel.indexPathRow
//    }
}
    
