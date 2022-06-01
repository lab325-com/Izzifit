//
//  GameView.swift
//  izzifit
//
//  Created by O l e h on 31.05.2022.
//

import UIKit

class GameView: UIView {
    
    // bar
    private var barBackVw = GameBarBackView(backImage: UIImage(named: "gameBarBack")!)
    // Basic view
    private var gameBackImgVw = UIImageView()
    var slotBackImgVw = UIImageView()
    private var slotHouseImgVw = UIImageView()
    private var uponGameBackImgVw = UIImageView()
    private var spinBtn = UIButton()
    private var titleLbl = UILabel()
    // hummer
    private var hummerBtn = UIButton()
    private var hummerCountLbl = UILabel()
    // logo
    private var logoImgVw = UIImageView()
    //startSpinLbl
    private var startSpinLbl = UILabel()
    
    //resultStack
    private var resultStackView: UIStackView!
    private var awardsVerticalStackView: UIStackView!
    
    private var awardImgVw = UIImageView()
    private var awardTitleLbl = UILabel()
    private var awardCountLbl = UILabel()
    
    // Progress Img UI
    private var progressImgVw = UIImageView()
    private let progressImg = UIImage(named: "progressActive")
    
    
    // MARK: - init params
    private var title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func draw(_ rect: CGRect) {
        setUI()
        layout()
    }
    
    private func setUI() {
        gameBackImgVw.image = image(img: .gameBackTwo)
        gameBackImgVw.contentMode = .scaleAspectFill
        
        slotBackImgVw.image = image(img: .slotBack)
        slotBackImgVw.contentMode = .scaleAspectFill
        
        slotHouseImgVw.image = image(img: .slotHouse)
        slotHouseImgVw.contentMode = .scaleAspectFit
        
        uponGameBackImgVw.image = image(img: .gameBackOne)
        uponGameBackImgVw.contentMode = .top
        
        spinBtn.setImage(image(img: .spinBtnNormal), for: .normal)
        spinBtn.setImage(image(img: .spinBtnSelected), for: .selected)
        
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
                    labelText: title,
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: h / 40.6,
                    fontName: "Inter-BoldItalic")
        
        // hummers
        hummerBtn.setImage(image(img: .freeHummer), for: .normal)
        hummerBtn.isUserInteractionEnabled = false
        ui.setLabel(label: hummerCountLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: h / 60.75,
                    fontName: "Inter-BoldItalic")
        hummerBtn.isHidden = true
        hummerCountLbl.isHidden = true
        
        // logo
        logoImgVw.image = image(img: .start_logo_ic)
        
        //startSpinLbl
        ui.setLabel(label: startSpinLbl,
                    labelText: "START!",
                    textColor: clr(color: .clrStartSpinLbl),
                    textAlignment: .center,
                    fontSize: h/62.46,
                    fontName: "Inter-Black")
        
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
                          width: h*0.459,
                          height: h*0.498,
                          topC: h/4.51,
                          centerH: 0)
        
        ui.genericlLayout(object: uponGameBackImgVw,
                          parentView: gameBackImgVw,
                          height: h*0.42,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.genericlLayout(object: spinBtn,
                          parentView: self,
                          width: h*0.288,
                          height: h*0.088,
                          centerH: 0,
                          topToO: slotHouseImgVw.bottomAnchor,
                          topCG: 17)
        
        ui.genericlLayout(object: barBackVw,
                          parentView: gameBackImgVw,
                          height: h / 9.2,
                          topC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.genericlLayout(object: progressImgVw,
                          parentView: self,
                          width: h/4.77,
                          height: h/48.6,
                          bottomToO: slotHouseImgVw.bottomAnchor,
                          bottomCG: h/39,
                          trailingToO: slotHouseImgVw.trailingAnchor,
                          trailingCG: h/8.54)
       
        ui.genericlLayout(object: titleLbl,
                          parentView: slotHouseImgVw,
                          topC: h/7.66,
                          centerH: h/232)
        
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
                          topC: h/16.9,
                          centerH: w/46.8)
        
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
                          topC: h/20.8,
                          centerH: w/46.8)
        resultStackView.isHidden = true
    }
    
    func showProgress() {
    
        var spinsRemainder = CGFloat(KeychainService.standard.me?.energy ?? 0.0)
        switch spinsRemainder {
        case let x where x > 100.0: spinsRemainder = 100.0
        default: break
        }
        let hiddenPart = 100.0 - spinsRemainder
    
        progressImgVw.hideImage(hiddenPart: hiddenPart,
                                img: progressImg ?? UIImage())
    }
}
