//
//  LevelView.swift
//  izzifit
//
//  Created by O l e h on 13.04.2022.
//

import UIKit

class LevelView: UIView {
    
    var player: PlayerModel
    
    private var shipImgVw = UIImageView()
    private var fishImgVw = UIImageView()
    private var igluImgVw = UIImageView()
    private var goldImgVw = UIImageView()
    private var deerImgVw = UIImageView()
    
    init(player: PlayerModel) {
        self.player = player
        super.init(frame: .zero)
       
        drawStates()
    }
    
    func layout() {
        shipImgVw.contentMode = .scaleAspectFill
        fishImgVw.contentMode = .scaleAspectFill
        igluImgVw.contentMode = .scaleAspectFill
        goldImgVw.contentMode = .scaleAspectFill
        deerImgVw.contentMode = .scaleAspectFill
        
        ui.genericlLayout(object: shipImgVw,
                          parentView: self,
                          width: w * 0.32,
                          height: w * 0.32,
                          topC:  220 ,//208,
                          leadingC: w * 0.584)
        
        ui.genericlLayout(object: fishImgVw,
                          parentView: self,
                          width: w * 0.37,
                          height: w * 0.269,
                          topC: 290, //279,
                          leadingC: w * 0.077)
        
        ui.genericlLayout(object: igluImgVw,
                          parentView: self,
                          width: w * 0.453,
                          height: w * 0.368,
                          topC: 369, //356,
                          leadingC: w * 0.477)
        
        ui.genericlLayout(object: goldImgVw,
                          parentView: self,
                          width: w * 0.44,
                          height: w * 0.248,
                          topC: 503,//491,
                          leadingC: w * 0.029)
        
        ui.genericlLayout(object: deerImgVw,
                          parentView: self,
                          width: w * 0.389,
                          height: w * 0.277,
                          topC: 590, // 576,
                          leadingC: w * 0.466)
        
    }
    
    private func drawStates() {
        switch player.shipState {
        case .start:
            shipImgVw.image = image(img: .shipStart)
        case .first:
            shipImgVw.image = image(img: .shipFirst)
        case .second:
            shipImgVw.image = image(img: .shipSecond)
        case .third:
            shipImgVw.image = image(img: .shipThird)
        case .fourth:
            shipImgVw.image = image(img: .shipFourth)
        case .finish:
            shipImgVw.image = image(img: .shipFinish)
        }
        
        switch player.fishState {
        case .start:
            fishImgVw.image = image(img: .fishStart)
        case .first:
            fishImgVw.image = image(img: .fishFirst)
        case .second:
            fishImgVw.image = image(img: .fishSecond)
        case .third:
            fishImgVw.image = image(img: .fishThird)
        case .fourth:
            fishImgVw.image = image(img: .fishFourth)
        case .finish:
            fishImgVw.image = image(img: .fishFinish)
        }
        
        switch player.igluState {
        case .start:
            igluImgVw.image = image(img: .igluStart)
        case .first:
            igluImgVw.image = image(img: .igluFirst)
        case .second:
            igluImgVw.image = image(img: .igluSecond)
        case .third:
            igluImgVw.image = image(img: .igluThird)
        case .fourth:
            igluImgVw.image = image(img: .igluFourth)
        case .finish:
            igluImgVw.image = image(img: .igluFinish)
        }
        
        switch player.goldState {
        case .start:
            goldImgVw.image = image(img: .goldStart)
        case .first:
            goldImgVw.image = image(img: .goldFirst)
        case .second:
            goldImgVw.image = image(img: .goldSecond)
        case .third:
            goldImgVw.image = image(img: .goldThird)
        case .fourth:
            goldImgVw.image = image(img: .goldFourth)
        case .finish:
            goldImgVw.image = image(img: .goldFinish)
        }
        
        switch player.deerState {
        case .start:
            deerImgVw.image = image(img: .deerStart)
        case .first:
            deerImgVw.image = image(img: .deerFirst)
        case .second:
            deerImgVw.image = image(img: .deerSecond)
        case .third:
            deerImgVw.image = image(img: .deerThird)
        case .fourth:
            deerImgVw.image = image(img: .deerFourth)
        case .finish:
            deerImgVw.image = image(img: .deerFinish)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
