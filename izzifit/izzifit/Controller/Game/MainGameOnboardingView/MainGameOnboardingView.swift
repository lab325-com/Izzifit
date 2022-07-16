//
//  MainGameOnboardingView.swift
//  izzifit
//
//  Created by O l e h on 11.07.2022.
//

import UIKit
import Lottie

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
    var menuAnim: AnimationView?
    var spinAnim: AnimationView?
    
    static var currentState: GameOnboardingStates {
        MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter]
    }
    
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
        menuAnim?.removeFromSuperview()
        spinAnim?.removeFromSuperview()
    }
    
    @objc func btnTapped() {
        delegate?.tapBtn()
    }
  
    func change(by state: GameOnboardingStates) {
        
        switch state {
        case .energy1:
                        var funAnimationView = AnimationView(name: "menu_anim")
                            funAnimationView.contentMode = .scaleAspectFill
                            funAnimationView.loopMode = .loop
                            funAnimationView.play()
            
                        ui.genericlLayout(object: funAnimationView,
                                         parentView: self,
                                         width: 90,
                                         height: 90,
                                         bottomC: 16,
                                         centerH: 0)
            
            
            
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
      
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                       self.onboardImgVw.image = self.image(img: .onBuildVillage)
                       self.ui.genericlLayout(object: self.onboardImgVw,
                                              parentView: self,
                                              width: 228,
                                              height: 97,
                                              topC: 335,
                                              centerH: 55)
                self.onboardImgVw.shake(0.5,
                                        x: self.w / 2 + 55,
                                        y: 335 + 48.5)
                
                if let baseVC = self.gameTabBar?.children[1] as? GameBaseController {
                    if let levelVC = baseVC.children.first as? LevelController {
                        levelVC.slideAnimationView?.play()
                    }
                }
                
            }
                        
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
                                                  topC: hRatio(cH:174) + (273 - 44 - 40),
                                                  centerH: 0)
            
        case .level4:
            
            if let baseVC = gameTabBar?.children[1] as? GameBaseController {
                if let levelVC = baseVC.children.first as? LevelController {
                    levelVC.animationWidthAnchor.constant = 150
                    levelVC.animationHeightAnchor.constant = 46
                    levelVC.animationTrailingConstraint.constant = -58
                    levelVC.view.layoutIfNeeded()
                }
            }

            
            onboardImgVw.image = image(img: .onUpgradeBuild)
                            ui.genericlLayout(object: onboardImgVw,
                                              parentView: self,
                                              width: 228,
                                              height: 97,
                                              topC: 315,
                                              centerH: 48)
            
            onboardImgVw.shake(0.5,
                               x: w / 2 + 48,
                               y: 315 + 48.5)
            
            ui.genericlLayout(object: mainBtn,
                             parentView: self,
                             width: 110,
                             height: 110,
                             topC: 390,
                             trailingC: 58)
            
        case .buildPopUp5:  ui.genericlLayout(object: mainBtn,
                                                parentView: self,
                                                width: 242,
                                                height: 40,
                                                topC: hRatio(cH:174) + (273 - 44 - 40),
                                                centerH: 0)
            
        case .spinMenuBtn6:
            if let baseVC = self.gameTabBar?.children[1] as? GameBaseController {
                if let levelVC = baseVC.children.first as? LevelController {
                    levelVC.slideAnimationView?.stop()
                }
            }
            
            onboardImgVw.image = image(img: .onNotEnoughCoins)
                            ui.genericlLayout(object: onboardImgVw,
                                              parentView: gameTabBar?.view ?? self,
                                              width: 228,
                                              height: 114,
                                              bottomC: h - ( h/27.06 + h/10.15 + 10),
                                              centerHtoO: gameTabBar?.spinBtn.centerXAnchor)
            
            let btnWidth =  (h/11.6)
            let allstack = (4 * h/11.6) + (3 * w/26.78)
            let leading =  (w - allstack)/2
            let x = leading + btnWidth + w/26.78 + (btnWidth/2)
            let y = h - (( h/27.06 + h/10.15 + 10) + 37)
            
            onboardImgVw.shake(0.5,
                               x:  x,
                               y: y)
       
            menuAnim = .init(name: "menu_anim")
            menuAnim?.contentMode = .scaleAspectFill
            menuAnim?.loopMode = .loop
            
            ui.genericlLayout(object: menuAnim!,
                              parentView: gameTabBar?.view ?? self,
                              width: gameTabBar?.spinBtn.sizeWidth,
                              height: gameTabBar?.spinBtn.sizeHeight,
                              centerVtoO: gameTabBar?.spinBtn.centerYAnchor,
                              centerHtoO: gameTabBar?.spinBtn.centerXAnchor)
            
            ui.genericlLayout(object: mainBtn,
                              parentView: gameTabBar?.view ?? self,
                              width: gameTabBar?.spinBtn.sizeWidth,
                              height: gameTabBar?.spinBtn.sizeHeight,
                              centerVtoO: gameTabBar?.spinBtn.centerYAnchor,
                              centerHtoO: gameTabBar?.spinBtn.centerXAnchor)
            menuAnim?.play()
            
        case .spinBtn:
        
            onboardImgVw.image = image(img: .onSpinButton)
                                ui.genericlLayout(object: onboardImgVw,
                                                  parentView: arcGameView?.progressImgVw ?? self,
                                                  width: 251,
                                                  height: 116,
                                                  centerV: 10,
                                                  centerH: 10)
            
            onboardImgVw.shake(0.5,
                               x: w/2 - 125,
                               y: 18)
            
            ui.genericlLayout(object: mainBtn,
                              parentView:  gameTabBar?.view ?? self,
                              width: h*0.288,
                              height: h*0.088,
                              topC: h/4.51 + h*0.498 + 17,
                              centerH: 0)
            
            arcGameView?.spinBtn.isUserInteractionEnabled = false
            
            spinAnim = .init(name: "spin_button_anim")
            
            spinAnim?.contentMode = .scaleAspectFill
            spinAnim?.loopMode = .loop
            
            ui.genericlLayout(object: spinAnim!,
                              parentView: arcGameView?.spinBtn ?? self,
                              width: (arcGameView?.spinBtn.sizeWidth ?? 0.0) * 1.08,
                              height: (arcGameView?.spinBtn.sizeHeight ?? 0.0) * 1.1,
                              centerVtoO: arcGameView?.spinBtn.centerYAnchor,
                              centerHtoO: arcGameView?.spinBtn.centerXAnchor)
            spinAnim?.play()
            
        case .blockScreen:  print("empty")
        case .goToEnergy: onboardImgVw.image = image(img: .onToEnergy)
            ui.genericlLayout(object: onboardImgVw,
                              parentView: gameTabBar?.view ?? self,
                              width: 228,
                              height: 114,
                              bottomC: h - ( h/27.06 + h/10.15 + 10),
                              centerHtoO: gameTabBar?.backBtn.centerXAnchor)
            
            let btnWidth =  (h/11.6)
            let allstack = (4 * h/11.6) + (3 * w/26.78)
            let leading =  (w - allstack)/2
            let x = leading + (btnWidth/2) + 50
            let y = h - (( h/27.06 + h/10.15 + 10) + 37)
            
            onboardImgVw.shake(0.5,
                               x: x,
                               y: y)

          
            
            menuAnim = .init(name: "menu_anim")
            menuAnim?.contentMode = .scaleAspectFill
            menuAnim?.loopMode = .loop
            
            ui.genericlLayout(object: menuAnim!,
                              parentView: gameTabBar?.view ?? self,
                              width: gameTabBar?.backBtn.sizeWidth,
                              height: gameTabBar?.backBtn.sizeHeight,
                              centerVtoO: gameTabBar?.backBtn.centerYAnchor,
                              centerHtoO: gameTabBar?.backBtn.centerXAnchor)
            
            ui.genericlLayout(object: mainBtn,
                          parentView: gameTabBar?.view ?? self,
                          width: gameTabBar?.backBtn.sizeWidth,
                          height: gameTabBar?.backBtn.sizeHeight,
                          centerVtoO: gameTabBar?.backBtn.centerYAnchor,
                          centerHtoO: gameTabBar?.backBtn.centerXAnchor)
            menuAnim?.play()

        case .finalPopUp:  backgroundColor = UIColor(rgb: 0x3F3E56, alpha: 0.3)
            
                            let popView = UIView()
                            popView.layer.backgroundColor = UIColor.white.cgColor
                            popView.layer.cornerRadius = wRatio(cW: 20)
                            popView.layer.masksToBounds = true
                             
            ui.genericlLayout(object: popView,
                              parentView: self,
                              width: wRatio(cW:344),
                              height: wRatio(cW: 480),
                              topC: hRatio(cH:184),
                              centerH: 0)
            // Congrats label
            var mainTitleLbl = UILabel()
            
            ui.setLabel(label: mainTitleLbl,
                        labelText: "Congratulations",
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
//                        labelText: "You have taken your first steps toward \n a new, healthier life and learned the \n basic features of our app! Play, \n complete easy daily tasks, get fit, and \n get healthy!",
                        textColor: UIColor(rgb: 0x3F3E56),
                        textAlignment: .center,
                        fontSize: wRatio(cW: 16),
                        fontName: "Inter-Regular",
                        lines: 0)
          
//            let imageAttachment = NSTextAttachment()
//            imageAttachment.image = image(img: .onboardingFun)
//            let imageOffsetY: CGFloat = -7.0
//            imageAttachment.bounds = CGRect(x: 0,
//                                            y: imageOffsetY,
//                                            width: imageAttachment.image!.size.width + 5,
//                                            height: imageAttachment.image!.size.height + 5)
//
//
//            let attachmentString = NSAttributedString(attachment: imageAttachment)
//            let completeText = NSMutableAttributedString(string: "Just play the game, have  ")
//            completeText.append(attachmentString)
//            let textAfterIcon = NSAttributedString(string: ", and  \n do daily simple tasks and lose \n weight!")
//            completeText.append(textAfterIcon)
//
//
//          //  descriptionLbl.attributedText = completeText
            
            
            descriptionLbl.lineBreakMode = .byWordWrapping
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.24
            paragraphStyle.alignment = .center
            descriptionLbl.attributedText = NSMutableAttributedString(string: "You have taken your first steps toward \n a new, healthier life and learned the \n basic features of our app! Play, \n complete easy daily tasks, get fit, and \n get healthy!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            
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
                              topC: hRatio(cH: 232),
                              centerH: 0)
            
            // congrads_anim
            
            let anim = AnimationView(name: "congrads_anim")
            anim.loopMode = .playOnce
            anim.contentMode = .scaleAspectFill
          
            ui.genericlLayout(object: anim,
                              parentView: popView,
                              width: w,
                              height: h,
                              centerV: 0,
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                anim.play()
            }
        }
    }
}
