//
//  LevelPopUpView.swift
//  izzifit
//
//  Created by O l e h on 09.06.2022.
//

import UIKit

class LevelPopUpView: UIView {

    private let mainBackImgVw = UIImageView()
    private let closeBtn = UIButton()
    private let titleLbl = UILabel()
    private let upgradeBtn = UIButton()
    
    private var previousStateImgVw = UIImageView()
    private let arrowImgVw = UIImageView()
    private var nextStateImgVw = UIImageView()
    
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
    private var priceLbl = UILabel()
    
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
  
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setUI()
        layout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
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
    }
}
