//
//  MainGameOnboardingView.swift
//  izzifit
//
//  Created by O l e h on 11.07.2022.
//

import UIKit

enum GameOnboardingStates {
    case energy1, level2, buildPopUp3, level4, buildPopUp5, spinMenuBtn6, spinBtn, blockScreen, goToEnergy
}

protocol MainGameOnboardingDelegate: AnyObject {
    func tapBtn()
}


class MainGameOnboardingView: UIView {
    
    var stateCounter = 0
    
    var onboardImgVw =  UIImageView()
    var additionBtn =   UIButton()
    var mainBtn =       UIButton()
    
    var gameOnboardStates: [GameOnboardingStates] = [.energy1,
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

    init(state: GameOnboardingStates, delegate: MainGameOnboardingDelegate ) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        change(by: state)
        mainBtn.addTarget(self,
                          action: #selector(btnTapped),
                          for: .touchUpInside)
        
        additionBtn.addTarget(self,
                              action: #selector(btnTapped),
                              for: .touchUpInside)
        
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @objc func btnTapped() {
        delegate?.tapBtn()
        removeFromSuperview()
    }
  
    func change(by state: GameOnboardingStates) {
        
        switch state {
        case .energy1: ui.genericlLayout(object: mainBtn,
                                         parentView: self,
                                         width: 60,
                                         height: 60,
                                         bottomC: 21,
                                         centerH: 0)
            additionBtn.backgroundColor = .yellow
                        ui.genericlLayout(object: additionBtn,
                                          parentView: self,
                                          width: wRatio(cW: 344),
                                          height: 64,
                                          topC: 198,
                                          centerH: 0)
            
        case .level2:  print("empty")
        case .buildPopUp3:  print("empty")
        case .level4:  print("empty")
        case .buildPopUp5:  print("empty")
        case .spinMenuBtn6:  print("empty")
        case .spinBtn:  print("empty")
        case .blockScreen:  print("empty")
        case .goToEnergy:  print("empty")
        }
    }
}
