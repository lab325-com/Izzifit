//
//  MapView.swift
//  izzifit
//
//  Created by mob325 on 03.06.2022.
//

import UIKit

class MapView: UIView {

    var barBackVw = GameBarBackView()
    
    private let backImgVw = UIImageView()
    private let viewUponScrollView = UIView()
    let scrollView = UIScrollView()
    
    // Path
    private let path1_btn = UIButton()
    private var path2_btn = UIButton()
    private var path3_btn = UIButton()
    private var path4_btn = UIButton()
    private var path5_btn = UIButton()
    private var path6_btn = UIButton()
    private var path7_btn = UIButton()
    private var path8_btn = UIButton()
    
    // MapPoints
    private let arctic_btn =    UIButton()
    private var england_btn =   UIButton()
    private var france_btn =    UIButton()
    
    lazy var sizeRemainder: CGFloat = {(428.0 - 375.0) / 2}()
    
    private lazy var mapBtns: [UIButton] = {
        [arctic_btn,
         path1_btn,
         england_btn,
         path2_btn,
         france_btn,
         path3_btn,
         path4_btn,
         path5_btn,
         path6_btn,
         path7_btn,
         path8_btn]
    }()
    private var actualMapPoint: Maps
    
    init(mapPoint: Maps) {
        actualMapPoint = mapPoint
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func draw(_ rect: CGRect) {
       setUI()
       layout()
    }
    
    func redrawMap(mapPoint: Maps) {
        let x = (428 - UIScreen.main.bounds.size.width) / 2
        for btn in mapBtns {
            btn.isUserInteractionEnabled = false
            btn.isSelected = false
            btn.setNeedsDisplay()
        }
        
        for (index, btn) in mapBtns.enumerated() {
            guard index <= mapPoint.rawValue || index == (mapPoint.rawValue + 1) else { continue }
            btn.isSelected = true
            btn.setNeedsDisplay()
        }
        
        switch mapPoint {
        case .arctic:
            scrollView.setContentOffset(CGPoint(x: x, y: 2625 - UIScreen.main.bounds.height), animated: true)
        case .england:
            scrollView.setContentOffset(CGPoint(x: x, y: 2625 - (UIScreen.main.bounds.height + 248)),animated: true)
        case .france:
            scrollView.setContentOffset(CGPoint(x: x, y: 2625 - (UIScreen.main.bounds.height + 496)),animated: true)
        }
    }

    private func setUI() {
        
        backImgVw.image = image(img: .mapViewBack)
        
        for btn in mapBtns {
            btn.isUserInteractionEnabled = false
        }
        
        for (index, btn) in mapBtns.enumerated() {
            guard index <= actualMapPoint.rawValue || index == (actualMapPoint.rawValue + 1) else { continue }
            btn.isSelected = true
        }
        
        path1_btn.setImage(image(img: .map_1pathPass), for: .normal)
        path1_btn.setImage(image(img: .map_1pathAct), for: .selected)
        
        path2_btn.setImage(image(img: .map_2pathPass), for: .normal)
        path2_btn.setImage(image(img: .map_2pathAct), for: .selected)
        
        path3_btn.setImage(image(img: .map_3pathPass), for: .normal)
        path3_btn.setImage(image(img: .map_3pathAct), for: .selected)
        
        path4_btn.setImage(image(img: .map_4pathPass), for: .normal)
        path4_btn.setImage(image(img: .map_4pathAct), for: .selected)
        
        path5_btn.setImage(image(img: .map_1pathPass), for: .normal)
        path5_btn.setImage(image(img: .map_1pathAct), for: .selected)
        
        path6_btn.setImage(image(img: .map_2pathPass), for: .normal)
        path6_btn.setImage(image(img: .map_2pathAct), for: .selected)
        
        path7_btn.setImage(image(img: .map_3pathPass), for: .normal)
        path7_btn.setImage(image(img: .map_3pathAct), for: .selected)
        
        path8_btn.setImage(image(img: .map_4pathPass), for: .normal)
        path8_btn.setImage(image(img: .map_4pathAct), for: .selected)
        
        // Map Points
        arctic_btn.setImage(image(img: .mapPoint_Arctic_pass), for: .normal)
        arctic_btn.setImage(image(img: .mapPoint_Arctic_act), for: .selected)
        
        england_btn.setImage(image(img: .mapPoint_England_pass), for: .normal)
        england_btn.setImage(image(img: .mapPoint_England_act), for: .selected)
        
        france_btn.setImage(image(img: .mapPoint_France_pass), for: .normal)
        france_btn.setImage(image(img: .mapPoint_France_act), for: .selected)
    }
    
    private func layout() {
        
        ui.genericlLayout(object: backImgVw,
                          parentView: self,
                          topC: 0,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.setAndLayScrollView(contentV: viewUponScrollView,
                               scrollV: scrollView,
                               parentView: self,
                               backColor: .clear,
                               showScrollIndicators: false,
                               bounces: false,
                               width: 428,
                               height: 2625)
        
        ui.genericlLayout(object: barBackVw,
                               parentView: self,
                               height: h / 9.2,
                               topC: 0,
                               leadingC: 0,
                               trailingC: 0)
        
          //pathParts
        ui.genericlLayout(object: path1_btn,
                          parentView: viewUponScrollView,
                          width: 102.8,
                          height: 262.47,
                          bottomC: 269,
                          leadingC: w/3.205 + sizeRemainder)
        
        ui.genericlLayout(object: path2_btn,
                          parentView: viewUponScrollView,
                          width: 101.2,
                          height: 286.53,
                          leadingC: w/1.7060 + sizeRemainder,
                          bottomToO: path1_btn.topAnchor,
                          bottomCG: -6)

        ui.genericlLayout(object: path3_btn,
                          parentView: viewUponScrollView,
                          width: 145.73,
                          height: 287.38,
                          leadingC: w/5.351 + sizeRemainder,
                          bottomToO: path2_btn.topAnchor,
                          bottomCG: -6)

        ui.genericlLayout(object: path4_btn,
                          parentView: viewUponScrollView,
                          width: 121.5,
                          height: 262.58,
                          leadingC: w/1.915 + sizeRemainder,
                          bottomToO: path3_btn.topAnchor,
                          bottomCG: -13.4)
        
        ui.genericlLayout(object: path5_btn,
                          parentView: viewUponScrollView,
                          width: 102.8,
                          height: 262.47,
                          leadingC: w/3.205 + sizeRemainder,
                          bottomToO: path4_btn.topAnchor,
                          bottomCG: 0)
        
        ui.genericlLayout(object: path6_btn,
                          parentView: viewUponScrollView,
                          width: 101.2,
                          height: 286.53,
                          leadingC: w/1.7060 + sizeRemainder,
                          bottomToO: path5_btn.topAnchor,
                          bottomCG: -6)

        ui.genericlLayout(object: path7_btn,
                          parentView: viewUponScrollView,
                          width: 145.73,
                          height: 287.38,
                          leadingC: w/5.351 + sizeRemainder,
                          bottomToO: path6_btn.topAnchor,
                          bottomCG: -6)

        ui.genericlLayout(object: path8_btn,
                          parentView: viewUponScrollView,
                          width: 121.5,
                          height: 262.58,
                          leadingC: w/1.915 + sizeRemainder,
                          bottomToO: path7_btn.topAnchor,
                          bottomCG: -13.4)
        
        //mapPoints
        
        ui.genericlLayout(object: arctic_btn,
                          parentView: viewUponScrollView,
                          width: 246,
                          height: 209,
                          bottomC: 185,
                          leadingC: w/8.3 + sizeRemainder)
        
        ui.genericlLayout(object: england_btn,
                          parentView: viewUponScrollView,
                          width: 228,
                          height: 218,
                          bottomC: 464,
                          leadingC: w/4.6 + sizeRemainder)
        
        ui.genericlLayout(object: france_btn,
                          parentView: viewUponScrollView,
                          width: 216,
                          height: 199,
                          bottomC: 752,
                          leadingC: w/6.6 + sizeRemainder)
        
        var gradientView = UIView()
        gradientView = UIView(frame: CGRect(x: 0, y: 0, width: w, height: h/3.88))
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        
        gradient.colors = [UIColor(rgb: 0xF6DEB1,alpha: 0).cgColor,
                           UIColor(rgb: 0xDAC396,alpha: 1.0).cgColor,
                           UIColor(rgb: 0xDAC396,alpha: 1.0).cgColor]
    
        gradientView.layer.insertSublayer(gradient, at: 0)
        ui.genericlLayout(object: gradientView,
                               parentView: self,
                               height: h/3.88,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
    }
}
