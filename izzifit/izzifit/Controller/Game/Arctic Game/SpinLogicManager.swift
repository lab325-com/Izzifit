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
            KeychainService.standard.me = nil
            KeychainService.standard.me = newValue
        }
    }
    
    static let array: [Int] = {
        var array = [Int]()
        for _ in 0...2800 {
            let random = Int(arc4random_uniform(5))
            array.append(random)
        }
        return array
    }()
    
    func spinAction(coinsLbl: UILabel,
                    energyLbl: UILabel,
                    resultLbl: UILabel,
                    collectionView: UICollectionView,
                    spinBtn: UIButton,
                    runTimer: () -> ()) {
   
        resultLbl.text = ""
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            AudioManager.sharedManager.playSound(type: .spinnerMain_11)
        }
        
        runTimer()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.8) {
            spinBtn.isUserInteractionEnabled = true
            coinsLbl.text = String(user.coins!)
            energyLbl.text = String(user.energy!)
        }
    }
    
    func accrueBonuses(by combination: SpinCombination, resultLbl: UILabel) {
        switch combination {
        case .pairHummers:
            KeychainService.standard.me?.energy! += 5
            resultLbl.text = "+4⚡️"
            
        case .setHummers:
            // бесплатный апгрейд элемента ландшафта
            resultLbl.text = "upgrade"
            AudioManager.sharedManager.playSound(type: .superWin_19)
            // напиши тут алерт вы выиграли апгрейд элемента ландшафта с выбором элемента исходя из всех ему доступных
        case .pairDollars:
            KeychainService.standard.me?.coins! += 1000
            resultLbl.text = "+1000💵"
            AudioManager.sharedManager.playSound(type: .coinsX2_13)
        case .setDollars:
            KeychainService.standard.me?.coins! += 4000
            resultLbl.text = "+4000💵"
            AudioManager.sharedManager.playSound(type: .coinsX3_14)
        case .pairSnowflakes:
            KeychainService.standard.me?.energy! += 5
            resultLbl.text = "+4⚡️"
        case .setSnowflakes:
            KeychainService.standard.me?.energy! += 21
            KeychainService.standard.me?.coins! += 4000
            resultLbl.text = "21⚡️\n+4000💵"
        case .pairMoneyBags:
            KeychainService.standard.me?.coins! += 3000
            resultLbl.text = "+3000💵"
            AudioManager.sharedManager.playSound(type: .coinsPackX2_15)
        case .setMoneyBags:
            KeychainService.standard.me?.coins! += 10000
            resultLbl.text = "+10000💵"
            AudioManager.sharedManager.playSound(type: .coinsPackX3_16)
        case .pairLightning:
            KeychainService.standard.me?.energy! += 4 // 3
            resultLbl.text = "+3⚡️"
            AudioManager.sharedManager.playSound(type: .energyX2_17)
        case .setLightning:
            KeychainService.standard.me?.energy! += 13 // 12
            resultLbl.text = "+12⚡️"
            AudioManager.sharedManager.playSound(type: .energyX3_18)
        }
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
    
func recognizeSetCombinations(_ resultIndices: [Int]) -> (SpinCombination, Set<Int>)? {
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
    
    func paintBlueBorder(_ set: Set<Int>,
                         indexPathes: [Int],
                         collectionView: UICollectionView) {
        for int in set {
            let table = ( collectionView.cellForItem(at: [0,int]) as! SlotCollectionCell).tableView
            let cell = (table.cellForRow(at: [0, indexPathes[int]]) as! SlotTableViewCell)
            cell.borderView.isHidden = false
        }
    }
}

enum SpinCombination {
    case pairHummers, setHummers
    case pairDollars, setDollars
    case pairSnowflakes, setSnowflakes
    case pairMoneyBags, setMoneyBags
    case pairLightning, setLightning
}



