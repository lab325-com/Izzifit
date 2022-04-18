//
//  GameLogicManager.swift
//  izzifit
//
//  Created by O l e h on 07.04.2022.
//

import Foundation
import UIKit

struct SpinLogicManager {
    
    var user: MeMainModel {
        get{
            return KeychainService.standard.me!
        }
        set{
            KeychainService.standard.me! = newValue
        }
    }
    
    
    mutating func spinAction(coinsLbl: UILabel,
                             energyLbl: UILabel,
                             collectionView: UICollectionView,
                             spinBtn: UIButton,
                             runTimer: () -> ()) {
        user.energy! -= 1
        energyLbl.text = String(user.energy!)
        spinBtn.isUserInteractionEnabled = false
        for item in collectionView.visibleCells.indices {
            let table = ( collectionView.cellForItem(at: [0,item]) as! SlotCollectionCell).tableView
            for i in  0...2 {
                let cell = (table.visibleCells[i] as! SlotTableViewCell)
                cell.slotBtn.isSelected = false
                table.reloadData()
            }
        }
        runTimer()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            spinBtn.isUserInteractionEnabled = true
        }
    }
    
    private func recognizeCombinations(_ resultIndices: [Int]) -> Int? {
        switch resultIndices {
        case [0,0,0]: return 400
        case [1,1,1]: return 2500
        case [2,2,2]: return 1000
        case [3,3,3]: return 1500
        case [4,4,4]: return 2000
        default: break
        }
        return nil
    }
    
    
    private func getResultIndices(_ collectionView: UICollectionView) -> [Int] {
      
        var indicesArray = [Int]()
        
        for item in collectionView.visibleCells.indices {
            
            let middleIndex = (collectionView.cellForItem(at: [0,item]) as! SlotCollectionCell).tableView.visibleCells[1].tag
            indicesArray.append(middleIndex)
        }
        return indicesArray
    }
}





