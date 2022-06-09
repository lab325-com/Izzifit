//
//  GamePurchasePopView.swift
//  izzifit
//
//  Created by O l e h on 06.06.2022.
//

import UIKit

class BuyBtn: UIButton {

    init() {
        super.init(frame: .zero)
        setBackgroundImage(image(img: .greenBuyBtn), for: .normal)
        setTitle("", for: .normal)
        titleLabel?.font = UIFont(name: "Inter-ExtraBold" , size: 13)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

protocol GamePurchasePopProtocol: AnyObject {
    func gamePurchasePopClose(view: GamePurchasePopView)
    func gamePurchasePopBuyFirst(view: GamePurchasePopView)
    func gamePurchasePopBuySecond(view: GamePurchasePopView)
}

class GamePurchasePopView: UIView {

    private var title: String
    private let mainBackImgVw = UIImageView()
    private let closeBtn = UIButton()
    private let titleLbl = UILabel()
    private let mainLbl = UILabel()
    
    private let buyFirstBtn: BuyBtn
    private let buySecondBtn: BuyBtn
    
    private let someFitnessLbl = UILabel()
    private let arrowBtn = UIButton()
    
    //firstOfferStack
    private var firstOfferStack: UIStackView!
    private var firstVerticalStack: UIStackView!
    
    private var offerImgVw = UIImageView()
    private var offerTitleLbl = UILabel()
    private var offerCountLbl = UILabel()
    
    //secondOfferStack
    private var secondOfferStack: UIStackView!
    private var secondVerticalStack: UIStackView!
    
    private var offer2ImgVw = UIImageView()
    private var offer2TitleLbl = UILabel()
    private var offer2CountLbl = UILabel()
    
    private var dashLineLayer: CAShapeLayer = {
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [4, 4]
        lineLayer.strokeColor = UIColor(named: Clrs.clrDashLinePopUp.rawValue)?.cgColor
        return lineLayer
    }()
    
    weak var delegate: GamePurchasePopProtocol?
    
    private let activityFirst = UIActivityIndicatorView(style: .medium)
    private let activitySecond = UIActivityIndicatorView(style: .medium)
    
    init(title: String,
         delegate: GamePurchasePopProtocol) {
        self.title = title
        buyFirstBtn = BuyBtn()
        buySecondBtn = BuyBtn()
        self.delegate = delegate
        super.init(frame: .zero)
        setUI()
        layout()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUI() {
        backgroundColor = UIColor(rgb: 0x3F3E56,alpha: 0.3)
        mainBackImgVw.image = image(img: .buildPopUpBack)
        
        activityFirst.color = UIColor.white
        activitySecond.color = UIColor.white
        
        activityFirst.startAnimating()
        activitySecond.startAnimating()
        activityFirst.hidesWhenStopped = true
        activitySecond.hidesWhenStopped = true
        
        ui.setLabel(label: titleLbl,
                    labelText: title,
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: 16,
                    fontName: "Inter-BoldItalic")
        
        ui.setLabel(label: mainLbl,
                    labelText: "Need some more?",
                    textColor: UIColor(rgb: 0x6A534C),
                    textAlignment: .center,
                    fontSize: 20,
                    fontName: "Inter-BoldItalic")
        
        ui.setLabel(label: someFitnessLbl,
                    labelText: "Or make some fitness",
                    textColor: UIColor(rgb: 0x6A534C),
                    textAlignment: .left,
                    fontSize: 15,
                    fontName: "Inter-Medium")
        
        arrowBtn.setImage(image(img: .yellowPointer), for: .normal)
        closeBtn.setImage(image(img: .backBtn), for: .normal)
        closeBtn.addTarget(self, action: #selector(acionClose), for: .touchUpInside)
        
        buyFirstBtn.addTarget(self, action: #selector(acionBuyFirst), for: .touchUpInside)
        buySecondBtn.addTarget(self, action: #selector(acionBuySecond), for: .touchUpInside)
        
        // Purchase
        offerImgVw.image = SlotImgs.lightning
        offer2ImgVw.image = image(img: .doubleLightning)
        
        ui.setLabel(label: offerTitleLbl,
                    labelText: " SPINS",
                    textColor: clr(color: .clrAwardTitleLbl),
                    textAlignment: .left,
                    fontSize: 8,
                    fontName: "Inter-BoldItalic")
        
        ui.setLabel(label: offerCountLbl,
                    labelText: "100",
                    textColor: clr(color: .clrAwardTitleLbl),
                    textAlignment: .left,
                    fontSize: 20,
                    fontName: "Inter-BoldItalic")
        
        ui.setLabel(label: offer2TitleLbl,
                    labelText: " SPINS",
                    textColor: clr(color: .clrAwardTitleLbl),
                    textAlignment: .left,
                    fontSize: 8,
                    fontName: "Inter-BoldItalic")
        
        ui.setLabel(label: offer2CountLbl,
                    labelText: "500",
                    textColor: clr(color: .clrAwardTitleLbl),
                    textAlignment: .left,
                    fontSize: 20,
                    fontName: "Inter-BoldItalic")
    }
    
    private func layout() {
        
        ui.genericlLayout(object: mainBackImgVw,
                          parentView: self,
                          width: 310,
                          height: 267,
                          centerV: 0,
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
    
        ui.genericlLayout(object: mainLbl,
                          parentView: mainBackImgVw,
                          topC: 58,
                          leadingC: 66)
        
        ui.genericlLayout(object: buyFirstBtn,
                          parentView: self,
                          width: 100,
                          height: 32,
                          topToO: mainBackImgVw.topAnchor,
                          topCG: 103,
                          trailingToO: mainBackImgVw.trailingAnchor,
                          trailingCG: 37)
        
        ui.genericlLayout(object: buySecondBtn,
                          parentView: self,
                          width: 100,
                          height: 32,
                          topToO: buyFirstBtn.bottomAnchor,
                          topCG: 25,
                          trailingToO: mainBackImgVw.trailingAnchor,
                          trailingCG: 37)
        
        ui.genericlLayout(object: activityFirst,
                          parentView: buyFirstBtn,
                          centerV: 0,
                          centerH: 0)
        
        ui.genericlLayout(object: activitySecond,
                          parentView: buySecondBtn,
                          centerV: 0,
                          centerH: 0)
        
        ui.genericlLayout(object: someFitnessLbl,
                          parentView: mainBackImgVw,
                          bottomC: 37.5,
                          leadingC: 65)
        
        ui.genericlLayout(object: arrowBtn,
                          parentView: self,
                          width: 20,
                          height: 16,
                          centerVtoO: someFitnessLbl.centerYAnchor,
                          leadingToO: someFitnessLbl.trailingAnchor,
                          leadingCG: 9)
        
        // dash grey line
        let path = CGMutablePath()
        
        path.addLines(between: [CGPoint(x: 20 , y: 147.5),
                                CGPoint(x: 278, y: 147.5)])
        dashLineLayer.path = path
        mainBackImgVw.layer.addSublayer(dashLineLayer)
        
        //firstOfferStack
        NSLayoutConstraint.activate([
            offerImgVw.widthAnchor.constraint(equalToConstant: 21.4),
            offerImgVw.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        firstVerticalStack = UIStackView(arrangedSubviews: [offerCountLbl, offerTitleLbl])
        firstVerticalStack.axis = .vertical
        firstVerticalStack.spacing = 2
        
        firstOfferStack = UIStackView(arrangedSubviews: [offerImgVw, firstVerticalStack])
        firstOfferStack.alignment = .center
        firstOfferStack.axis = .horizontal
        firstOfferStack.distribution = .equalCentering
        firstOfferStack.spacing = 14
        
        ui.genericlLayout(object: firstOfferStack,
                          parentView: self,
                          centerVtoO: buyFirstBtn.centerYAnchor,
                          leadingToO: mainBackImgVw.leadingAnchor,
                          leadingCG: 25)
        
        // SecondOfferStack
        NSLayoutConstraint.activate([
            offer2ImgVw.widthAnchor.constraint(equalToConstant: 53),
            offer2ImgVw.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        secondVerticalStack = UIStackView(arrangedSubviews: [offer2CountLbl, offer2TitleLbl])
        secondVerticalStack.axis = .vertical
        secondVerticalStack.spacing = 2
        
        secondOfferStack = UIStackView(arrangedSubviews: [offer2ImgVw, secondVerticalStack])
        secondOfferStack.alignment = .center
        secondOfferStack.axis = .horizontal
        secondOfferStack.distribution = .equalCentering
        secondOfferStack.spacing = 0
        
        ui.genericlLayout(object: secondOfferStack,
                          parentView: self,
                          centerVtoO: buySecondBtn.centerYAnchor,
                          centerHtoO: firstOfferStack.centerXAnchor)
    }
    
    //----------------------------------------------
    // MARK: - Global function
    //----------------------------------------------
    
    func setPrice(first: String, second: String) {
        buyFirstBtn.setTitle("BUY   \(first)", for: .normal)
        buySecondBtn.setTitle("BUY   \(second)", for: .normal)
        activityFirst.isHidden = true
        activitySecond.isHidden = true
    }
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @objc func acionClose(sender: UIButton!) {
        delegate?.gamePurchasePopClose(view: self)
    }
    
    @objc func acionBuyFirst(sender: UIButton!) {
        delegate?.gamePurchasePopBuyFirst(view: self)
    }
    
    @objc func acionBuySecond(sender: UIButton!) {
        delegate?.gamePurchasePopBuySecond(view: self)
    }
    
}



