//
//  MainGameOnboardingView.swift
//  izzifit
//
//  Created by O l e h on 11.07.2022.
//

import UIKit
import SwiftUI

enum GameOnboardingStates {
    case energy1, level2, buildPopUp3, level4, buildPopUp5, spinMenuBtn6, spinBtn, blockScreen, goToEnergy, finalPopUp
}

protocol MainGameOnboardingDelegate: AnyObject {
    func tapBtn()
}


class MainGameOnboardingView: UIView {
    
   static var stateCounter = 0
    
    var onboardImgVw =  UIImageView()
    var additionBtn =   UIButton()
    var mainBtn =       UIButton()
    
   static var gameOnboardStates: [GameOnboardingStates] = [.energy1,
                                                     .level2,
                                                     .buildPopUp3,
                                                     .blockScreen,
                                                     .level4,
                                                     .buildPopUp5,
                                                     .blockScreen,
                                                     .spinMenuBtn6,
                                                     .spinBtn,
                                                     .blockScreen,
                                                     .spinBtn,
                                                     .blockScreen,
                                                     .spinBtn,
                                                     .blockScreen,
                                                     .spinBtn,
                                                     .blockScreen,
                                                     .goToEnergy,
                                                     .finalPopUp]
    
    weak var delegate: MainGameOnboardingDelegate?
    var state: GameOnboardingStates
    var gameTabBar: GameTabBarController?
    var arcGameView: ArcticGameView?

    init(state: GameOnboardingStates, delegate: MainGameOnboardingDelegate, gameTabBar: GameTabBarController? = nil, arcGameView: ArcticGameView? = nil ) {
        self.state = state
        self.delegate = delegate
        self.gameTabBar = gameTabBar
        self.arcGameView = arcGameView
        super.init(frame: .zero)
        onboardImgVw.contentMode = .scaleAspectFill
        layer.backgroundColor = UIColor.clear.cgColor
        change(by: state)
      
        mainBtn.addTarget(self,
                                       action: #selector(btnTapped),
                                       for: .touchUpInside)
                     
                     additionBtn.addTarget(self,
                                           action: #selector(btnTapped),
                                           for: .touchUpInside)
        
    
        
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit {
        onboardImgVw.removeFromSuperview()
    }
    
    @objc func btnTapped() {
        delegate?.tapBtn()
        
        switch state {
        case .energy1:   removeFromSuperview()
        default: print("done")
        }
     
    }
  
    func change(by state: GameOnboardingStates) {
        
        switch state {
        case .energy1:
                        ui.genericlLayout(object: mainBtn,
                                         parentView: self,
                                         width: 60,
                                         height: 60,
                                         bottomC: 31,
                                         centerH: 0)
            
                        ui.genericlLayout(object: additionBtn,
                                          parentView: self,
                                          width: wRatio(cW: 344),
                                          height: 64,
                                          topC: 198,
                                          centerH: 0)
            
        case .level2:
      
            
            onboardImgVw.image = image(img: .onBuildVillage)
                        ui.genericlLayout(object: onboardImgVw,
                                          parentView: self,
                                          width: 200,
                                          height: 85,
                                          topC: 345,
                                          centerH: 60)
            
                        ui.genericlLayout(object: mainBtn,
                                         parentView: self,
                                         width: 100,
                                         height: 100,
                                         topC: 400,
                                         trailingC: 58)
                        
        case .buildPopUp3:
                                  ui.genericlLayout(object: mainBtn,
                                                  parentView: self,
                                                  width: 242,
                                                  height: 40,
                                                  topC: 387,
                                                  centerH: 0)
        case .level4:     onboardImgVw.image = image(img: .onUpgradeBuild)
            ui.genericlLayout(object: onboardImgVw,
                              parentView: self,
                              width: 200,
                              height: 85,
                              topC: 335,
                              centerH: 60)
            ui.genericlLayout(object: mainBtn,
                             parentView: self,
                             width: 110,
                             height: 110,
                             topC: 390,
                             trailingC: 58)
        case .buildPopUp5:    ui.genericlLayout(object: mainBtn,
                                                parentView: self,
                                                width: 242,
                                                height: 40,
                                                topC: 387,
                                                centerH: 0)
        case .spinMenuBtn6:   onboardImgVw.image = image(img: .onNotEnoughCoins)
                            ui.genericlLayout(object: onboardImgVw,
                                              parentView: self,
                                              width: 200,
                                              height: 101,
                                              bottomC: 119,
                                              leadingC: wRatio(cW:53))
       
            ui.genericlLayout(object: mainBtn,
                              parentView: gameTabBar?.view ?? self,
                              width: gameTabBar?.spinBtn.sizeWidth,
                              height: gameTabBar?.spinBtn.sizeHeight,
                              centerVtoO: gameTabBar?.spinBtn.centerYAnchor,
                              centerHtoO: gameTabBar?.spinBtn.centerXAnchor)
            
        case .spinBtn:
        
            onboardImgVw.image = image(img: .onNotEnoughCoins)
                                ui.genericlLayout(object: onboardImgVw,
                                                  parentView: arcGameView?.progressImgVw ?? self,
                                                  width: 220,
                                                  height: 102,
                                                  centerV: 10,
                                                  centerH: 0)
            ui.genericlLayout(object: mainBtn,
                              parentView:  gameTabBar?.view ?? self,
                              width: h*0.288,
                              height: h*0.088,
                              topC: h/4.51 + h*0.498 + 17,
                              centerH: 0)
            
            arcGameView?.spinBtn.isUserInteractionEnabled = false
            
            
        case .blockScreen:  print("empty")
        case .goToEnergy: onboardImgVw.image = image(img: .onToEnergy)
            ui.genericlLayout(object: onboardImgVw,
                              parentView: self,
                              width: 200,
                              height: 101,
                              bottomC: 119,
                              leadingC: wRatio(cW:18))

            ui.genericlLayout(object: mainBtn,
                          parentView: gameTabBar?.view ?? self,
                          width: gameTabBar?.backBtn.sizeWidth,
                          height: gameTabBar?.backBtn.sizeHeight,
                          centerVtoO: gameTabBar?.backBtn.centerYAnchor,
                          centerHtoO: gameTabBar?.backBtn.centerXAnchor)
        case .finalPopUp:  backgroundColor = UIColor(rgb: 0x3F3E56, alpha: 0.3)
            
                            let popView = UIView()
                            popView.layer.backgroundColor = UIColor.white.cgColor
                            popView.layer.cornerRadius = wRatio(cW: 20)
                            popView.layer.masksToBounds = true
                             
            ui.genericlLayout(object: popView,
                              parentView: self,
                              width: wRatio(cW:344),
                              height: wRatio(cW: 430),
                              topC: hRatio(cH:184),
                              centerH: 0)
            // Congrats label
            var mainTitleLbl = UILabel()
            
            ui.setLabel(label: mainTitleLbl,
                        labelText: "Congrats",
                        textColor: UIColor(rgb: 0x3F3E56),
                        textAlignment: .center,
                        fontSize: wRatio(cW: 24),
                        fontName: "Inter-Medium")
            
            
            ui.genericlLayout(object: mainTitleLbl,
                              parentView: popView,
                              topC: hRatio(cH: 32),
                              centerH: 0)
            
            
            // Description Label
            
            var descriptionLbl = UILabel()
            
            ui.setLabel(label: descriptionLbl,
                        textColor: UIColor(rgb: 0x3F3E56),
                        textAlignment: .center,
                        fontSize: wRatio(cW: 16),
                        fontName: "Inter-Regular",
                        lines: 0)
          
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = image(img: .onboardingFun)
            let imageOffsetY: CGFloat = -7.0
            imageAttachment.bounds = CGRect(x: 0,
                                            y: imageOffsetY,
                                            width: imageAttachment.image!.size.width + 5,
                                            height: imageAttachment.image!.size.height + 5)
            
  
            let attachmentString = NSAttributedString(attachment: imageAttachment)
            let completeText = NSMutableAttributedString(string: "Just play the game, have  ")
            completeText.append(attachmentString)
            let textAfterIcon = NSAttributedString(string: ", and  \n do daily simple tasks and lose \n weight!")
            completeText.append(textAfterIcon)
            
            
            descriptionLbl.attributedText = completeText
            
            ui.genericlLayout(object: descriptionLbl,
                              parentView: popView,
                              topC: hRatio(cH: 79),
                              centerH: 0)
            
            
            // Graph ImageView
            
            let graphImageView = UIImageView()
            
            graphImageView.image = image(img: .onGraph)
            graphImageView.contentMode = .scaleAspectFill
            
            ui.genericlLayout(object: graphImageView,
                              parentView: popView,
                              width: wRatio(cW: 296),
                              height: wRatio(cW: 160),
                              topC: hRatio(cH: 172),
                              centerH: 0)
            
            // Ok Button
            
            
            let okBtn = UIButton()
            
            okBtn.layer.backgroundColor = UIColor(rgb: 0xFF42A8).cgColor
            okBtn.layer.cornerRadius    = wRatio(cW: 20)
            okBtn.layer.masksToBounds   = true
            
            okBtn.setTitle("OK", for: .normal)
            okBtn.titleLabel?.font = UIFont(name: "Inter-Medium" , size: wRatio(cW: 18))
            okBtn.titleLabel?.textColor = UIColor.white
            
            ui.genericlLayout(object: okBtn,
                              parentView: self,
                              width: wRatio(cW: 296),
                              height: wRatio(cW: 40),
                              centerH: 0,
                              bottomToO: popView.bottomAnchor,
                              bottomCG: 24)
            
            okBtn.addTarget(self,
                             action: #selector(btnTapped),
                             for: .touchUpInside)
        }
    }
}
