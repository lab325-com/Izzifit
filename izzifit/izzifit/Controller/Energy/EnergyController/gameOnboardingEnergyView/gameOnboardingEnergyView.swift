//
//  gameOnboardingEnergyView.swift
//  izzifit
//
//  Created by O l e h on 08.07.2022.
//

import UIKit

enum OnboardingGameState {
    case energy, game
}

class GameOnboardingEnergyView: UIView {

    var state: OnboardingGameState
    
    var mainLbl = UILabel()
    var mainImgVw = UIImageView()
    
    init(state: OnboardingGameState) {
        self.state = state
        super.init(frame: .zero)
        
        setAndLayout()
    }
    
    func setAndLayout() {
        
        layer.backgroundColor = UIColor(rgb: 0xFFF2D2).cgColor
        layer.cornerRadius = 15
        layer.masksToBounds = true
        mainImgVw.contentMode = .scaleAspectFill
        
        // Create Attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image(img: .onboardingEnergy)
        // Set bound to reposition
        let imageOffsetY: CGFloat = -5.0
        imageAttachment.bounds = CGRect(x: 0,
                                        y: imageOffsetY,
                                        width: imageAttachment.image!.size.width,
                                        height: imageAttachment.image!.size.height)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "HUI")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string: "Using attachment.bounds!")
        completeText.append(textAfterIcon)
        mainLbl.textAlignment = .center
        mainLbl.attributedText = completeText
        mainLbl.numberOfLines = 0
        
        switch state {
        case .energy:   mainImgVw.image = image(img: .onboardingLightning)  ?? UIImage()
                        ui.genericlLayout(object: mainImgVw,
                                          parentView: self,
                                          width: wRatio(cW:38.5),
                                          height: wRatio(cW: 51),
                                          bottomC: 6,
                                          trailingC: wRatio(cW: 16))
            
        case .game:     mainImgVw.image = image(img: .onboardingVillage)    ?? UIImage()
                        ui.genericlLayout(object: mainImgVw,
                                          parentView: self,
                                          width: wRatio(cW:77),
                                          height: wRatio(cW: 62),
                                          bottomC: 9,
                                          trailingC: wRatio(cW: 9))
      }
        
        ui.genericlLayout(object: mainLbl,
                          parentView: self,
                          leadingC: wRatio(cW:16),
                          centerV: 0,
                          trailingToO: mainImgVw.leadingAnchor,
                          trailingCG: 0)
        
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
