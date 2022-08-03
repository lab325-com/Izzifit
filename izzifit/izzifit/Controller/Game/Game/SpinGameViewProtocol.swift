//
//  SpinGameViewProtocol.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import Foundation
import UIKit

protocol SpinGameViewProtocol: UIView, GameAnimationProtocol {
    var hummerBtn: UIButton { get set }
    var hummerCountLbl: UILabel { get set }
    var startSpinLbl: UILabel { get set }
    var spinBtn: UIButton { get set }
    var slotBackImgVw: UIImageView { get set}
    var resultStackView: UIStackView! {get set}
    var barBackVw: GameBarBackView {get set}
    var progressImgVw: UIImageView { get set }
    var greenCounterLbl: UILabel {get set}
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
                                              img: progressImg ?? UIImage())
        case false:
            var onBoardingValues = [CGFloat]()
            switch ArcticGameView.counter {
            case 0:
                ArcticGameView.currentEnergy = CGFloat(KeychainService.standard.me?.energy ?? 0)
                progressImgVw.hideImage(hiddenPart: hiddenPart,
                                           img: progressImg ?? UIImage())
                let energy = ArcticGameView.currentEnergy
               onBoardingValues = [ energy * 0.75 ,
                                     energy * 0.5 ,
                                     energy * 0.25,
                                     0]
                ArcticGameView.counter += 1
            default:
                let part = 100.0 - onBoardingValues[ArcticGameView.counter - 2]
                progressImgVw.hideImage(hiddenPart: part,
                                           img: progressImg ?? UIImage())
            }
           
        }
    }
    
    func updateHeader() {
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
    }
    
    func checkAvailableHummers() {
        hummerBtn.isUserInteractionEnabled = false
        switch GameNetworkLayer.shared.hummersCount {
        case 0:
            hummerBtn.isHidden =      true
            hummerCountLbl.isHidden = true
        default:
            hummerBtn.isHidden =      false
            hummerCountLbl.isHidden = false
            hummerCountLbl.text = "x\(GameNetworkLayer.shared.hummersCount)"
        }
    }
}

