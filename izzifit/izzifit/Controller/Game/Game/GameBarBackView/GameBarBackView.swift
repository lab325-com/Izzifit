//
//  GameBarBackView.swift
//  izzifit
//
//  Created by O l e h on 17.05.2022.

import UIKit
import Lottie

class GameBarBackView: UIView {

    var mainImgVw =   UIImageView()
    var avatarImgVw = UIImageView()
    var nameLbl =     UILabel()
    
    var coinsImgVw =    UIImageView()
    var coinsLbl =      UILabel()
    var energyImgVw =   UIImageView()
    var energyCountLbl = UILabel()

    private var coinsDisplayEntity =  DisplayLinkEntity()
    private var energyDisplayEntity = DisplayLinkEntity()
    
    var prevCoins  = 0
    var prevEnergy = 0
 
    private var coinsAnimationView:   AnimationView?
    var energyAnimationView:          AnimationView?
    
    init(backImage: UIImage) {
        super.init(frame: .zero)
//        mainImgVw.image = backImage
//        mainImgVw.contentMode = .scaleAspectFill
          backgroundColor = .clear
          let blurEffect = UIBlurEffect(style: .light)
          let blurEffectView = UIVisualEffectView(effect: blurEffect)
          blurEffectView.alpha = 0.666
        
          blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        ui.genericlLayout(object: blurEffectView,
                          parentView: self,
                          topC: 0,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        blurEffectView.clipsToBounds = true
        blurEffectView.layer.cornerRadius = hRatio(cH: 28)
        blurEffectView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        layout()
        getCoinsAndEnergy()
    }
    
    @objc func handleUpdateCoins() {
    
        guard let startDate = coinsDisplayEntity.counterStartDate else { return }
        
        let elapsedTime = Date().timeIntervalSince(startDate)
        
        guard elapsedTime < coinsDisplayEntity.counterDuration else {
            coinsDisplayEntity.restartEntity()
            coinsLbl.text = "\(coinsDisplayEntity.counterEndValue)"
            return
        }
        
        let percentage = elapsedTime / coinsDisplayEntity.counterDuration
        let value = Double(coinsDisplayEntity.counterStartValue) + Double(percentage) * Double(coinsDisplayEntity.counterEndValue - coinsDisplayEntity.counterStartValue)
        coinsLbl.text = "\(Int(value.rounded()))"
    }
    
    @objc func handleUpdateEnergy() {
        guard let startDate = energyDisplayEntity.counterStartDate else { return }
        
        let elapsedTime = Date().timeIntervalSince(startDate)
        
        guard elapsedTime < energyDisplayEntity.counterDuration else {
            energyDisplayEntity.restartEntity()
            energyCountLbl.text = "\(energyDisplayEntity.counterEndValue)"
            return
        }
        
        let percentage = elapsedTime / energyDisplayEntity.counterDuration
        let value = Double(energyDisplayEntity.counterStartValue) + Double(percentage) * Double(energyDisplayEntity.counterEndValue - energyDisplayEntity.counterStartValue)
        energyCountLbl.text = "\(Int(value.rounded()))"
    }
    
    func runNumbers(isCoins: Bool, duration: TimeInterval, startValue: Int, endValue: Int) {
        switch isCoins {
        case true:  coinsDisplayEntity.restartEntity()
                    let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdateCoins))
                    displayLink.add(to: .main, forMode: .default)
                    coinsDisplayEntity.counterDuration =    duration
                    coinsDisplayEntity.counterStartValue =  startValue
                    coinsDisplayEntity.counterEndValue =    endValue
                    coinsDisplayEntity.counterDisplayLink = displayLink
                    coinsDisplayEntity.counterStartDate =   Date()
        case false: energyDisplayEntity.restartEntity()
            let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdateEnergy))
            displayLink.add(to: .main, forMode: .default)
            energyDisplayEntity.counterDuration =    duration
            energyDisplayEntity.counterStartValue =  startValue
            energyDisplayEntity.counterEndValue =    endValue
            energyDisplayEntity.counterDisplayLink = displayLink
            energyDisplayEntity.counterStartDate =   Date()
        }
    }
    
    func animateCoins(speed: CGFloat) {
        if speed < 1.0 && speed > 0.0 {
            coinsAnimationView!.animationSpeed = speed
        } else {
            coinsAnimationView!.animationSpeed = 1.0
        }
        coinsAnimationView?.play()
    }

    func getCoinsAndEnergy() {
        coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
        if let name = KeychainService.standard.me?.name { nameLbl.text = name }
        else { nameLbl.isHidden = true }
        avatarImgVw.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""),
                                          placeholder: RImage.placeholder_food_ic(),
                                          options: [.transition(.fade(0.25))])
    }

    func layout() {
        
        ui.genericlLayout(object: mainImgVw,
                          parentView: self,
                          topC: 0,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.genericlLayout(object: avatarImgVw,
                          parentView: mainImgVw,
                          width: h / 20.3,
                          height: h / 20.3,
                          bottomC: h / 101.5,
                          leadingC: w / 19.73)
        
        avatarImgVw.layer.cornerRadius = (h/20.3)/2
        avatarImgVw.layer.masksToBounds = true
        
        ui.setLabel(label: nameLbl,
                    textColor: .white,
                    textAlignment: .left,
                    fontSize: 20,
                    fontWeight: .medium)
        
        ui.genericlLayout(object: nameLbl,
                          parentView: mainImgVw,
                          centerVtoO: avatarImgVw.centerYAnchor,
                          leadingToO: avatarImgVw.trailingAnchor,
                          leadingCG: 8)
        
//        ui.setLabel(label: energyCountLbl,
//                    textColor: .white,
//                    textAlignment: .right,
//                    fontSize: 16,
//                    fontWeight: .medium)
        
//        ui.setLabel(label: coinsLbl,
//                    textColor: .white,
//                    textAlignment: .right,
//                    fontSize: 16,
//                    fontWeight: .medium)
        
        energyCountLbl.textColor =      .white
        energyCountLbl.textAlignment =  .right
        energyCountLbl.font =           UIFont.monospacedDigitSystemFont(ofSize: 16,
                                                                         weight: .medium)
        
        coinsLbl.textColor =      .white
        coinsLbl.textAlignment =  .right
        coinsLbl.font =           UIFont.monospacedDigitSystemFont(ofSize: 16,
                                                                   weight: .medium)
        
        coinsImgVw.image = UIImage(named: "top_view_coin_ic")
        energyImgVw.image = UIImage(named: "top_view_flash_ic")
         
        ui.genericlLayout(object: energyCountLbl,
                          parentView: mainImgVw,
                          trailingC: 17,
                          centerVtoO: avatarImgVw.centerYAnchor)
        
        ui.genericlLayout(object: energyImgVw,
                          parentView: mainImgVw,
                          width: 22,
                          height: 22,
                          centerVtoO: avatarImgVw.centerYAnchor,
                          trailingToO: energyCountLbl.leadingAnchor,
                          trailingCG: 2)
        
        ui.genericlLayout(object: coinsLbl,
                          parentView: mainImgVw,
                          centerVtoO: avatarImgVw.centerYAnchor,
                          trailingToO: energyImgVw.leadingAnchor,
                          trailingCG: 10)
        
        ui.genericlLayout(object: coinsImgVw,
                          parentView: mainImgVw,
                          width: 22,
                          height: 22,
                          centerVtoO: avatarImgVw.centerYAnchor,
                          trailingToO: coinsLbl.leadingAnchor,
                          trailingCG: 2)
        
        coinsAnimationView =     .init(name: "coins_header")
        coinsAnimationView!.contentMode = .scaleAspectFill
        coinsAnimationView!.loopMode = .playOnce
        
        ui.genericlLayout(object: coinsAnimationView!,
                          parentView: coinsImgVw,
                          width: 30,
                          height: 100,
                          topC: 22,
                          centerH: 0)
        
        energyAnimationView =  .init(name: "energy_anim")
        energyAnimationView!.contentMode = .scaleAspectFill
        energyAnimationView!.loopMode = .playOnce
        
        ui.genericlLayout(object: energyAnimationView!,
                          parentView: energyImgVw,
                          width: 30,
                          height: 100,
                          topC: 22,
                          centerH: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
