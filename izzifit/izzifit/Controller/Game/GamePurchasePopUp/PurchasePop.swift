//
//  PurchasePop.swift
//  izzifit
//
//  Created by O l e h on 08.06.2022.
//

import UIKit

enum PurchasePopType: Int {
    case onePurchase, twoPurchases, threePurchases
}

enum PurchaseType: String {
    case coins = "COINS"
    case spins = "SPINS"
}

class PurchaseStack: UIStackView {
    
    private var verticalStack: UIStackView!
    private var imgVw = UIImageView()
    private var typeLbl = UILabel()
    private var countLbl = UILabel()
    
    private var purchaseType: PurchaseType
    private var count: Int
    
    init(purchaseType: PurchaseType,
         count: Int) {
        self.purchaseType = purchaseType
        self.count = count
        super.init(frame: .zero)
        setUI()
        layout()
    }
    
    private func setUI() {
        
        imgVw.image = currentImage()
        ui.setLabel(label: countLbl,
                    labelText: "\(count)",
                    textColor: clr(color: .clrAwardTitleLbl),
                    textAlignment: .left,
                    fontSize: 20,
                    fontName: "Inter-BoldItalic")
        
        ui.setLabel(label: typeLbl,
                    labelText: "  \(purchaseType.rawValue)",
                    textColor: clr(color: .clrAwardTitleLbl),
                    textAlignment: .left,
                    fontSize: 8,
                    fontName: "Inter-BoldItalic")
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            imgVw.widthAnchor.constraint(equalToConstant: 36),
            imgVw.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        verticalStack = UIStackView(arrangedSubviews: [countLbl, typeLbl])
        verticalStack.axis = .vertical
        verticalStack.spacing = 2
        
        addArrangedSubview(imgVw)
        addArrangedSubview(verticalStack)
        alignment = .center
        axis = .horizontal
        distribution = .equalCentering
        spacing = 12
    }
    
    private func currentImage() -> UIImage {
        switch purchaseType {
        case .coins:
            switch count {
            case 10000: return image(img: .purchaseCoin1) ?? UIImage()
            case 25000: return image(img: .purchaseCoin2) ?? UIImage()
            case 50000: return image(img: .purchaseCoin3) ?? UIImage()
            default: return UIImage()
            }
        case .spins:
            switch count {
            case 100: return image(img: .purchaseLightning1) ?? UIImage()
            case 250: return image(img: .purchaseLightning2) ?? UIImage()
            case 500: return image(img: .purchaseLightning3) ?? UIImage()
            default: return UIImage()
            }
        }
    }
    
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

class PurchasePop: UIView {
    
    private let mainBackImgVw = UIImageView()
    private let closeBtn = UIButton()
    private let titleLbl = UILabel()
    private let mainLbl = UILabel()
    
    
    private var popType: PurchasePopType
    private var prices: [Double]
    private var purchaseTypes: [PurchaseType]
    private var counts: [Int]
    
    private var buyBtns = [BuyBtn]()
    private var purchaseStacks = [PurchaseStack]()
    
    private let downLbl = UILabel()
    private let arrowBtn = UIButton()
    
    private var purchases: [Purchase]
    private var title: String
    
    init(title: String,
         purchases: [Purchase]) {
        self.title = title
        self.purchases = purchases
        self.popType = PurchasePopType(rawValue: purchases.count-1) ?? .onePurchase
        self.prices = purchases.map({$0.price})
        self.purchaseTypes = purchases.map({$0.type})
        self.counts = purchases.map({$0.count})
        super.init(frame: .zero)
        buyBtns = makeButtons(price: prices)
        purchaseStacks = makePurchaseStacks(purchases: purchaseTypes,
                                            counts: counts)
        setUI()
        layout()
        // функция которая принимает количество Purchase и на основе этого отдает массив кнопок и массив стэков
    }
    
    func makeButtons(price: [Double]) -> [BuyBtn] {
        var buttons = [BuyBtn]()
        for price in price {
            let btn = BuyBtn()
            buttons.append(btn)
        }
        return buttons
    }
    
    func makePurchaseStacks(purchases: [PurchaseType], counts: [Int]) -> [PurchaseStack] {
        var stacks = [PurchaseStack]()
        for (index,purchase) in purchases.enumerated() {
            let stack = PurchaseStack(purchaseType: purchase,
                                      count: counts[index])
            stacks.append(stack)
        }
        return stacks
    }
    
    
    private func setUI() {
        
        backgroundColor = UIColor(rgb: 0x3F3E56,alpha: 0.3)
        
        let backImgs = [image(img: .onePurchaseBack),
                        image(img: .twoPurchaseBack),
                        image(img: .threePurchaseBack)]
        
        mainBackImgVw.image = backImgs[popType.rawValue]
        
        ui.setLabel(label: titleLbl,
                    labelText: "\(title) shop",
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
        
        closeBtn.setImage(image(img: .backBtn), for: .normal)
        
        var downLblText: String
        
        switch purchaseTypes.first! {
        case .coins:
            downLblText = "Or spin"
        case .spins:
            downLblText = "Or make some fitness"
        }
        
        
        ui.setLabel(label: downLbl,
                    labelText: downLblText,
                    textColor: UIColor(rgb: 0x6A534C),
                    textAlignment: .left,
                    fontSize: 15,
                    fontName: "Inter-Medium")
        
        arrowBtn.setImage(image(img: .yellowPointer), for: .normal)
    }
    
    private func layout() {
        
        let backImgHeights: [CGFloat] = [217, 273, 337]
        
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
        
        ui.genericlLayout(object: mainLbl,
                          parentView: mainBackImgVw,
                          topC: 58,
                          leadingC: 66)
        
        ui.genericlLayout(object: downLbl,
                          parentView: mainBackImgVw,
                          bottomC: 42.5,
                          centerH: -12)
        
        ui.genericlLayout(object: arrowBtn,
                          parentView: self,
                          width: 18,
                          height: 14,
                          centerVtoO: downLbl.centerYAnchor,
                          leadingToO: downLbl.trailingAnchor,
                          leadingCG: 9)
        
        let stackVerticalStride = 57
        for (index,stack) in purchaseStacks.enumerated() {
            
            ui.genericlLayout(object: stack,
                              parentView: mainBackImgVw,
                              topC: 101 + CGFloat(stackVerticalStride * index),
                              leadingC: 25)
            
            if index > 0 {
                // dash grey line
                
                let lineLayer = CAShapeLayer()
                lineLayer.lineWidth = 1
                lineLayer.lineDashPattern = [4, 4]
                lineLayer.strokeColor = UIColor(named: Clrs.clrDashLinePopUp.rawValue)?.cgColor
                let path = CGMutablePath()
                
                path.addLines(between: [CGPoint(x: 20 , y: 147.5 + CGFloat(stackVerticalStride * (index - 1))),
                                        CGPoint(x: 278, y: 147.5 + CGFloat(stackVerticalStride * (index - 1)))])
                lineLayer.path = path
                mainBackImgVw.layer.addSublayer(lineLayer)
            }
        }
        
        for (index, btn) in buyBtns.enumerated() {
            ui.genericlLayout(object: btn,
                              parentView: self,
                              width: 100,
                              height: 32,
                              centerVtoO: purchaseStacks[index].centerYAnchor,
                              trailingToO: mainBackImgVw.trailingAnchor,
                              trailingCG: 37)
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
