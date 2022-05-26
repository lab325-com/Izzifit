//
//  LevelStates.swift
//  izzifit
//
//  Created by O l e h on 11.04.2022.
//

import UIKit


enum LevelStates: Int {
    case start = 1000
    case first = 2000
    case second = 3000
    case third = 4000
    case fourth = 5000
    case finish = 0
}

enum BuildingType: String {
    case ship, fishing, house, hay, sled
}

struct PlayerModel {
    var shipState: LevelStates
    var fishState: LevelStates
    var igluState: LevelStates
    var goldState: LevelStates
    var deerState: LevelStates
}

struct PointerTick {
    var state: LevelStates
    var type: BuildingType
    var topC: CGFloat
    var leadingC: CGFloat
}

class PointersAndTicks {
    
    var pointerImgVw: UIImageView {
        let pointerImgVw = UIImageView()
        pointerImgVw.image = UIImage(named: "upgradeLevel")
        pointerImgVw.contentMode = .scaleAspectFill
        pointerImgVw.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pointerImgVw.widthAnchor.constraint(equalToConstant: 29).isActive = true
        return pointerImgVw
    }
    
    var tickImgVw: UIImageView {
       let tickImgVw = UIImageView()
        tickImgVw.image = UIImage(named: "buildDone")
        tickImgVw.contentMode = .scaleAspectFill
        tickImgVw.heightAnchor.constraint(equalToConstant: 29).isActive = true
        tickImgVw.widthAnchor.constraint(equalToConstant: 29).isActive = true
        return tickImgVw
    }
    
    var imgVwArray = [UIImageView]()
    
    
    let view = UIView()
    var pointersTicksArray = [PointerTick(state: .first, type: .ship, topC: 30, leadingC: 54),
                              PointerTick(state: .first, type: .fishing, topC: -14, leadingC: 103),
                              PointerTick(state: .first, type: .house, topC: 23, leadingC: 87),
                              PointerTick(state: .first, type: .hay, topC: -9, leadingC: 67),
                              PointerTick(state: .first, type: .sled, topC: 14, leadingC: 38),
                              
                              PointerTick(state: .second, type: .ship, topC: 30, leadingC: 54),
                              PointerTick(state: .second, type: .fishing, topC: -14, leadingC: 103),
                              PointerTick(state: .second, type: .house, topC: 23, leadingC: 87),
                              PointerTick(state: .second, type: .hay, topC: -9, leadingC: 67),
                              PointerTick(state: .second, type: .sled, topC: 14, leadingC: 38),
                              
                              PointerTick(state: .third, type: .ship, topC: 15, leadingC: 54),
                              PointerTick(state: .third, type: .fishing, topC: -14, leadingC: 103),
                              PointerTick(state: .third, type: .house, topC: 23, leadingC: 87),
                              PointerTick(state: .third, type: .hay, topC: -9, leadingC: 67),
                              PointerTick(state: .third, type: .sled, topC: 14, leadingC: 38),
                              
                              PointerTick(state: .fourth, type: .ship, topC: 0, leadingC: 54),
                              PointerTick(state: .fourth, type: .fishing, topC: -14, leadingC: 103),
                              PointerTick(state: .fourth, type: .house, topC: 23, leadingC: 87),
                              PointerTick(state: .fourth, type: .hay, topC: -9, leadingC: 67),
                              PointerTick(state: .fourth, type: .sled, topC: 14, leadingC: 38),
                              
                              PointerTick(state: .finish, type: .ship, topC: 25, leadingC: 54),
                              PointerTick(state: .finish, type: .fishing, topC: 1, leadingC: 42),
                              PointerTick(state: .finish, type: .house, topC: 42, leadingC: 117),
                              PointerTick(state: .finish, type: .hay, topC: 0, leadingC: 106),
                              PointerTick(state: .finish, type: .sled, topC: 4, leadingC: 128) ]
    
    
    func drawPointers(model: PlayerModel, btns: [UIButton?]) {
   
        var state: LevelStates
        var building: BuildingType
        
        for (index, btn) in btns.enumerated() {
            
            switch index {
            case 0: building = .ship ; state = model.shipState
            case 1: building = .fishing ; state = model.fishState
            case 2: building = .house ; state = model.igluState
            case 3: building = .hay ; state = model.goldState
            case 4: building = .sled ; state = model.deerState
            default:  building = .sled ; state = model.deerState
            }

            switch state {
            case .start: continue
            case .finish:
                let pointerTick = pointersTicksArray.filter{ $0.state == state } // get levelState from playerModel
                let firstPointerTick = pointerTick.filter{ $0.type == building }  // get BuildingType by index in btns.enumerated
                if let point = firstPointerTick.first {
                    let img = tickImgVw
                    view.ui.genericlLayout(object: img,
                                           parentView: btn ?? btns[index]!,
                                           topC: point.topC,
                                           leadingC: point.leadingC)
                    imgVwArray.append(img)
                }
            default:
                let pointerTick = pointersTicksArray.filter{ $0.state == state } // get levelState from playerModel
                let firstPointerTick = pointerTick.filter{ $0.type == building }  // get BuildingType by index in btns.enumerated
                if let point = firstPointerTick.first {
                    let img = pointerImgVw
                    view.ui.genericlLayout(object: img,
                                           parentView: btn ?? btns[index]!,
                                           topC: point.topC,
                                           leadingC: point.leadingC)
                    imgVwArray.append(img)
                }
            }
        }
    }
}
