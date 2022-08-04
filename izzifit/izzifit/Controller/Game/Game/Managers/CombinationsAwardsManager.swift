//
//  GameLogicManager.swift
//  izzifit
//
//  Created by O l e h on 07.04.2022.
//

import Foundation
import UIKit

struct CombinationsAwardsManager {
    
    var user: MeMainModel {
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
                    resultLbl: UILabel,
                    collectionView: UICollectionView,
                    spinBtn: UIButton,
                    runTimer: () -> ()) {
        
        resultLbl.text = ". . ."
        KeychainService.standard.me?.energy! -= 1
        // реши вопрос с обновлением энергии и вообще обновлением сущности
        
        energyLbl.text = String(Int(user.energy!))
        spinBtn.isUserInteractionEnabled = false
        //  spinBtn.isSelected.toggle()
        for item in collectionView.visibleCells.indices {
            let table = ( collectionView.cellForItem(at: [0,item]) as! SlotCollectionCell).tableView
            for i in  0...2 {
                let cell = (table.visibleCells[i] as! SlotTableViewCell)
                cell.slotBtn.isSelected = false
                table.reloadData()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            AudioManager.sharedManager.playSound(type: .spinnerMain_11)
        }
        
        runTimer()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.3) {
            spinBtn.isUserInteractionEnabled = true
            coinsLbl.text = String(user.coins!)
            energyLbl.text = String(Int(user.energy!))
        }
    }
    
    func showProgress(imgVw: UIImageView, img: UIImage ) {
        
        var spinsRemainder = CGFloat(KeychainService.standard.me?.energy ?? 0.0)
        switch spinsRemainder {
        case let x where x > 100.0: spinsRemainder = 100.0
        default: break
        }
        let hiddenPart = 100.0 - spinsRemainder
        imgVw.hideImage(hiddenPart: hiddenPart,
                        img: img)
    }
    
    func bagOrCoin(_  array: [Int]) -> Int? {
        if array.contains(2) { return 2 }
        if array.contains(1) { return 1 }
        return nil
    }
    
    func coinBag(in array: [Int],
                 hiddenStack: UIStackView,
                 awardImgVw: UIImageView,
                 awardTitleLbl: UILabel,
                 awardCountLbl: UILabel,
                 coinsAmount: Int,
                 animateCoins: ((CGFloat) -> Void) ) {
        guard let number = bagOrCoin(array) else { return }
        awardTitleLbl.text = "COINS"
        awardCountLbl.text = "\(coinsAmount)"
        hiddenStack.isHidden.toggle()
        // remove dummy when back is ready
        if let urls = GameNetworkLayer.shared.slotURLs {
            switch urls.count {
            case 5:
                switch number {
                case 2:     awardImgVw.kf.setImage(with: urls[1])
                            animateCoins(0.3)
                default:    awardImgVw.kf.setImage(with: urls[0])
                            animateCoins(1.0)
                }
            default:
                switch number {
                case 2:     awardImgVw.image = FR_SlotImgs.moneyBag
                            animateCoins(0.3)
                default:    awardImgVw.image = FR_SlotImgs.pound
                            animateCoins(1.0)
                }
            }
        }
    }
    
    func accrueBonuses(by combination: SpinCombination,
                       homeView: GameAnimationProtocol,
                       barBackVw: GameBarBackView,
                       hiddenStack: UIStackView,
                       awardImgVw: UIImageView,
                       awardTitleLbl: UILabel,
                       awardCountLbl: UILabel,
                       coinsAmount: Int,
                       spinsAmount: Int,
                       _ threeHummers: () -> Void) {
        AnalyticsHelper.sendFirebaseEvents(events: .spin_reward, params: ["award" : combination.rawValue])
        hiddenStack.isHidden.toggle()
        if let urls = GameNetworkLayer.shared.slotURLs {
            switch urls.count {
            case 5:
                switch combination {
                case .pairHummers:
                    awardImgVw.kf.setImage(with: urls[4])
                    awardTitleLbl.text = "SPINS"
                    awardCountLbl.text = "\(spinsAmount)"
                    barBackVw.energyAnimationView?.play()
                case .setHummers:
                    awardImgVw.kf.setImage(with: urls[4])
                    awardTitleLbl.text = "BUILD"
                    awardCountLbl.text = "1"
                    AudioManager.sharedManager.playSound(type: .superWin_19)
                    threeHummers()
                    homeView.animate(type: .hammer3, imageView: homeView.animationImgVw)
                case .pairDollars:
                    awardImgVw.kf.setImage(with: urls[0])
                    awardTitleLbl.text = "COINS"
                    awardCountLbl.text = "\(coinsAmount)"
                    AudioManager.sharedManager.playSound(type: .coinsX2_13)
                    homeView.animate(type: .coin2, imageView: homeView.animationImgVw)
                case .setDollars:
                    awardImgVw.kf.setImage(with: urls[0])
                    awardTitleLbl.text = "COINS"
                    awardCountLbl.text = "\(coinsAmount)"
                    AudioManager.sharedManager.playSound(type: .coinsX3_14)
                    homeView.animate(type: .coin3, imageView: homeView.animationImgVw)
                case .pairSnowflakes:
                    awardImgVw.kf.setImage(with: urls[3])
                    awardTitleLbl.text = "SPINS"
                    awardCountLbl.text = "\(spinsAmount)"
                    homeView.animate(type: .snowflake, imageView: homeView.animationImgVw)
                    barBackVw.energyAnimationView?.play()
                case .setSnowflakes:
                    awardImgVw.kf.setImage(with: urls[3])
                    awardTitleLbl.text = "SPINS"
                    awardCountLbl.text = "\(spinsAmount)"
                    barBackVw.energyAnimationView?.play()
                    homeView.animate(type: .snowflake, imageView: homeView.animationImgVw)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                        awardTitleLbl.text = "COINS"
                        awardCountLbl.text = "\(coinsAmount)"
                    }
                case .pairMoneyBags:
                    awardImgVw.kf.setImage(with: urls[1])
                    awardTitleLbl.text = "COINS"
                    awardCountLbl.text = "\(coinsAmount)"
                    AudioManager.sharedManager.playSound(type: .coinsPackX2_15)
                    homeView.animate(type: .coin2, imageView: homeView.animationImgVw)
                case .setMoneyBags:
                    awardImgVw.kf.setImage(with: urls[1])
                    awardTitleLbl.text = "COINS"
                    awardCountLbl.text = "\(coinsAmount)"
                    homeView.animate(type: .coin3, imageView: homeView.animationImgVw)
                    AudioManager.sharedManager.playSound(type: .coinsPackX3_16)
                case .pairLightning:
                    awardImgVw.kf.setImage(with: urls[2])
                    awardTitleLbl.text = "SPINS"
                    barBackVw.energyAnimationView?.play()
                    awardCountLbl.text = "\(spinsAmount)"
                    homeView.animate(type: .lightning, imageView: homeView.animationImgVw)
                    AudioManager.sharedManager.playSound(type: .energyX2_17)
                case .setLightning:
                    awardImgVw.kf.setImage(with: urls[2])
                    awardTitleLbl.text = "SPINS"
                    barBackVw.energyAnimationView?.play()
                    awardCountLbl.text = "\(spinsAmount)"
                    homeView.animate(type: .lightning, imageView: homeView.animationImgVw)
                    AudioManager.sharedManager.playSound(type: .energyX3_18)
                }
            default:
                switch combination {
            case .pairHummers:
                awardImgVw.image = FR_SlotImgs.hammer
                awardTitleLbl.text = "SPINS"
                awardCountLbl.text = "\(spinsAmount)"
                barBackVw.energyAnimationView?.play()
            case .setHummers:
                awardImgVw.image = FR_SlotImgs.hammer
                awardTitleLbl.text = "BUILD"
                awardCountLbl.text = "1"
                AudioManager.sharedManager.playSound(type: .superWin_19)
                threeHummers()
                homeView.animate(type: .hammer3, imageView: homeView.animationImgVw)
            case .pairDollars:
                awardImgVw.image = FR_SlotImgs.pound
                awardTitleLbl.text = "COINS"
                awardCountLbl.text = "\(coinsAmount)"
                AudioManager.sharedManager.playSound(type: .coinsX2_13)
                homeView.animate(type: .coin2, imageView: homeView.animationImgVw)
            case .setDollars:
                awardImgVw.image = FR_SlotImgs.pound
                awardTitleLbl.text = "COINS"
                awardCountLbl.text = "\(coinsAmount)"
                AudioManager.sharedManager.playSound(type: .coinsX3_14)
                homeView.animate(type: .coin3, imageView: homeView.animationImgVw)
            case .pairSnowflakes:
                awardImgVw.image = FR_SlotImgs.flag
                awardTitleLbl.text = "SPINS"
                awardCountLbl.text = "\(spinsAmount)"
                homeView.animate(type: .snowflake, imageView: homeView.animationImgVw)
                barBackVw.energyAnimationView?.play()
            case .setSnowflakes:
                awardImgVw.image = FR_SlotImgs.flag
                awardTitleLbl.text = "SPINS"
                awardCountLbl.text = "\(spinsAmount)"
                barBackVw.energyAnimationView?.play()
                homeView.animate(type: .snowflake, imageView: homeView.animationImgVw)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                    awardTitleLbl.text = "COINS"
                    awardCountLbl.text = "\(coinsAmount)"
                }
            case .pairMoneyBags:
                awardImgVw.image = FR_SlotImgs.moneyBag
                awardTitleLbl.text = "COINS"
                awardCountLbl.text = "\(coinsAmount)"
                AudioManager.sharedManager.playSound(type: .coinsPackX2_15)
                homeView.animate(type: .coin2, imageView: homeView.animationImgVw)
            case .setMoneyBags:
                awardImgVw.image = FR_SlotImgs.moneyBag
                awardTitleLbl.text = "COINS"
                awardCountLbl.text = "\(coinsAmount)"
                homeView.animate(type: .coin3, imageView: homeView.animationImgVw)
                AudioManager.sharedManager.playSound(type: .coinsPackX3_16)
            case .pairLightning:
                awardImgVw.image = FR_SlotImgs.lightning
                awardTitleLbl.text = "SPINS"
                barBackVw.energyAnimationView?.play()
                awardCountLbl.text = "\(spinsAmount)"
                homeView.animate(type: .lightning, imageView: homeView.animationImgVw)
                AudioManager.sharedManager.playSound(type: .energyX2_17)
            case .setLightning:
                awardImgVw.image = FR_SlotImgs.lightning
                awardTitleLbl.text = "SPINS"
                barBackVw.energyAnimationView?.play()
                awardCountLbl.text = "\(spinsAmount)"
                homeView.animate(type: .lightning, imageView: homeView.animationImgVw)
                AudioManager.sharedManager.playSound(type: .energyX3_18)
            }
            }
        }
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
                case 1: combination = .pairDollars
                case 2: combination = .pairMoneyBags
                case 3: combination = .pairLightning
                case 4: combination = .pairSnowflakes
                case 5: combination = .pairHummers
                default: break
                }
            }
        }
        
        switch count {
        case 1:   return (combination, res)
        default: if array.first == array.last {
            switch array.first {
            case 1: combination = .pairDollars
            case 2: combination = .pairMoneyBags
            case 3: combination = .pairLightning
            case 4: combination = .pairSnowflakes
            case 5: combination = .pairHummers
            default: break
            }
            return (combination, res)
        }
        }
        return nil
    }
    
    
    func recognizeSetCombinations(_ resultIndices: [Int]) -> (SpinCombination, Set<Int>)? {
        
        switch resultIndices {
        case [1,1,1]: return (.setDollars,      [0,1,2])
        case [2,2,2]: return (.setMoneyBags,    [0,1,2])
        case [3,3,3]: return (.setLightning,    [0,1,2])
        case [4,4,4]: return (.setSnowflakes,   [0,1,2])
        case [5,5,5]: return (.setHummers,      [0,1,2])
        default: break
        }
        
        guard let pairResultTuple = matchedIndicesAndCombination(of: resultIndices) else { return nil }
        return pairResultTuple
    }
}

enum SpinCombination: String {
    case pairHummers, setHummers
    case pairDollars, setDollars
    case pairSnowflakes, setSnowflakes
    case pairMoneyBags, setMoneyBags
    case pairLightning, setLightning
}



