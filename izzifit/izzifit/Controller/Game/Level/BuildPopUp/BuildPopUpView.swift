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
            popUpTopConstraint.constant = h/4.66
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
    
    lazy var states = [firstScaleImgVw,
                       secondScaleImgVw,
                       thirdScaleImgVw,
                       fourthScaleImgVw,
                       fifthScaleImgVw]
    
    var selectedStateImgs = [ScaleImgs.scale1Selected,
                             ScaleImgs.scale2Selected,
                             ScaleImgs.scale3Selected,
                             ScaleImgs.scale4Selected,
                             ScaleImgs.scale5Selected]
    
    @IBOutlet weak var priceLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func fillStates(by currentState: LevelStates) {
        
        var currentStateCounter = Int()
        
        switch currentState {
        case .start: currentStateCounter = -1
        case .first: currentStateCounter = 0
        case .second: currentStateCounter = 1
        case .third: currentStateCounter = 2
        case .fourth: currentStateCounter = 3
        case .finish: break
        }
        
        for (index,state) in states.enumerated() {
            guard index <= currentStateCounter else { return }
            state?.image = selectedStateImgs[index]
            layoutIfNeeded()
        }
    }
    
    func draw(_ type: BuildingType, state: LevelStates) {
    
        switch type {
        case .building1:
            switch state {
            case .start: previousStateImgVw.image = image(img: .popStartState)
                nextStateImgVw.image = image(img: .pop1Ship)
            case .first: previousStateImgVw.image = image(img: .pop1Ship)
                nextStateImgVw.image = image(img: .pop2Ship)
            case .second: previousStateImgVw.image = image(img: .pop2Ship)
                nextStateImgVw.image = image(img: .pop3Ship)
            case .third: previousStateImgVw.image = image(img: .pop3Ship)
                nextStateImgVw.image = image(img: .pop4Ship)
            case .fourth: previousStateImgVw.image = image(img: .pop4Ship)
                nextStateImgVw.image = image(img: .pop5Ship)
            case .finish: break
            }
        case .building2:
            switch state {
            case .start: previousStateImgVw.image = image(img: .popStartState)
                         nextStateImgVw.image = image(img: .pop1Fish)
            case .first: previousStateImgVw.image = image(img: .pop1Fish)
                         nextStateImgVw.image = image(img: .pop2Fish)
            case .second: previousStateImgVw.image = image(img: .pop2Fish)
                          nextStateImgVw.image = image(img: .pop3Fish)
            case .third: previousStateImgVw.image = image(img: .pop3Fish)
                         nextStateImgVw.image = image(img: .pop4Fish)
            case .fourth: previousStateImgVw.image = image(img: .pop4Fish)
                          nextStateImgVw.image = image(img: .pop5Fish)
            case .finish: break
            }
            
        case .building3:
            switch state {
            case .start: previousStateImgVw.image = image(img: .popStartState)
                         nextStateImgVw.image = image(img: .pop1Fish)
            case .first: previousStateImgVw.image = image(img: .pop1Iglu)
                         nextStateImgVw.image = image(img: .pop2Iglu)
            case .second: previousStateImgVw.image = image(img: .pop2Iglu)
                          nextStateImgVw.image = image(img: .pop3Iglu)
            case .third: previousStateImgVw.image = image(img: .pop3Iglu)
                         nextStateImgVw.image = image(img: .pop4Iglu)
            case .fourth: previousStateImgVw.image = image(img: .pop4Iglu)
                          nextStateImgVw.image = image(img: .pop5Iglu)
            case .finish: break
            }
            
        case .building4:
            switch state {
            case .start: previousStateImgVw.image = image(img: .popStartState)
                         nextStateImgVw.image = image(img: .pop1Gold)
            case .first: previousStateImgVw.image = image(img: .pop1Gold)
                         nextStateImgVw.image = image(img: .pop2Gold)
            case .second: previousStateImgVw.image = image(img: .pop2Gold)
                          nextStateImgVw.image = image(img: .pop3Gold)
            case .third: previousStateImgVw.image = image(img: .pop3Gold)
                         nextStateImgVw.image = image(img: .pop4Gold)
            case .fourth: previousStateImgVw.image = image(img: .pop4Gold)
                          nextStateImgVw.image = image(img: .pop5Gold)
            case .finish: break
            }
            
        case .building5:
            switch state {
            case .start: previousStateImgVw.image = image(img: .popStartState)
                         nextStateImgVw.image = image(img: .pop1Deers)
            case .first: previousStateImgVw.image = image(img: .pop1Deers)
                         nextStateImgVw.image = image(img: .pop2Deers)
            case .second: previousStateImgVw.image = image(img: .pop2Deers)
                          nextStateImgVw.image = image(img: .pop3Deers)
            case .third: previousStateImgVw.image = image(img: .pop3Deers)
                         nextStateImgVw.image = image(img: .pop4Deers)
            case .fourth: previousStateImgVw.image = image(img: .pop4Deers)
                          nextStateImgVw.image = image(img: .pop5Deers)
            case .finish: break
            }
        }
        
       var level = Int()
       
       switch state {
       case .start: level = 0
       case .first: level = 1
       case .second: level = 2
       case .third: level = 3
       case .fourth:level = 4
       case .finish: level = 5
       }
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    private func setup() {
        addSubviewLoadedFromXib()
    }
    
    
}

