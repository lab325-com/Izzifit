//
//  LevelFinishView.swift
//  izzifit
//
//  Created by O l e h on 01.07.2022.
//

import UIKit
import Lottie

protocol LevelFinishDelegate: AnyObject {
    func nextMap(view: UIView)
}

class LevelFinishView: UIView {

    //----------------------------------------------
    // MARK: - init()
    //----------------------------------------------

    var title: String
    weak var delegate: LevelFinishDelegate?
    
    init(title: String, delegate: LevelFinishDelegate) {
        self.title = title
        self.delegate = delegate
        super.init(frame: .zero)
        setUI()
        layout()
        
        nextMapBtn.addTarget(self,
                             action: #selector(nextMap),
                             for: .touchUpInside)
        
        winnerAnimationView!.play { completed in
            self.greenDoneImgVw.isHidden.toggle()
        }
        confettiAnimationView!.play()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //----------------------------------------------
    // MARK: - Properties
    //----------------------------------------------
    
    private let mainBackImgVw =     UIImageView()
    private let greenDoneImgVw =    UIImageView()
    private let mainTitleLbl =      UILabel()
    private let nextMapBtn =        UIButton()
    private var winnerAnimationView:      AnimationView?
    private var confettiAnimationView:    AnimationView?
    
    
    //----------------------------------------------
    // MARK: - Methods
    //----------------------------------------------
    
    @objc func nextMap() {
        delegate?.nextMap(view: self)
    }
    
    private func setUI() {
        backgroundColor = UIColor(rgb: 0x3F3E56, alpha: 0.3)
        
        mainBackImgVw.setImage(image(img: .levelFinishPopUpBack) ?? UIImage())
        mainBackImgVw.contentMode = .scaleAspectFill
        
        ui.setLabel(label: mainTitleLbl,
                    labelText: "You finished the \n \(title)!",
                    textColor: UIColor(rgb: 0x6A534C),
                    textAlignment: .center,
                    fontSize: 20,
                    fontName: "Inter-BoldItalic",
                    lines: 0)
        
        winnerAnimationView =       .init(name: "winner")
        winnerAnimationView!.contentMode = .scaleAspectFit
        winnerAnimationView!.loopMode = .playOnce
        winnerAnimationView!.animationSpeed = 1.0
        
        confettiAnimationView =     .init(name: "confetti")
        confettiAnimationView!.contentMode = .scaleAspectFill
        confettiAnimationView!.loopMode = .loop
        confettiAnimationView!.animationSpeed = 0.8
        
        greenDoneImgVw.image = image(img: .greenDone)
        
        nextMapBtn.setBackgroundImage(image(img: .nextMapBtn), for: .normal)
        nextMapBtn.setTitle("NEXT MAP", for: .normal)
        nextMapBtn.titleLabel?.font =                 UIFont(name: "Inter-Bold" , size: 16)
        nextMapBtn.titleLabel?.layer.shadowColor =    UIColor(rgb: 0x462D16, alpha: 0.5).cgColor
        nextMapBtn.titleLabel?.layer.shadowOpacity =  1.0
        nextMapBtn.titleLabel?.layer.shadowRadius =   2.0
        nextMapBtn.titleLabel?.layer.shadowOffset =   CGSize(width: -1.5, height: -1.5)
    }
    
    private func layout() {
        
        ui.genericlLayout(object: mainBackImgVw,
                          parentView: self,
                          width: 310,
                          height: 384,
                          topC: hRatio(cH:174),
                          centerH: 0)
        
        ui.genericlLayout(object: winnerAnimationView!,
                          parentView: mainBackImgVw,
                          width: 305,
                          height: 305,
                          topC: 0,
                          centerH: 0)
                          
        ui.genericlLayout(object: greenDoneImgVw,
                          parentView: mainBackImgVw,
                          width: 40,
                          height: 40,
                          bottomC: 201,
                          trailingC: 110)
        greenDoneImgVw.isHidden.toggle()
        
        ui.genericlLayout(object: mainTitleLbl,
                          parentView: self,
                          centerH: 0,
                          bottomToO: mainBackImgVw.bottomAnchor,
                          bottomCG: 110)
        
        
        ui.genericlLayout(object: confettiAnimationView!,
                          parentView: self,
                          topC: 0,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.genericlLayout(object: nextMapBtn,
                          parentView: self,
                          width: 242,
                          height: 40,
                          centerH: 0,
                          bottomToO: mainBackImgVw.bottomAnchor,
                          bottomCG: 45)

    }
}
