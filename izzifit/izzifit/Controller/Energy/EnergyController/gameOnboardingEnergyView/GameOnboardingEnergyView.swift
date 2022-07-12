//
//  gameOnboardingEnergyView.swift
//  izzifit
//
//  Created by O l e h on 08.07.2022.
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
    var yellowVw = UIView()
    
    init(state: OnboardingGameState) {
        self.state = state
        super.init(frame: .zero)
        
        setAndLayout()
        
    }
    
    func setAndLayout() {
        
        yellowVw.layer.backgroundColor = UIColor(rgb: 0xFFF2D2).cgColor
        yellowVw.layer.cornerRadius = 20
        yellowVw.layer.masksToBounds = true
        
        ui.genericlLayout(object: yellowVw,
                          parentView: self,
                          width: wRatio(cW:344),
                          height: 64,
                          bottomC: 0,
                          centerH: 0)
                          
        mainImgVw.contentMode = .scaleAspectFill
        
        // Create Attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image(img: .onboardingEnergy)
        // Set bound to reposition
        let imageOffsetY: CGFloat = -5.0
        imageAttachment.bounds = CGRect(x: 0,
                                        y: imageOffsetY,
                                        width: imageAttachment.image!.size.width + 5,
                                        height: imageAttachment.image!.size.height + 5)
        
        let imageAt2 = NSTextAttachment()
        imageAt2.image = image(img: .onboardingFun)
        imageAt2.bounds = CGRect(x: 0,
                                 y: -9.0,
                                 width: imageAt2.image!.size.width + 5,
                                 height: imageAt2.image!.size.height + 5)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "You have enough  ")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string: "  energy for fun! \nBuild your new world! Tap  ")
        completeText.append(textAfterIcon)
        
        let attString2 = NSAttributedString(attachment: imageAt2)
        completeText.append(attString2)
      
        ui.setLabel(label: mainLbl,
                    textColor: UIColor(rgb: 0x3F3E56),
                    textAlignment: .left,
                    fontSize: wRatio(cW: 14),
                    fontName: "Inter-Regular",
                    lines: 0)
        mainLbl.attributedText = completeText
        
        switch state {
        case .energy:   mainImgVw.image = image(img: .onboardingLightning)  ?? UIImage()
            
            var anim = AnimationView(name: "spark_anim")
            anim.contentMode = .scaleAspectFill
            anim.loopMode = .loop
            
            ui.genericlLayout(object: anim,
                              parentView: yellowVw,
                              width: 100,
                              height: 100,
                              trailingC: 1,
                              centerV: 0)
            
            ui.genericlLayout(object: mainImgVw,
                              parentView: self,
                              width: wRatio(cW:38.5),
                              height: wRatio(cW: 51),
                              bottomToO: yellowVw.bottomAnchor,
                              bottomCG: 6,
                              trailingToO: yellowVw.trailingAnchor,
                              trailingCG: wRatio(cW: 16))
            anim.play()
            
        case .game:
            
            var anim = AnimationView(name: "smoke_anim")
            anim.contentMode = .scaleAspectFit
            anim.loopMode = .loop
            
            ui.genericlLayout(object: anim,
                              parentView: self,
                              width: 60,
                              height: 60,
                              bottomC: 27,
                              trailingC: 1)
            
            mainImgVw.image = image(img: .onboardingVillage)    ?? UIImage()
            ui.genericlLayout(object: mainImgVw,
                              parentView: self,
                              width: wRatio(cW:77),
                              height: wRatio(cW: 62),
                              topToO: yellowVw.topAnchor,
                              topCG: -7,
                              trailingToO: yellowVw.trailingAnchor,
                              trailingCG: wRatio(cW: 9))
            anim.play()
        }
        
        ui.genericlLayout(object: mainLbl,
                          parentView: yellowVw,
                          leadingC: wRatio(cW:16),
                          centerV: 0,
                          trailingToO: mainImgVw.leadingAnchor,
                          trailingCG: 0)
        
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
