//
//  GameBarBackView.swift
//  izzifit
//
//  Created by O l e h on 17.05.2022.

import UIKit
import Lottie

class GameBarBackView: UIView {

    var mainImgVw = UIImageView()
    var avatarImgVw = UIImageView()
    var nameLbl = UILabel()
    
    var coinsImgVw = UIImageView()
    var coinsLbl = UILabel()
    var energyImgVw = UIImageView()
    var energyCountLbl = UILabel()
    
    private var coinsAnimationView:      AnimationView?
    
    init(backImage: UIImage) {
        super.init(frame: .zero)
        mainImgVw.image = backImage
        mainImgVw.contentMode = .scaleAspectFill
        layout()
        getCoinsAndEnergy()
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
        
        ui.setLabel(label: energyCountLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: 16,
                    fontWeight: .medium)
        
        ui.setLabel(label: coinsLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: 16,
                    fontWeight: .medium)
        
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
                          topC: 0,
                          centerH: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
