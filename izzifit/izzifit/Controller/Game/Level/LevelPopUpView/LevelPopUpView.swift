//
//  LevelPopUpView.swift
//  izzifit
//
//  Created by O l e h on 09.06.2022.
//

import UIKit

class LevelPopUpView: UIView {

    private let mainBackImgVw = UIImageView()
    let closeBtn = UIButton()
    private let titleLbl = UILabel()
    let upgradeBtn = UIButton()
    
    private var previousStateImgVw = UIImageView()
    private let arrowImgVw = UIImageView()
    private var nextStateImgVw = UIImageView()
    
    var hummerImgVw = UIImageView()
    var hummerCountLbl = UILabel()
    
    private lazy var imgVwStates: [UIImageView] = {
       var imgs = [UIImageView]()
        for i in 0...4 {
            let img = UIImageView()
            img.image = unselectedStateImgs[i]
            img.heightAnchor.constraint(equalToConstant: 10).isActive = true
            img.widthAnchor.constraint(equalToConstant: 43).isActive = true
            imgs.append(img)
        }
        return imgs
    }()
    
    private var coinImgVw = UIImageView()
    var priceLbl = UILabel()
    
    private var unselectedStateImgs = [ScaleImgs.scale1Unselected,
                                       ScaleImgs.scale2Unselected,
                                       ScaleImgs.scale3Unselected,
                                       ScaleImgs.scale4Unselected,
                                       ScaleImgs.scale5Unselected]
    
    private var selectedStateImgs = [ScaleImgs.scale1Selected,
                                     ScaleImgs.scale2Selected,
                                     ScaleImgs.scale3Selected,
                                     ScaleImgs.scale4Selected,
                                     ScaleImgs.scale5Selected]
            
    private var title: String
  
    init(title: String, mapName: MapName) {
        self.title = title
        super.init(frame: .zero)
        setUI()
        layout()
        switch mapName {
        case .snow_map:
            hummerImgVw.image = image(img: .freeHummer)
        case .england_map:
            hummerImgVw.image = image(img: .england_freeHummer)
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func draw(_ type: BuildingType, state: LevelStates) {
    
        var imgs = [UIImage]()
        
        switch title {
        case "Arctic": imgs = arcticLevelPopImgs
        case "England": imgs = englandLevelPopImgs
        default: return
        }
        
        switch type {
        case .building1:
            switch state {
            case .start: previousStateImgVw.image = imgs[0]; nextStateImgVw.image = imgs[1]
            case .first: previousStateImgVw.image = imgs[1]; nextStateImgVw.image = imgs[2]
            case .second: previousStateImgVw.image = imgs[2]; nextStateImgVw.image = imgs[3]
            case .third: previousStateImgVw.image = imgs[3]; nextStateImgVw.image = imgs[4]
            case .fourth: previousStateImgVw.image = imgs[4]; nextStateImgVw.image = imgs[5]
            case .finish: break
            }
        case .building2:
            switch state {
            case .start: previousStateImgVw.image = imgs[6]; nextStateImgVw.image = imgs[7]
            case .first: previousStateImgVw.image = imgs[7]; nextStateImgVw.image = imgs[8]
            case .second: previousStateImgVw.image = imgs[8]; nextStateImgVw.image = imgs[9]
            case .third: previousStateImgVw.image = imgs[9]; nextStateImgVw.image = imgs[10]
            case .fourth: previousStateImgVw.image = imgs[10]; nextStateImgVw.image = imgs[11]
            case .finish: break
            }
            
        case .building3:
            switch state {
            case .start: previousStateImgVw.image = imgs[12]; nextStateImgVw.image = imgs[13]
            case .first: previousStateImgVw.image = imgs[13]; nextStateImgVw.image = imgs[14]
            case .second: previousStateImgVw.image = imgs[14]; nextStateImgVw.image = imgs[15]
            case .third: previousStateImgVw.image = imgs[15]; nextStateImgVw.image = imgs[16]
            case .fourth: previousStateImgVw.image = imgs[16]; nextStateImgVw.image = imgs[17]
            case .finish: break
            }
            
        case .building4:
            switch state {
            case .start: previousStateImgVw.image = imgs[18]; nextStateImgVw.image = imgs[19]
            case .first: previousStateImgVw.image = imgs[19]; nextStateImgVw.image = imgs[20]
            case .second: previousStateImgVw.image = imgs[20]; nextStateImgVw.image = imgs[21]
            case .third: previousStateImgVw.image = imgs[21]; nextStateImgVw.image = imgs[22]
            case .fourth: previousStateImgVw.image = imgs[22]; nextStateImgVw.image = imgs[23]
            case .finish: break
            }
            
        case .building5:
            switch state {
            case .start: previousStateImgVw.image = imgs[24]; nextStateImgVw.image = imgs[25]
            case .first: previousStateImgVw.image = imgs[25]; nextStateImgVw.image = imgs[26]
            case .second: previousStateImgVw.image = imgs[26]; nextStateImgVw.image = imgs[27]
            case .third: previousStateImgVw.image = imgs[27]; nextStateImgVw.image = imgs[28]
            case .fourth: previousStateImgVw.image = imgs[28]; nextStateImgVw.image = imgs[29]
            case .finish: break
            }
        }
    }
    
    func fillStates(by currentState: LevelStates) {
        
        var currentStateCounter = Int()
        
        switch currentState {
        case .start: currentStateCounter = -1
        case .first: currentStateCounter = 0
        case .second: currentStateCounter = 1
        case .third: currentStateCounter = 2
        case .fourth: currentStateCounter = 3
        case .finish: break
        }
        
        for (index,state) in imgVwStates.enumerated() {
            guard index <= currentStateCounter else { return }
            state.image = selectedStateImgs[index]
            layoutIfNeeded()
        }
    }
    
    private func setUI() {
        backgroundColor = UIColor(rgb: 0x3F3E56,alpha: 0.3)
        mainBackImgVw.image = image(img: .twoPurchaseBack)
        
        ui.setLabel(label: titleLbl,
                    labelText: "\(title) shop",
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: 16,
                    fontName: "Inter-BoldItalic")
        
        closeBtn.setImage(image(img: .backBtn), for: .normal)
        arrowImgVw.image = image(img: .yellowPointer)
        upgradeBtn.setImage(UIImage(named: "upgradeBtn"), for: .normal)
        coinImgVw.image = UIImage(named: "top_view_coin_ic")
        
        ui.setLabel(label: priceLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: 16,
                    fontName: "Inter-Bold")
        
        previousStateImgVw.contentMode = .scaleAspectFit
        nextStateImgVw.contentMode = .scaleAspectFit

        
        ui.setLabel(label: hummerCountLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: 13,
                    fontName: "Inter-BoldItalic")
    }
    
    private func layout() {
        
        ui.genericlLayout(object: mainBackImgVw,
                          parentView: self,
                          width: 310,
                          height: 273,
                          topC: hRatio(cH:174),
                          centerH: 0)
        
        ui.genericlLayout(object: titleLbl,
                          parentView: mainBackImgVw,
                          topC: 12,
                          centerH: 0)
        
        ui.genericlLayout(object: closeBtn,
                          parentView: self,
                          width: 40,
                          height: 40,
                          topToO: mainBackImgVw.topAnchor,
                          topCG: 0,
                          trailingToO: mainBackImgVw.trailingAnchor,
                          trailingCG: -10)
        
        ui.genericlLayout(object: upgradeBtn,
                          parentView: self,
                          width: 242,
                          height: 40,
                          centerH: 0,
                          bottomToO: mainBackImgVw.bottomAnchor,
                          bottomCG: 44)
        
        ui.genericlLayout(object: priceLbl,
                          parentView: upgradeBtn,
                          trailingC: 19.5,
                          centerV: 0)
        
        ui.genericlLayout(object: coinImgVw,
                          parentView: upgradeBtn,
                          width: 20,
                          height: 20,
                          centerV: 0,
                          trailingToO: priceLbl.leadingAnchor,
                          trailingCG: 6)
        
        ui.genericlLayout(object: arrowImgVw,
                          parentView: mainBackImgVw,
                          width: 27,
                          height: 22,
                          topC: 86,
                          centerH: 0)
        
        ui.genericlLayout(object: previousStateImgVw,
                          parentView: mainBackImgVw,
                          width: 91,
                          height: 107,
                          centerVtoO: arrowImgVw.centerYAnchor,
                          trailingToO: arrowImgVw.leadingAnchor,
                          trailingCG: 15)
        
        ui.genericlLayout(object: nextStateImgVw,
                          parentView: mainBackImgVw,
                          width: 91,
                          height: 107,
                          centerVtoO: arrowImgVw.centerYAnchor,
                          leadingToO: arrowImgVw.trailingAnchor,
                          leadingCG: 15)
        
        let horizontalStack = UIStackView(arrangedSubviews: imgVwStates)
        
        horizontalStack.alignment = .center
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalCentering
        horizontalStack.spacing = 6
        
        ui.genericlLayout(object: horizontalStack,
                          parentView: mainBackImgVw,
                          bottomC: 103,
                          centerH: 0)
        
        ui.genericlLayout(object: hummerImgVw,
                          parentView: mainBackImgVw,
                          width: 44,
                          height: 47,
                          topC: 28,
                          leadingC: 18)
        
        ui.genericlLayout(object: hummerCountLbl,
                          parentView: hummerImgVw,
                          bottomC: 3,
                          trailingC: 7)
    }
    
    //----------------------------------------------
    // MARK: - MapsLevelPopUpStates
    //----------------------------------------------
    
    lazy var arcticLevelPopImgs: [UIImage] = {
        [image(img: .shipStart) ?? UIImage(),
         image(img: .shipFirst) ?? UIImage(),
         image(img: .shipSecond) ?? UIImage(),
         image(img: .shipThird) ?? UIImage(),
         image(img: .shipFourth) ?? UIImage(),
         image(img: .shipFinish) ?? UIImage(),
         
         image(img: .fishStart) ?? UIImage(),
         image(img: .fishFirst) ?? UIImage(),
         image(img: .fishSecond) ?? UIImage(),
         image(img: .fishThird) ?? UIImage(),
         image(img: .fishFourth) ?? UIImage(),
         image(img: .fishFinish) ?? UIImage(),
         
         image(img: .igluStart) ?? UIImage(),
         image(img: .igluFirst) ?? UIImage(),
         image(img: .igluSecond) ?? UIImage(),
         image(img: .igluThird) ?? UIImage(),
         image(img: .igluFourth) ?? UIImage(),
         image(img: .igluFinish) ?? UIImage(),
         
         image(img: .goldStart) ?? UIImage(),
         image(img: .goldFirst) ?? UIImage(),
         image(img: .goldSecond) ?? UIImage(),
         image(img: .goldThird) ?? UIImage(),
         image(img: .goldFourth) ?? UIImage(),
         image(img: .goldFinish) ?? UIImage(),
         
         image(img: .deersStart) ?? UIImage(),
         image(img: .deersFirst) ?? UIImage(),
         image(img: .deersSecond) ?? UIImage(),
         image(img: .deersThird) ?? UIImage(),
         image(img: .deersFourth) ?? UIImage(),
         image(img: .deersFinish) ?? UIImage()
        ]
    }()
    
    lazy var englandLevelPopImgs: [UIImage] = {
        [image(img: .eng_popStart) ?? UIImage(),
         image(img: .eng_1shipPop) ?? UIImage(),
         image(img: .eng_2shipPop) ?? UIImage(),
         image(img: .eng_3shipPop) ?? UIImage(),
         image(img: .eng_4shipPop) ?? UIImage(),
         image(img: .eng_5shipPop) ?? UIImage(),
         
         image(img: .eng_popStart) ?? UIImage(),
         image(img: .eng_1bridgePop) ?? UIImage(),
         image(img: .eng_2bridgePop) ?? UIImage(),
         image(img: .eng_3bridgePop) ?? UIImage(),
         image(img: .eng_4bridgePop) ?? UIImage(),
         image(img: .eng_5bridgePop) ?? UIImage(),
         
         image(img: .eng_popStart) ?? UIImage(),
         image(img: .eng_1phonePop) ?? UIImage(),
         image(img: .eng_2phonePop) ?? UIImage(),
         image(img: .eng_3phonePop) ?? UIImage(),
         image(img: .eng_4phonePop) ?? UIImage(),
         image(img: .eng_5phonePop) ?? UIImage(),
         
         image(img: .eng_popStart) ?? UIImage(),
         image(img: .eng_1bigBenPop) ?? UIImage(),
         image(img: .eng_2bigBenPop) ?? UIImage(),
         image(img: .eng_3bigBenPop) ?? UIImage(),
         image(img: .eng_4bigBenPop) ?? UIImage(),
         image(img: .eng_5bigBenPop) ?? UIImage(),
         
         image(img: .eng_popStart) ?? UIImage(),
         image(img: .eng_1busPop) ?? UIImage(),
         image(img: .eng_2busPop) ?? UIImage(),
         image(img: .eng_3busPop) ?? UIImage(),
         image(img: .eng_4busPop) ?? UIImage(),
         image(img: .eng_5busPop) ?? UIImage()
        ]
    }()
}
