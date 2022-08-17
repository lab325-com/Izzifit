//
//  FranceGameView.swift
//  izzifit
//
//  Created by O l e h on 26.07.2022.
//

import UIKit

class FranceGameView: UIView, SpinGameViewProtocol {
    
    var animationImgVw: UIImageView = UIImageView()
    var hummerBtn: UIButton = UIButton()
    var hummerCountLbl: UILabel = UILabel()
    var spinBtn: UIButton = UIButton()
    var slotBackImgVw: UIImageView = UIImageView()
    var resultStackView: UIStackView!
    // bar
    var barBackVw: GameBarBackView = GameBarBackView()
    // Basic view
    private var gameBackImgVw = UIImageView()
    private var slotHouseImgVw = UIImageView()
    private var uponGameBackImgVw = UIImageView()
    
    private var bumpImgVw = UIImageView()
    
    private var titleLbl = UILabel()
    // logo
    private var logoImgVw = UIImageView()
    //startSpinLbl
    var startSpinLbl = UILabel()
    private var awardsVerticalStackView: UIStackView!
    
    var awardImgVw = UIImageView()
    var awardTitleLbl = UILabel()
    var awardCountLbl = UILabel()
    // Progress Img UI
    var progressImgVw: UIImageView = UIImageView()
    
    var greenCounterLbl: UILabel = UILabel()
    private let greenCounterImgVw = UIImageView()

    override func draw(_ rect: CGRect) {
        setUI()
        layout()
        showAutospin()
    }
    
    private func setUI() {
        gameBackImgVw.image = image(img: .france_gameBack)//
        gameBackImgVw.contentMode = .scaleAspectFill
        
        slotBackImgVw.image = image(img: .france_slotBack)
        slotBackImgVw.contentMode = .scaleAspectFill
        
        slotHouseImgVw.image = image(img: .france_slotHouse)//
        slotHouseImgVw.contentMode = .scaleAspectFit
        
        uponGameBackImgVw.image = image(img: .france_uponBack)
        uponGameBackImgVw.contentMode = .scaleAspectFill
        
        greenCounterImgVw.image = RImage.greenCounterImg() ?? UIImage()
        greenCounterImgVw.contentMode = .scaleAspectFill
        
        spinBtn.setImage(image(img: .spinBtnNormal), for: .normal)
        spinBtn.setImage(image(img: .spinBtnSelected), for: .highlighted)
        
        bumpImgVw.image = image(img: .france_bump)
        bumpImgVw.contentMode = .scaleAspectFit
        
        //MARK: - barBackVw
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
        
        if let name = KeychainService.standard.me?.name {
            barBackVw.nameLbl.text = name
        } else {
            barBackVw.nameLbl.isHidden = true
        }
        
        barBackVw.avatarImgVw.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""),
                                          placeholder: RImage.placeholder_food_ic(),
                                          options: [.transition(.fade(0.25))])
        showProgress()
        
        // titleLbl
        ui.setLabel(label: titleLbl,
                    labelText: "France",
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: h / 40.6,
                    fontName: "Inter-BoldItalic")
        
        titleLbl.layer.shadowColor =    UIColor(rgb: 0x462D16, alpha: 0.5).cgColor
        titleLbl.layer.shadowOpacity =  1.0
        titleLbl.layer.shadowRadius =   2.0
        titleLbl.layer.shadowOffset =   CGSize(width: -1.5, height: -1.5)

        // hummers
        hummerBtn.setImage(image(img: .france_freeHummer), for: .normal)
        hummerBtn.isUserInteractionEnabled = false
        
        ui.setLabel(label: hummerCountLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: h / 60.75,
                    fontName: "Inter-BoldItalic")

        // logo
        logoImgVw.image = image(img: .start_logo_ic)
        
        //startSpinLbl
        ui.setLabel(label: startSpinLbl,
                    labelText: "START!",
                    textColor: clr(color: .clrStartSpinLbl),
                    textAlignment: .center,
                    fontSize: h/62.46,
                    fontName: "Inter-BoldItalic")
        
        awardImgVw.image = SlotImgs.moneyBag
        
        ui.setLabel(label: awardTitleLbl,
                    labelText: "  COINS!",
                    textColor: clr(color: .clrAwardTitleLbl),
                    textAlignment: .left,
                    fontSize: h/101.5,
                    fontName: "Inter-BoldItalic")
        
        ui.setLabel(label: awardCountLbl,
                    labelText: "10500",
                    textColor: clr(color: .clrAwardTitleLbl),
                    textAlignment: .left,
                    fontSize: h/46.6,
                    fontName: "Inter-BoldItalic")
        
        ui.setLabel(label: greenCounterLbl,
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: 16,
                    fontName: "Inter-Bold")
        }
    
    private func layout() {
        
        ui.genericlLayout(object: gameBackImgVw,
                          parentView: self,
                          topC: 0,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.genericlLayout(object: slotBackImgVw,
                          parentView: gameBackImgVw,
                          width: h/3.44,
                          height: h/4.34,
                          topC: h/2.51,
                          centerH: 0)
        
        ui.genericlLayout(object: slotHouseImgVw,
                          parentView: gameBackImgVw,
                          width: hRatio(cH:375),
                          height: hRatio(cH:478),
                          topC: hRatio(cH:104),
                          centerH: 0)
        
        ui.genericlLayout(object: spinBtn,
                          parentView: self,
                          width: hRatio(cH:234),
                          height: hRatio(cH:72),
                          centerH: 0,
                          topToO: slotHouseImgVw.bottomAnchor,
                          topCG: 17)
        
        ui.genericlLayout(object: bumpImgVw, parentView: spinBtn, width: hRatio(cH:256), height: hRatio(cH:52), topC: hRatio(cH:46), centerH: hRatio(cH:7))
        
        ui.genericlLayout(object: barBackVw,
                          parentView: gameBackImgVw,
                          height: h / 9.2,
                          topC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.genericlLayout(object: progressImgVw,
                          parentView: self,
                          width: h/4.84,
                          height: h/51.38,
                          bottomToO: slotHouseImgVw.bottomAnchor,
                          bottomCG: h/35.3,
                          trailingToO: slotHouseImgVw.trailingAnchor,
                          trailingCG: h/7.9)
        
        ui.genericlLayout(object: greenCounterImgVw,
                          parentView: progressImgVw,
                          width: 72,
                          height: 24,
                          topC: -34,
                          centerH: 0)
        
        ui.genericlLayout(object: greenCounterLbl,
                          parentView: greenCounterImgVw,
                          centerV: 0,
                          centerH: 0)

        ui.genericlLayout(object: titleLbl,
                          parentView: slotHouseImgVw,
                          topC: hRatio(cH:184),
                          centerH: 0)
        
        ui.genericlLayout(object: hummerBtn,
                          parentView: self,
                          width: h/18.04,
                          height: h/18.04,
                          topC: h/7.66,
                          leadingC: w/14.42)
        
        ui.genericlLayout(object: hummerCountLbl,
                          parentView: hummerBtn,
                          bottomC: h/203,
                          trailingC: h/203)
        
        ui.genericlLayout(object: logoImgVw,
                          parentView: gameBackImgVw,
                          width: h/6.4,
                          height: h/14.36,
                          topC: h/7.31,
                          centerH: 3)
        
        ui.genericlLayout(object: startSpinLbl,
                          parentView: slotHouseImgVw,
                          topC: hRatio(cH:123),
                          centerH: 0)
        
        NSLayoutConstraint.activate([
            awardImgVw.widthAnchor.constraint(equalToConstant: h/30),
            awardImgVw.heightAnchor.constraint(equalToConstant: h/26.19)
        ])
        
        awardsVerticalStackView = UIStackView(arrangedSubviews: [awardTitleLbl, awardCountLbl])
        awardsVerticalStackView.axis = .vertical
        awardsVerticalStackView.spacing = -3
        
        resultStackView = UIStackView(arrangedSubviews: [awardImgVw, awardsVerticalStackView])
        resultStackView.alignment = .center
        resultStackView.axis = .horizontal
        resultStackView.distribution = .equalCentering
        resultStackView.spacing = 4
        
        ui.genericlLayout(object: resultStackView,
                          parentView: slotHouseImgVw,
                          topC: hRatio(cH:114),
                          centerH: w/92)
        
        resultStackView.isHidden = true
        
        ui.genericlLayout(object: uponGameBackImgVw,
                          parentView: gameBackImgVw,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0
        )
        
        ui.genericlLayout(object: animationImgVw,
                          parentView: spinBtn,
                          width: w,
                          height: h,
                          topToO: barBackVw.topAnchor,
                          topCG: 0,
                          leadingToO: barBackVw.leadingAnchor,
                          leadingCG: 0)
    }
}
