//
//  GameBarBackView.swift
//  izzifit
//
//  Created by O l e h on 17.05.2022.
//

import UIKit

class GameBarBackView: UIView {

    var mainImgVw = UIImageView()
    var avatarImgVw = UIImageView()
    var nameLbl = UILabel()
    
    var coinsImgVw = UIImageView()
    var coinsLbl = UILabel()
    var energyImgVw = UIImageView()
    var energyCountLbl = UILabel()
    
    init(backImage: UIImage) {
        super.init(frame: .zero)
      mainImgVw.image = backImage
      mainImgVw.contentMode = .scaleAspectFill
      layout()
    }

    func layout() {
        
        ui.genericlLayout(object: mainImgVw,
                          parentView: self,
                          topC: 0,
                          bottomC: 0,
                          leadingC: 0,
                          trailingC: 0)
        
        ui.genericlLayout(object: avatarImgVw,
                          parentView: mainImgVw,
                          width: 40,
                          height: 40,
                          bottomC: 8,
                          leadingC: 19)
        
        avatarImgVw.layer.cornerRadius = 20
        avatarImgVw.layer.masksToBounds = true
        
        ui.setLabel(label: nameLbl,
                    textColor: .white,
                    textAlignment: .left,
                    fontSize: 20,
                    fontWeight: .medium)
        
        ui.genericlLayout(object: nameLbl,
                          parentView: mainImgVw,
                          centerVtoO: avatarImgVw.centerYAnchor,
                          leadingToO: avatarImgVw.trailingAnchor,
                          leadingCG: 8)
        
        ui.setLabel(label: energyCountLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: 16,
                    fontWeight: .medium)
        
        ui.setLabel(label: coinsLbl,
                    textColor: .white,
                    textAlignment: .right,
                    fontSize: 16,
                    fontWeight: .medium)
        
        coinsImgVw.image = UIImage(named: "top_view_coin_ic")
        energyImgVw.image = UIImage(named: "top_view_flash_ic")
         
        ui.genericlLayout(object: energyCountLbl,
                          parentView: mainImgVw,
                          trailingC: 17,
                          centerVtoO: avatarImgVw.centerYAnchor)
        
        ui.genericlLayout(object: energyImgVw,
                          parentView: mainImgVw,
                          width: 22,
                          height: 22,
                          centerVtoO: avatarImgVw.centerYAnchor,
                          trailingToO: energyCountLbl.leadingAnchor,
                          trailingCG: 2)
        
        ui.genericlLayout(object: coinsLbl,
                          parentView: mainImgVw,
                          centerVtoO: avatarImgVw.centerYAnchor,
                          trailingToO: energyImgVw.leadingAnchor,
                          trailingCG: 10)
        
        ui.genericlLayout(object: coinsImgVw,
                          parentView: mainImgVw,
                          width: 22,
                          height: 22,
                          centerVtoO: avatarImgVw.centerYAnchor,
                          trailingToO: coinsLbl.leadingAnchor,
                          trailingCG: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
