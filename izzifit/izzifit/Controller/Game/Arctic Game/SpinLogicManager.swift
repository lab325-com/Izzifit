//
//  GameLogicManager.swift
//  izzifit
//
//  Created by O l e h on 07.04.2022.
//

import Foundation
import UIKit

struct SpinLogicManager {
    
    private var user: MeMainModel {
        get{
            return KeychainService.standard.me!
        }
        set{
            KeychainService.standard.me = nil
            KeychainService.standard.me = newValue
        }
    }

    
    func spinAction(coinsLbl: UILabel,
                             energyLbl: UILabel,
                             collectionView: UICollectionView,
                             spinBtn: UIButton,
                             runTimer: () -> ()) {
        decreaseEnergy()
        // реши вопрос с обновлением энергии и вообще обновлением сущности
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
            let currentElements = self.getResultIndices(collectionView)
            
            if let tupleResult = recognizeSetCombinations(currentElements) {
                print(tupleResult)
                // теперь тут будет по первому элементу тупла функция по начислению бонусов
                accrueBonuses(by: tupleResult.0)
                // функция котороая красит бордер ячеек по второму элементу тупла
                paintBlueBorder(tupleResult.1,collectionView: collectionView)
            }
            // мне нужен массив/сет  элементов, которые должны окраситься в синюю коемку ( borderView)
            // мне нужна  spinCombination
            
            spinBtn.isUserInteractionEnabled = true
        }
    }
    
    private func accrueBonuses(by combination: SpinCombination) {
        
    }
    
    private func decreaseEnergy() {
        KeychainService.standard.me?.energy! -= 1
    }
    
   private func matchedIndicesAndCombination(of array: [Int]) -> (SpinCombination,Set<Int>)? {
        var count = 0
        var res: Set<Int> = []
        var combination: SpinCombination!
        
        array.enumerated().forEach { (index, _ ) in
            if index > 0, array[index] == array[index - 1] {
                count += 1
                    res.update(with: index - 1)
                    res.update(with: index)
                switch array[index] {
                case 0: combination = .pairDollars
                case 1: combination = .pairSnowflakes
                case 2: combination = .pairMoneyBags
                case 3: combination = .pairHummers
                case 4: combination = .pairLightning
                default: break
                }
            }
        }
       
       guard count == 1 else { return nil }
       
        return (combination, res)
    }
    
    private func recognizeSetCombinations(_ resultIndices: [Int]) -> (SpinCombination, Set<Int>)? {
        switch resultIndices {
        case [0,0,0]: return (.setDollars, [0,1,2])
        case [1,1,1]: return (.setSnowflakes,[0,1,2])
        case [2,2,2]: return (.setMoneyBags, [0,1,2])
        case [3,3,3]: return (.setHummers, [0,1,2])
        case [4,4,4]: return (.setLightning, [0,1,2])
        default: break
        }
    
        guard let pairResultTuple = matchedIndicesAndCombination(of: resultIndices) else { return nil }
    
        return pairResultTuple
    }
    
    private func getResultIndices(_ collectionView: UICollectionView) -> [Int] {
      
        var indicesArray = [Int]()
        
        for item in collectionView.visibleCells.indices {
            
            let middleIndex = (collectionView.cellForItem(at: [0,item]) as! SlotCollectionCell).tableView.visibleCells[1].tag
            indicesArray.append(middleIndex)
        }
        return indicesArray
    }
    
    private func paintBlueBorder(_ set: Set<Int>, collectionView: UICollectionView) {
        
        for int in set {
        let table = ( collectionView.cellForItem(at: [0,int]) as! SlotCollectionCell).tableView
        let cell = (table.visibleCells[1] as! SlotTableViewCell)
        cell.borderView.isHidden = false
        }
    }
}

enum SpinCombination {
    case pairHummers,setHummers
    case pairDollars, setDollars
    case pairSnowflakes, setSnowflakes
    case pairMoneyBags, setMoneyBags
    case pairLightning, setLightning
}



