//
//  LevelView.swift
//  izzifit
//
//  Created by O l e h on 07.06.2022.
//

import UIKit

class LevelView: UIView {
    
    private var barBackVw = GameBarBackView(backImage: UIImage(named: "gameBarBack")!)
    
    private let imgUponScroll = UIImageView()
    let scrollView = UIScrollView()
    var cgRects: [CGRect]

    //    var firstBtn = UIButton()
    //    var secondBtn = UIButton()
    //    var thirdBtn = UIButton()
    //    var fourthBtn = UIButton()
    //    var fifthBtn = UIButton()
    
    lazy var stateBtns: [UIButton] = {
        var btns = [UIButton]()
        for _ in 0...4 {
            let btn = UIButton()
            btns.append(btn)
        }
        return btns
    }()
    
    init(cgRects: [CGRect]) {
        self.cgRects = cgRects
        super.init(frame: .zero)
        setUI()
        layout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUI() {
        imgUponScroll.image = image(img: .level_england_back)
        
        
    }
    
    private func layout() {
        
        ui.setAndLayScrollView(contentV: imgUponScroll,
                               scrollV: scrollView,
                               parentView: self,
                               backColor: clr(color: .clrMainMapBack) ?? UIColor(),
                               showScrollIndicators: false,
                               bounces: false,
                               width: 428,
                               height: 926)
        
        let x = (428 - UIScreen.main.bounds.size.width) / 2
        scrollView.setContentOffset(CGPoint(x: x, y: 2605),
                                    animated: true)
        
        ui.genericlLayout(object: barBackVw,
                          parentView: self,
                          height: h / 9.2,
                          topC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        for (index, rect) in cgRects.enumerated() {
            
            ui.genericlLayout(object: stateBtns[index],
                              parentView: imgUponScroll,
                              width: rect.width,
                              height: rect.height,
                              topC: rect.minY,
                              leadingC: rect.minX)
            
        }
    }
    
    func drawStates(player: PlayerModel, imgStatesArr imgs: [UIImage]) {
        
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
         image(img: .eng_busFinish) ?? UIImage()
        ]
    }()

}

