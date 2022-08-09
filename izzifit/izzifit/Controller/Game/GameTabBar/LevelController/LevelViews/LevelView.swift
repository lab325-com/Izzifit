//
//  LevelView.swift
//  izzifit
//
//  Created by O l e h on 07.06.2022.
//

import UIKit
import Lottie
import SwiftUI

class LevelView: UIView {
    
    // перенести в mainTabBar
    var barBackVw = GameBarBackView()
    
    private let imgUponScroll = UIImageView()
    let scrollView = UIScrollView()
    
    var hummerBtn = UIButton()
    var hummerCountLbl = UILabel()
    var slideAnimationView = AnimationView(name: "point_anim")
    var levelCounterLbl = UILabel()
    
    lazy var stateBtns: [UIButton] = {
        var btns = [UIButton]()
        for i in 0...4 {
            let btn = UIButton()
            btn.tag = i
            btns.append(btn)
        }
        return btns
    }()
    
    var cgRects: [CGRect]
    
    init() {
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     self.cgRects = LevelView.arcCGRects
        case .england_map:  self.cgRects = LevelView.engCGRects
        case .france_map:   self.cgRects = LevelView.franceCGRects
        case .none:         self.cgRects = LevelView.arcCGRects
        }
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        setUI()
        layout()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUI() {
        
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     imgUponScroll.image = RImage.levelBack()
                            hummerBtn.setImage(image(img: .freeHummer), for: .normal)
        case .england_map:  imgUponScroll.image = image(img: .level_england_back)
                            hummerBtn.setImage(image(img: .england_freeHummer), for: .normal)
        case .france_map:   imgUponScroll.image = RImage.level_france_back()
                            hummerBtn.setImage(image(img: .france_freeHummer), for: .normal)
        case .none:         break
        }
        
        hummerBtn.isUserInteractionEnabled = false
        ui.setLabel(label: hummerCountLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: h / 60.75,
                    fontName: "Inter-BoldItalic")
        hummerBtn.isHidden = true
        hummerCountLbl.isHidden = true
        
        ui.setLabel(label: levelCounterLbl,
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: 16,
                    fontName: "Inter-Bold")
    }
    
    private func layout() {

        ui.setAndLayScrollView(contentV: imgUponScroll,
                               scrollV: scrollView,
                               parentView: self,
                               backColor: clr(color: .clrMainMapBack) ?? UIColor(),
                               showScrollIndicators: false,
                               bounces: false,
                               width: PreferencesManager.sharedManager.currentMapName == .france_map ? 484 : 428,
                               height: 926)

        ui.genericlLayout(object: barBackVw,
                          parentView: self,
                          height: h / 9.2,
                          topC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        slideAnimationView.contentMode = .scaleAspectFill
        slideAnimationView.loopMode = .loop
        ui.genericlLayout(object: slideAnimationView,
                          parentView: imgUponScroll,
                          width: 114,
                          height: 30,
                          topC: 455,
                          trailingC: 54)
        
        for (index, rect) in cgRects.enumerated() {
            
            ui.genericlLayout(object: stateBtns[index],
                              parentView: scrollView,
                              width:    rect.width,
                              height:   rect.height,
                              topC:     rect.minY,
                              leadingC: rect.minX)
        }
        
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
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.555
      
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      ui.genericlLayout(object: blurEffectView,
                        parentView: self,
                        width:  72,
                        height: 26,
                        topC: (h/9.2) + 18,
                        centerH: 0)
      
      blurEffectView.clipsToBounds = true
      blurEffectView.layer.cornerRadius = 13
        
        ui.genericlLayout(object: levelCounterLbl,
                          parentView: self,
                          width:  72,
                          height: 26,
                          topC: (h/9.2) + 18,
                          centerH: 0)
    }
    
    func onboardLevelFour() {
        slideAnimationView.removeFromSuperview()
        ui.genericlLayout(object: slideAnimationView,
                          parentView: imgUponScroll,
                          width: 150,
                          height: 46,
                          topC: 450,
                          trailingC: 63)
        layoutIfNeeded()
        slideAnimationView.play()
    }
    
    func drawStates(player: PlayerModel) {
        
        var imgs = [UIImage]()
        
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     imgs = arcticLevelImgs
        case .england_map:  imgs = englandLevelImgs
        case .france_map:   imgs = franceLevelImgs
        case .none: break
        }
        
        guard imgs.count == 30 else { return }
        
        switch player.firstState {
        case .start:   stateBtns[0].setImage(imgs[0],for: .normal)
        case .first:   stateBtns[0].setImage(imgs[1], for: .normal)
        case .second:  stateBtns[0].setImage(imgs[2],for: .normal)
        case .third:   stateBtns[0].setImage(imgs[3],for: .normal)
        case .fourth:  stateBtns[0].setImage(imgs[4], for: .normal)
        case .finish:  stateBtns[0].setImage(imgs[5],for: .normal)
        }
        
        switch player.secondState {
        case .start:  stateBtns[1].setImage(imgs[6], for: .normal)
        case .first:  stateBtns[1].setImage(imgs[7],for: .normal)
        case .second: stateBtns[1].setImage(imgs[8],for: .normal)
        case .third:  stateBtns[1].setImage(imgs[9],for: .normal)
        case .fourth: stateBtns[1].setImage(imgs[10],for: .normal)
        case .finish: stateBtns[1].setImage(imgs[11],for: .normal)
        }
        
        switch player.thirdState {
        case .start:  stateBtns[2].setImage(imgs[12],for: .normal)
        case .first:  stateBtns[2].setImage(imgs[13],for: .normal)
        case .second: stateBtns[2].setImage(imgs[14],for: .normal)
        case .third:  stateBtns[2].setImage(imgs[15], for: .normal)
        case .fourth: stateBtns[2].setImage(imgs[16],for: .normal)
        case .finish: stateBtns[2].setImage(imgs[17], for: .normal)
        }
        
        switch player.fourthState {
        case .start:  stateBtns[3].setImage(imgs[18],for: .normal)
        case .first:  stateBtns[3].setImage(imgs[19], for: .normal)
        case .second: stateBtns[3].setImage(imgs[20],for: .normal)
        case .third:  stateBtns[3].setImage(imgs[21],for: .normal)
        case .fourth: stateBtns[3].setImage(imgs[22],for: .normal)
        case .finish: stateBtns[3].setImage(imgs[23],for: .normal)
        }
        
        switch player.fifthState {
        case .start:  stateBtns[4].setImage(imgs[24], for: .normal)
        case .first:  stateBtns[4].setImage(imgs[25], for: .normal)
        case .second: stateBtns[4].setImage(imgs[26],for: .normal)
        case .third:  stateBtns[4].setImage(imgs[27], for: .normal)
        case .fourth: stateBtns[4].setImage(imgs[28],for: .normal)
        case .finish: stateBtns[4].setImage(imgs[29],for: .normal)
        }
    }
    
    //----------------------------------------------
    // MARK: - MapsLevelStates
    //----------------------------------------------
    
    lazy var arcticLevelImgs: [UIImage] = {
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
    
    lazy var englandLevelImgs: [UIImage] = {
        [image(img: .eng_shipStart) ?? UIImage(),
         image(img: .eng_shipFirst) ?? UIImage(),
         image(img: .eng_shipSecond) ?? UIImage(),
         image(img: .eng_shipThird) ?? UIImage(),
         image(img: .eng_shipFourth) ?? UIImage(),
         image(img: .eng_shipFinish) ?? UIImage(),
         
         image(img: .eng_bridgeStart) ?? UIImage(),
         image(img: .eng_bridgeFirst) ?? UIImage(),
         image(img: .eng_bridgeSecond) ?? UIImage(),
         image(img: .eng_bridgeThird) ?? UIImage(),
         image(img: .eng_bridgeFourth) ?? UIImage(),
         image(img: .eng_bridgeFinish) ?? UIImage(),
         
         image(img: .eng_phoneStart) ?? UIImage(),
         image(img: .eng_phoneFirst) ?? UIImage(),
         image(img: .eng_phoneSecond) ?? UIImage(),
         image(img: .eng_phoneThird) ?? UIImage(),
         image(img: .eng_phoneFourth) ?? UIImage(),
         image(img: .eng_phoneFinish) ?? UIImage(),
         
         image(img: .eng_bigBenStart) ?? UIImage(),
         image(img: .eng_bigBenFirst) ?? UIImage(),
         image(img: .eng_bigBenSecond) ?? UIImage(),
         image(img: .eng_bigBenThird) ?? UIImage(),
         image(img: .eng_bigBenFourth) ?? UIImage(),
         image(img: .eng_bigBenFinish) ?? UIImage(),
         
         image(img: .eng_busStart) ?? UIImage(),
         image(img: .eng_busFirst) ?? UIImage(),
         image(img: .eng_busSecond) ?? UIImage(),
         image(img: .eng_busThird) ?? UIImage(),
         image(img: .eng_busFourth) ?? UIImage(),
         image(img: .eng_busFinish) ?? UIImage() ]
    }()
    
    lazy var franceLevelImgs: [UIImage] = {
        [
            RImage.fr_luvrStart() ?? UIImage(),
            RImage.fr_luvrFirst() ?? UIImage(),
            RImage.fr_luvrSecond() ?? UIImage(),
            RImage.fr_luvrThird() ?? UIImage(),
            RImage.fr_luvrFourth() ?? UIImage(),
            RImage.fr_luvrFinish() ?? UIImage(),
            
            RImage.fr_towerStart() ?? UIImage(),
            RImage.fr_towerFirst() ?? UIImage(),
            RImage.fr_towerSecond() ?? UIImage(),
            RImage.fr_towerThird() ?? UIImage(),
            RImage.fr_towerFourth() ?? UIImage(),
            RImage.fr_towerFinish() ?? UIImage(),
            
            RImage.fr_vineyardStart() ?? UIImage(),
            RImage.fr_vineyardFirst() ?? UIImage(),
            RImage.fr_vineyardSecond() ?? UIImage(),
            RImage.fr_vineyardThird() ?? UIImage(),
            RImage.fr_vineyardFourth() ?? UIImage(),
            RImage.fr_vineyardFinish() ?? UIImage(),
            
            RImage.fr_archStart() ?? UIImage(),
            RImage.fr_archFirst() ?? UIImage(),
            RImage.fr_archSecond() ?? UIImage(),
            RImage.fr_archThird() ?? UIImage(),
            RImage.fr_archFourth() ?? UIImage(),
            RImage.fr_archFinish() ?? UIImage(),
            
            RImage.fr_fieldStart() ?? UIImage(),
            RImage.fr_fieldFirst() ?? UIImage(),
            RImage.fr_fieldSecond() ?? UIImage(),
            RImage.fr_fieldThird() ?? UIImage(),
            RImage.fr_fieldFourth() ?? UIImage(),
            RImage.fr_fieldFinish() ?? UIImage()
        ]
    }()
    
    private static let arcCGRects = [CGRect(x: 249, y: 227, width: 120, height: 120),
                                     CGRect(x: 59, y: 298, width: 140, height: 101),
                                     CGRect(x: 209, y: 375, width: 170, height: 138),
                                     CGRect(x: 44, y: 515, width: 165, height: 84),
                                     CGRect(x: 205, y: 595, width: 146, height: 104)]
    
    private static let engCGRects = [CGRect(x: 35, y: 223, width: 144, height: 132),
                                     CGRect(x: 227, y: 352, width: 138, height: 119),
                                     CGRect(x: 65, y: 491, width: 96, height: 134),
                                     CGRect(x: 264, y: 506, width: 101, height: 154),
                                     CGRect(x: 134, y: 641, width: 127, height: 137)]
    
    private static let franceCGRects = [CGRect(x: 58, y: 202, width: 152, height: 158),
                                        CGRect(x: 279, y: 252, width: 139, height: 153),
                                        CGRect(x: 69.3, y: 382.8, width: 154, height: 158),
                                        CGRect(x: 261, y: 503, width: 132, height: 161),
                                        CGRect(x: 84, y: 572, width: 172, height: 117)]
}

