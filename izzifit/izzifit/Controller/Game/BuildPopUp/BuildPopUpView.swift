//
//  BuildPopUpView.swift
//  izzifit
//
//  Created by O l e h on 10.05.2022.
//

import UIKit

class BuildPopUpView: UIView,LoadFromXibProtocol {
    
    @IBOutlet weak var popUpTopConstraint: NSLayoutConstraint! {
        didSet {
            popUpTopConstraint.constant = h / 4.66
        }
    }
    @IBOutlet weak var hummerBtn: UIButton!
    @IBOutlet weak var hummerCountLbl: UILabel!
    
    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var mainBtn: UIButton!
    @IBOutlet weak var previousStateImgVw: UIImageView!
    @IBOutlet weak var nextStateImgVw: UIImageView!
    @IBOutlet weak var upgradeBtn: UIButton!
    
    @IBOutlet weak var firstScaleImgVw: UIImageView!
    @IBOutlet weak var secondScaleImgVw: UIImageView!
    @IBOutlet weak var thirdScaleImgVw: UIImageView!
    @IBOutlet weak var fourthScaleImgVw: UIImageView!
    @IBOutlet weak var fifthScaleImgVw: UIImageView!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
            setup()
        }
        
        private func setup() {
            addSubviewLoadedFromXib()
        }
}

