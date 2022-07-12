//
//  MainGameOnboardingView.swift
//  izzifit
//
//  Created by O l e h on 11.07.2022.
//

import UIKit
import SwiftUI

enum GameOnboardingStates {
    case energy1, level2, buildPopUp3, level4, buildPopUp5, spinMenuBtn6, spinBtn, blockScreen, goToEnergy
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
                                                     .goToEnergy]
    
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
        
        switch MainGameOnboardingView.stateCounter {
        default:     mainBtn.addTarget(self,
                                       action: #selector(btnTapped),
                                       for: .touchUpInside)
                     
                     additionBtn.addTarget(self,
                                           action: #selector(btnTapped),
                                           for: .touchUpInside)
        }
    
        
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
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
                                                  parentView: self,
                                                  width: 220,
                                                  height: 102,
                                                  bottomC: 250,
                                                  centerH: 0)
        case .blockScreen:  print("empty")
        case .goToEnergy:  print("empty")
        }
    }
}
