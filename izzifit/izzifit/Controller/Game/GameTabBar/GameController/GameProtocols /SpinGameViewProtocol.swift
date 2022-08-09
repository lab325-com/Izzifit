//
//  SpinGameViewProtocol.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import Foundation
import UIKit

protocol SpinGameViewProtocol: UIView, GameAnimationProtocol {
    var hummerBtn: UIButton             {get set}
    var hummerCountLbl: UILabel         {get set}
    var startSpinLbl: UILabel           {get set}
    var spinBtn: UIButton               {get set}
    var slotBackImgVw: UIImageView      {get set}
    var resultStackView: UIStackView!   {get set}
    var barBackVw: GameBarBackView      {get set}
    var progressImgVw: UIImageView      {get set}
    var greenCounterLbl: UILabel        {get set}
    var awardImgVw: UIImageView         {get set}
    var awardTitleLbl: UILabel          {get set}
    var awardCountLbl: UILabel          {get set}
    func showProgress() -> ()
    func updateHeader() -> ()
}

extension SpinGameViewProtocol {
    var progressImg: UIImage {
        get { UIImage(named: "progressActive") ?? UIImage() }
    }
    
    func showProgress() {
        greenCounterLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))/50"
        var spinsRemainder = CGFloat(KeychainService.standard.me?.energy ?? 0.0)
        switch spinsRemainder {
        case let x where x > 100.0: spinsRemainder = 100.0
        default: break
        }
        let hiddenPart = 100.0 - spinsRemainder
     
        print("usd")
        
        switch PreferencesManager.sharedManager.gameOnboardingDone {
        case true:    progressImgVw.hideImage(hiddenPart: hiddenPart,
                                              img: progressImg )
        case false:
            var onBoardingValues = [CGFloat]()
            let energy = CGFloat(KeychainService.standard.me?.energy ?? 0.0)
            onBoardingValues = [ energy * 0.75 ,
                                 energy * 0.5 ,
                                 energy * 0.25,
                                 0]
       
            switch ArcticGameView.counter {
            case 0:  progressImgVw.hideImage(hiddenPart: hiddenPart,
                                             img: progressImg )
            default:
                let part = 100.0 - onBoardingValues[ArcticGameView.counter - 1]
                // mistake is here
                progressImgVw.hideImage(hiddenPart: part,
                                           img: progressImg )
            }
        }
    }
    
    func updateHeader() {
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
    }
    
    func checkAvailableHummers() {
        hummerBtn.isUserInteractionEnabled = false
        if let hummers = GameNetworkLayer.shared.hummersCount{
        switch hummers {
        case 0:
            hummerBtn.isHidden =      true
            hummerCountLbl.isHidden = true
        default:
            hummerBtn.isHidden =      false
            hummerCountLbl.isHidden = false
            hummerCountLbl.text = "x\(hummers)"
        }
      }
    }
    
    func showAwards(model: [SpinMainModel]) -> (coinsAward: Int, spinsAward: Int) {
        var coinsAmount = Int()
        var spinsAmount = Int()
        for award in model {
            switch award.type {
            case .spinObjectRewardTypeCoin:
                let expense = KeychainService.standard.me?.coins ?? 0
                     DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                         self.barBackVw.runNumbers(isCoins: true,
                                                       duration: 3,
                                                       startValue:  expense,
                                                       endValue:  expense + award.amount)
                     }
                KeychainService.standard.me?.coins! += award.amount
                coinsAmount = award.amount
                
            case .spinObjectRewardTypeEnergy:
                let energy = KeychainService.standard.me?.energy ?? 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.barBackVw.runNumbers(isCoins: false,
                                                      duration: 3,
                                                      startValue:  Int(energy),
                                                      endValue:  Int(energy) + award.amount)
                }
                KeychainService.standard.me?.energy! += Float(award.amount)
                spinsAmount = award.amount
                
            case .spinObjectRewardTypeBuild: print("")
            case .__unknown(_):  print("")
            }
        }
        startSpinLbl.text = ""
        return (coinsAmount,spinsAmount)
    }
    
    func threeHummersCombination() {
       if var count = GameNetworkLayer.shared.hummersCount {
        count += 1
        GameNetworkLayer.shared.hummersCount = count
       }
        if let hummers = GameNetworkLayer.shared.hummersCount {
            hummerCountLbl.text = "x\(hummers)"
        }
       hummerBtn.isHidden =      false
       hummerCountLbl.isHidden = false
    }
}

