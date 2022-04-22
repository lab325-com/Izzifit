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
    var globalSpinCounter: Int { get set }
    func get40SlotsUponRandomSlotInt(startElement: Int, tableView: UITableView) -> [SlotRowModel] // cнизу вверх
    func spin(to elementIndex: Int, check currentRandomSlotModel: SlotRowModel, tableView: UITableView) -> Int // Indexpath.row of necessary element - это мы отдаем вместо randomSlotInt
}

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
    
    var globalSpinCounter: Int = 0
    
    var currentCombination: [Int]  {
        combinations[globalSpinCounter]
    }
    
    func get40SlotsUponRandomSlotInt(startElement: Int,
                                     tableView: UITableView) -> [SlotRowModel] {
        var array = [SlotRowModel]()
        for n in 1...39{
            array.append(SlotRowModel(indexPathRow: startElement - n,
                                      slotInt: SpinLogicManager.array[(startElement - n)]))
        }
        return array
    }
    
    func spin(to elementIndex: Int, check currentRandomSlotModel: SlotRowModel, tableView: UITableView) -> Int {
        guard elementIndex != currentRandomSlotModel.slotInt else { return currentRandomSlotModel.slotInt }
        
        let arrayUponSlot = get40SlotsUponRandomSlotInt(startElement: currentRandomSlotModel.indexPathRow,
                                                        tableView: tableView)
        for slot in arrayUponSlot {
            if slot.slotInt == elementIndex {
                return slot.indexPathRow
            }
        }
        return currentRandomSlotModel.slotInt
    }
}
