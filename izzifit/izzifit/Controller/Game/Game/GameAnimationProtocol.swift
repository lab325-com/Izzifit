//
//  GameAnimationProtocol.swift
//  izzifit
//
//  Created by O l e h on 17.06.2022.
//

import UIKit
import SwiftyGif
import Lottie

protocol GameAnimationProtocol {
    var animationImgVw: UIImageView { get set }
    func animate(type: GameAnimation, imageView: UIImageView)
}

extension GameAnimationProtocol {
    
    func animate(type: GameAnimation, imageView: UIImageView) {
        switch type {
        case .coin2:        imageView.prepareAnimation(name: "coin_v2", loopRepeated: false)
        case .coin3:        imageView.prepareAnimation(name: "coin_v3", loopRepeated: false)
        case .hammer3:      if let mapName = PreferencesManager.sharedManager.currentMapName {
                            switch mapName {
                            case .snow_map:     rotateSun(with: SlotImgs.hammer ?? UIImage(), on: imageView, hummerAnimation: true)
                            case .england_map:  rotateSun(with: UK_SlotImgs.hammer ?? UIImage(), on: imageView, hummerAnimation: true)
                            }
                        }
        case .lightning:    if let mapName = PreferencesManager.sharedManager.currentMapName {
                            switch mapName {
                            case .snow_map:     rotateSun(with: SlotImgs.lightning ?? UIImage(), on: imageView)
                            case .england_map:  rotateSun(with: UK_SlotImgs.lightning ?? UIImage(), on: imageView)
                            }
                        }
        case .snowflake:    if let mapName = PreferencesManager.sharedManager.currentMapName {
                            switch mapName {
                            case .snow_map:     rotateSun(with: SlotImgs.snowflake ?? UIImage(), on: imageView)
                            case .england_map:  rotateSun(with: UK_SlotImgs.flag ?? UIImage(), on: imageView)
                            }
                }
        }
    }
    
    
    func rotateSun(with slotImg: UIImage, on imgVw: UIImageView, hummerAnimation: Bool? = nil) {
        if let img = UIImage(named: "sunIsShineAnimation") {
            let backVw = UIView()
            backVw.layer.backgroundColor = UIColor(rgb: 0x3F3E56,alpha: 0.3).cgColor
            let rotateImgView = UIImageView(image: img)
            
            imgVw.ui.genericlLayout(object: backVw,
                                    parentView: imgVw,
                                    topC: 0,
                                    bottomC: 0,
                                    leadingC: 0,
                                    trailingC: 0)
            
            imgVw.ui.genericlLayout(object: rotateImgView,
                                    parentView: imgVw,
                                    topC: 0,
                                    bottomC: 0,
                                    leadingC: 0,
                                    trailingC: 0)
            
            // Rotate sun
            UIView.animate(withDuration: 1.5) { rotateImgView.transform = rotateImgView.transform.rotated(by: CGFloat(Double.pi))}
                           completion: { arg in
                               UIView.animate(withDuration: 0.5,
                                              delay: 1.0,
                                              options: .curveEaseOut,
                                              animations: { rotateImgView.alpha = 0.0 },
                                              completion: { _ in rotateImgView.removeFromSuperview() })
            }
            
            switch hummerAnimation {
            case .none:
                let slotImgVw = UIImageView(image: slotImg)
                
                imgVw.ui.genericlLayout(object: slotImgVw,
                                        parentView: imgVw,
                                        width: imgVw.h/11.4,
                                        height: imgVw.h/11.4,
                                        centerV: 0,
                                        centerH: 0)
                slotImgVw.alpha = 0.0
                // Scale/ Fade Img
                UIView.animate(withDuration: 1.4,
                               delay: 0.1,
                               options: .curveEaseIn,
                               animations: {    slotImgVw.alpha = 1.0
                                                slotImgVw.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)  },
                               completion: { completed in
                                    UIView.animate(withDuration: 0.5,
                                                    delay: 1.0,
                                                    options: .curveEaseOut) {   slotImgVw.alpha = 0
                                                                                slotImgVw.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)}
                                                    completion: { animated in
                                                                    slotImgVw.removeFromSuperview()
                                                                    backVw.removeFromSuperview()
                                                            }
                                                        })
            case .some(_):
                let slotImgVw = UIImageView(image: slotImg)
                imgVw.ui.genericlLayout(object: slotImgVw,
                                        parentView: imgVw,
                                        width: imgVw.h/11.4,
                                        height: imgVw.h/11.4,
                                        centerV: 0,
                                        centerH: 0)
                slotImgVw.alpha = 0.0
                
                // Move/Scale/Fade Img
                UIView.animate(withDuration: 1.0, delay: 0.1, options: .curveEaseIn, animations: {
                    slotImgVw.alpha = 1.0
                    slotImgVw.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                    slotImgVw.center.x = imgVw.center.x
                    slotImgVw.center.y = imgVw.center.y
                }, completion: { completed in
                    UIView.animate(withDuration: 0.9, delay: 1.0, options: .curveEaseOut) {
                        slotImgVw.alpha = 0
                        slotImgVw.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        slotImgVw.center.x = 0
                        slotImgVw.center.y = 0
                    } completion: { animated in
                        slotImgVw.removeFromSuperview()
                        backVw.removeFromSuperview()
                    }
                })
            }
        }
    }
}
