//
//  LevelPopUpView.swift
//  izzifit
//
//  Created by mob325 on 09.06.2022.
//

import UIKit

enum LevelPopType: Int {
    case buildPopType, notEnoughMoney
}

protocol LevelPopUpDelegate: AnyObject {
    func arrowBtnAction(view: UIView)
}

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
    
    private let arrowBtn =  UIButton()
    var emptySpaceBtn =     UIButton()
    
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
    private var popType: LevelPopType
    weak var delegate: LevelPopUpDelegate?
  
    init(popType: LevelPopType,
         delegate: LevelPopUpDelegate) {
        self.popType =  popType
        self.delegate = delegate
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     self.title = "Arctic"
        case .england_map:  self.title = "England"
        case .france_map:   self.title = "France"
        default:            self.title = "Arctic"
        }
        super.init(frame: .zero)
        
        setUI()
        layout()
        
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     hummerImgVw.image = image(img: .freeHummer) 
        case .england_map:  hummerImgVw.image = image(img: .england_freeHummer)
        case .france_map:   hummerImgVw.image = image(img: .france_freeHummer)
        default:            break
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func draw(_ type: BuildingType, state: LevelStates) {
    
        var imgs = [UIImage]()
        
        switch title {
        case "Arctic": imgs =   arcticLevelPopImgs
        case "England": imgs =  englandLevelPopImgs
        case "France": imgs = franceLevelPopImgs
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
    
    @objc func arrowAction() {
        delegate?.arrowBtnAction(view: self)
    }
    
    private func setUI() {
        
        backgroundColor = UIColor(rgb: 0x3F3E56,alpha: 0.3)
        
        let backImgs = [image(img: .buildPopUpBack),
                        image(img: .largeBuildPopUpBack)]
        
        mainBackImgVw.image = backImgs[popType.rawValue]
        
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

                    arrowBtn.addTarget(self,
                                       action: #selector(arrowAction),
                                       for: .touchUpInside)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image(img: .yellowPointer)
        imageAttachment.bounds = CGRect(x: 0,
                                        y: -2,
                                        width: 18,
                                        height: 14)
        let imageAt = NSAttributedString(attachment: imageAttachment)
        let color = UIColor(rgb: 0x6A534C)
        let attributes = [NSAttributedString.Key.font : UIFont(name: "Inter-Medium", size: 15),
                          NSAttributedString.Key.foregroundColor : color]
        
        var completeTextString = String()
        if let energy = KeychainService.standard.me?.energy {
            switch energy {
            case let x where x < 1.0: completeTextString = "Make some fitness    "
            default: completeTextString = "Spin to get coins    "
            }
        }
        
        let completeText = NSMutableAttributedString(string: completeTextString,attributes: attributes)
        completeText.append(imageAt)
        arrowBtn.setAttributedTitle(completeText, for: .normal)
    }
    
    private func layout() {
        
        let backImgHeights: [CGFloat] = [273, 297]
       
        ui.genericlLayout(object: emptySpaceBtn,
                          parentView: self,
                          topC: 0,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
           let dummyBtn = UIButton()
        ui.genericlLayout(object: dummyBtn,
                          parentView: self,
                          width: 310,
                          height: backImgHeights[popType.rawValue],
                          topC: hRatio(cH:174),
                          centerH: 0)

        ui.genericlLayout(object: mainBackImgVw,
                          parentView: self,
                          width: 310,
                          height: backImgHeights[popType.rawValue],
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
        
        let bottomAnchors: [CGFloat] = [44, 75]
        
        ui.genericlLayout(object: upgradeBtn,
                          parentView: self,
                          width: 242,
                          height: 40,
                          centerH: 0,
                          bottomToO: mainBackImgVw.bottomAnchor,
                          bottomCG: bottomAnchors[popType.rawValue])
        
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
                          width:    27,
                          height:   22,
                          topC:     86,
                          centerH:   0)
        
        ui.genericlLayout(object: previousStateImgVw,
                          parentView: mainBackImgVw,
                          width:  110,
                          height: 110,
                          centerVtoO: arrowImgVw.centerYAnchor,
                          trailingToO: arrowImgVw.leadingAnchor,
                          trailingCG: 10)
        
        ui.genericlLayout(object: nextStateImgVw,
                          parentView: mainBackImgVw,
                          width:  110,
                          height: 110,
                          centerVtoO: arrowImgVw.centerYAnchor,
                          leadingToO: arrowImgVw.trailingAnchor,
                          leadingCG: 10)
        
        let horizontalStack = UIStackView(arrangedSubviews: imgVwStates)
        horizontalStack.alignment = .center
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalCentering
        horizontalStack.spacing = 6
        let stackBottomAnchors: [CGFloat] = [103, 134]
        
        ui.genericlLayout(object: horizontalStack,
                          parentView: mainBackImgVw,
                          bottomC: stackBottomAnchors[popType.rawValue],
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
        
        let upgradeBtnShadowView = UIView()
        upgradeBtnShadowView.layer.backgroundColor = UIColor(rgb: 0xB0B581, alpha: 0.3).cgColor
        upgradeBtnShadowView.layer.cornerRadius = 15
        upgradeBtnShadowView.layer.masksToBounds = true
   
        switch popType {
        case .buildPopType: break
        case .notEnoughMoney:
            
            upgradeBtn.setImage(UIImage(named: "upgradeBtnUnActive"), for: .normal)
            priceLbl.textColor = .white.withAlphaComponent(0.6)
            
            upgradeBtn.layer.cornerRadius = 15
            upgradeBtn.layer.masksToBounds = true
            upgradeBtn.isUserInteractionEnabled = false
        
          
            
//            ui.genericlLayout(object: upgradeBtnShadowView,
//                              parentView: upgradeBtn,
//                              topC: 0,
//                              bottomC: 0,
//                              leadingC: 0,
//                              trailingC: 0)

            ui.genericlLayout(object: arrowBtn,
                              parentView: self,
                              height: 30,
                              bottomToO: mainBackImgVw.bottomAnchor,
                              bottomCG: 34.5,
                              leadingToO: mainBackImgVw.leadingAnchor,
                              leadingCG: 30,
                              trailingToO: mainBackImgVw.trailingAnchor,
                              trailingCG: 25)
        }
    }
    
    //----------------------------------------------
    // MARK: - MapsLevelPopUpStates
    //----------------------------------------------
    
    lazy var arcticLevelPopImgs: [UIImage] = {
        [image(img: .popStartState) ?? UIImage(),
         image(img: .pop1Ship) ?? UIImage(),
         image(img: .pop2Ship) ?? UIImage(),
         image(img: .pop3Ship) ?? UIImage(),
         image(img: .pop4Ship) ?? UIImage(),
         image(img: .pop5Ship) ?? UIImage(),
         
         image(img: .popStartState) ?? UIImage(),
         image(img: .pop1Fish) ?? UIImage(),
         image(img: .pop2Fish) ?? UIImage(),
         image(img: .pop3Fish) ?? UIImage(),
         image(img: .pop4Fish) ?? UIImage(),
         image(img: .pop5Fish) ?? UIImage(),
         
         image(img: .popStartState) ?? UIImage(),
         image(img: .pop1Iglu) ?? UIImage(),
         image(img: .pop2Iglu) ?? UIImage(),
         image(img: .pop3Iglu) ?? UIImage(),
         image(img: .pop4Iglu) ?? UIImage(),
         image(img: .pop5Iglu) ?? UIImage(),
         
         image(img: .popStartState) ?? UIImage(),
         image(img: .pop1Gold) ?? UIImage(),
         image(img: .pop2Gold) ?? UIImage(),
         image(img: .pop3Gold) ?? UIImage(),
         image(img: .pop4Gold) ?? UIImage(),
         image(img: .pop5Gold) ?? UIImage(),
         
         image(img: .popStartState) ?? UIImage(),
         image(img: .pop1Deers) ?? UIImage(),
         image(img: .pop2Deers) ?? UIImage(),
         image(img: .pop3Deers) ?? UIImage(),
         image(img: .pop4Deers) ?? UIImage(),
         image(img: .pop5Deers) ?? UIImage()
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
    
    lazy var franceLevelPopImgs: [UIImage] = {
        [
            RImage.eng_popStart() ?? UIImage(),
            RImage.fr_1luvrPop() ?? UIImage(),
            RImage.fr_2luvrPop() ?? UIImage(),
            RImage.fr_3luvrPop() ?? UIImage(),
            RImage.fr_4luvrPop() ?? UIImage(),
            RImage.fr_5luvrPop() ?? UIImage(),
            
            RImage.eng_popStart() ?? UIImage(),
            RImage.fr_1towerPop() ?? UIImage(),
            RImage.fr_2towerPop() ?? UIImage(),
            RImage.fr_3towerPop() ?? UIImage(),
            RImage.fr_4towerPop() ?? UIImage(),
            RImage.fr_5towerPop() ?? UIImage(),
            
            RImage.eng_popStart() ?? UIImage(),
            RImage.fr_1vineyardPop() ?? UIImage(),
            RImage.fr_2vineyardPop() ?? UIImage(),
            RImage.fr_3vineyardPop() ?? UIImage(),
            RImage.fr_4vineyardPop() ?? UIImage(),
            RImage.fr_5vineyardPop() ?? UIImage(),
            
            RImage.eng_popStart() ?? UIImage(),
            RImage.fr_1archPop() ?? UIImage(),
            RImage.fr_2archPop() ?? UIImage(),
            RImage.fr_3archPop() ?? UIImage(),
            RImage.fr_4archPop() ?? UIImage(),
            RImage.fr_5archPop() ?? UIImage(),
            
            RImage.eng_popStart() ?? UIImage(),
            RImage.fr_1fieldPop() ?? UIImage(),
            RImage.fr_2fieldPop() ?? UIImage(),
            RImage.fr_3fieldPop() ?? UIImage(),
            RImage.fr_4fieldPop() ?? UIImage(),
            RImage.fr_5fieldPop() ?? UIImage()
        ]
    }()
}

