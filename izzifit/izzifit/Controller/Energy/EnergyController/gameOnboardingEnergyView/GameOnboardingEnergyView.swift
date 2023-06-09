//
//  gameOnboardingEnergyView.swift
//  izzifit
//
//  Created by mob325 on 08.07.2022.
//

import UIKit
import Lottie

enum OnboardingGameState {
    case energy, game
}

class GameOnboardingEnergyView: UIView {
    
    var state: OnboardingGameState
    
    var mainLbl = UILabel()
    var mainImgVw = UIImageView()
    var yellowBtn = UIButton()
    
    init(state: OnboardingGameState) {
        self.state = state
        super.init(frame: .zero)
        setAndLayout()
    }
    
    func setAndLayout() {
        
        yellowBtn.layer.backgroundColor = UIColor(rgb: 0xFFF2D2).cgColor
        yellowBtn.layer.cornerRadius = 20
        yellowBtn.layer.masksToBounds = true
        
        yellowBtn.addTarget(self, action: #selector(actionYellow), for: .touchUpInside)
        
        ui.genericlLayout(object: yellowBtn,
                          parentView: self,
                          width: wRatio(cW:344),
                          height: 64,
                          bottomC: 0,
                          centerH: 0)
                          
        mainImgVw.contentMode = .scaleAspectFill
        
        ui.setLabel(label: mainLbl,
                    textColor: UIColor(rgb: 0x3F3E56),
                    textAlignment: .left,
                    fontSize: wRatio(cW: 14),
                    fontName: "Inter-Regular",
                    lines: 0)

        switch state {
        case .energy:   mainImgVw.image = image(img: .onboardingLightning)  ?? UIImage()
            
            let anim = AnimationView(name: "spark_anim")
            anim.contentMode = .scaleAspectFill
            anim.loopMode = .loop
            
            ui.genericlLayout(object: anim,
                              parentView: yellowBtn,
                              width: 100,
                              height: 100,
                              trailingC: -10,
                              centerV: 0)
            
            ui.genericlLayout(object: mainImgVw,
                              parentView: self,
                              width: 31,
                              height: 51,
                              bottomToO: yellowBtn.bottomAnchor,
                              bottomCG: 6,
                              trailingToO: yellowBtn.trailingAnchor,
                              trailingCG: 20)
            anim.play()
            
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = image(img: .onboardingEnergy)
            let imageOffsetY: CGFloat = -2.5
            imageAttachment.bounds = CGRect(x: 0,
                                            y: imageOffsetY,
                                            width: imageAttachment.image!.size.width ,
                                            height: imageAttachment.image!.size.height )
            
            let imageAt2 = NSTextAttachment()
            imageAt2.image = image(img: .onboardingRightSign)
            imageAt2.bounds = CGRect(x: 0,
                                     y: -1.5,
                                     width: imageAt2.image!.size.width ,
                                     height: imageAt2.image!.size.height)
            let imageAt = NSAttributedString(attachment: imageAttachment)
            let completeText = NSMutableAttributedString(string: "Get energy ")
            completeText.append(imageAt)
            let textAfterIcon = NSAttributedString(string: " from tracking ")
            completeText.append(textAfterIcon)
            
            let imageAtStr2 = NSAttributedString(attachment: imageAt2)
            completeText.append(imageAtStr2)
            
            let lastText = NSAttributedString(string: " your \nmeals, water, activities ")
            completeText.append(lastText)
            mainLbl.attributedText = completeText
            
        case .game:
            
            let anim = AnimationView(name: "smoke_anim")
            anim.contentMode = .scaleAspectFit
            anim.loopMode = .loop
            
            ui.genericlLayout(object: anim,
                              parentView: self,
                              width: 60,
                              height: 60,
                              bottomC: 27,
                              trailingC: 1)
            
            mainImgVw.image = image(img: .onboardingVillage)  ?? UIImage()
            ui.genericlLayout(object: mainImgVw,
                              parentView: self,
                              width: 77,
                              height: 62,
                              topToO: yellowBtn.topAnchor,
                              topCG: -7,
                              trailingToO: yellowBtn.trailingAnchor,
                              trailingCG: wRatio(cW: 9))
            anim.play()
            
            
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = image(img: .onboardingEnergy)
            let imageOffsetY: CGFloat = -2.5
            imageAttachment.bounds = CGRect(x: 0,
                                            y: imageOffsetY,
                                            width: imageAttachment.image!.size.width ,
                                            height: imageAttachment.image!.size.height )
            
            let imageAt2 = NSTextAttachment()
            imageAt2.image = image(img: .onboardingFun)
            imageAt2.bounds = CGRect(x: 0,
                                     y: -6.5,
                                     width: imageAt2.image!.size.width ,
                                     height: imageAt2.image!.size.height )
            let attachmentString = NSAttributedString(attachment: imageAttachment)
            let completeText = NSMutableAttributedString(string: "You have enough  ")
            completeText.append(attachmentString)
            let textAfterIcon = NSAttributedString(string: "  energy for fun! \nBuild your new world! Tap  ")
            completeText.append(textAfterIcon)
            
            let attString2 = NSAttributedString(attachment: imageAt2)
            completeText.append(attString2)
            mainLbl.attributedText = completeText
        }
        
        ui.genericlLayout(object: mainLbl,
                          parentView: yellowBtn,
                          leadingC: wRatio(cW:16),
                          centerV: 0,
                          trailingToO: mainImgVw.leadingAnchor,
                          trailingCG: 0)
        
        
    }
    
    @objc func actionYellow() {
        NotificationCenter.default.post(name: Constants.Notifications.openGameSpin, object: self, userInfo: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
