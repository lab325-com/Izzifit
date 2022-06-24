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
    case second = 4000
    case third = 8000
    case fourth = 12000
    case finish = 0
}

enum BuildingType: String {
    case building1 = "ship"
    case building2 = "fishing"
    case building3 = "house"
    case building4 = "hay"
    case building5 = "sled"
}

struct PlayerModel {
    var firstState: LevelStates
    var secondState: LevelStates
    var thirdState: LevelStates
    var fourthState: LevelStates
    var fifthState: LevelStates
    
    func checkMaxLevel() -> Bool {
        if firstState == .finish &&
           secondState == .finish &&
            thirdState == .finish &&
            fourthState == .finish &&
            fifthState == .finish {
            return true
        }
        else
        { return false }
    }
    
    mutating func updateState(buildType: BuildingType, currentState: LevelStates ) {
        switch buildType {
        case .building1:
            switch currentState {
            case .start:     firstState = .first
            case .first:     firstState = .second
            case .second:    firstState = .third
            case .third:     firstState = .fourth
            case .fourth:    firstState = .finish
            case .finish:     break
            }
        case .building2:
            switch currentState {
            case .start:    secondState = .first
            case .first:    secondState = .second
            case .second:   secondState = .third
            case .third:    secondState = .fourth
            case .fourth:   secondState = .finish
            case .finish:   break
            }
        case .building3:
            switch currentState {
            case .start:    thirdState = .first
            case .first:    thirdState = .second
            case .second:   thirdState = .third
            case .third:    thirdState = .fourth
            case .fourth:   thirdState = .finish
            case .finish:   break
            }
        case .building4:
            switch currentState {
            case .start:    fourthState = .first
            case .first:    fourthState = .second
            case .second:   fourthState = .third
            case .third:    fourthState = .fourth
            case .fourth:   fourthState = .finish
            case .finish:   break
            }
        case .building5:
            switch currentState {
            case .start:    fifthState = .first
            case .first:    fifthState = .second
            case .second:   fifthState = .third
            case .third:    fifthState = .fourth
            case .fourth:   fifthState = .finish
            case .finish:   break
            }
        }
    }
}

extension PlayerModel {
    init() {
        self.firstState = .start
        self.secondState = .start
        self.thirdState = .start
        self.fourthState = .start
        self.fifthState = .start
    }
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
    
    var pointersTicksArray = [PointerTick(state: .first, type: .building1, topC: 30, leadingC: 54),
                              PointerTick(state: .first, type: .building2, topC: -14, leadingC: 103),
                              PointerTick(state: .first, type: .building3, topC: 23, leadingC: 87),
                              PointerTick(state: .first, type: .building4, topC: -9, leadingC: 67),
                              PointerTick(state: .first, type: .building5, topC: 14, leadingC: 38),
                              
                              PointerTick(state: .second, type: .building1, topC: 30, leadingC: 54),
                              PointerTick(state: .second, type: .building2, topC: -14, leadingC: 103),
                              PointerTick(state: .second, type: .building3, topC: 23, leadingC: 87),
                              PointerTick(state: .second, type: .building4, topC: -9, leadingC: 67),
                              PointerTick(state: .second, type: .building5, topC: 14, leadingC: 38),
                              
                              PointerTick(state: .third, type: .building1, topC: 15, leadingC: 54),
                              PointerTick(state: .third, type: .building2, topC: -14, leadingC: 103),
                              PointerTick(state: .third, type: .building3, topC: 23, leadingC: 87),
                              PointerTick(state: .third, type: .building4, topC: -9, leadingC: 67),
                              PointerTick(state: .third, type: .building5, topC: 14, leadingC: 38),
                              
                              PointerTick(state: .fourth, type: .building1, topC: 0, leadingC: 54),
                              PointerTick(state: .fourth, type: .building2, topC: -14, leadingC: 103),
                              PointerTick(state: .fourth, type: .building3, topC: 23, leadingC: 87),
                              PointerTick(state: .fourth, type: .building4, topC: -9, leadingC: 67),
                              PointerTick(state: .fourth, type: .building5, topC: 14, leadingC: 38),
                              
                              PointerTick(state: .finish, type: .building1, topC: 25, leadingC: 54),
                              PointerTick(state: .finish, type: .building2, topC: 1, leadingC: 42),
                              PointerTick(state: .finish, type: .building3, topC: 42, leadingC: 117),
                              PointerTick(state: .finish, type: .building4, topC: 0, leadingC: 106),
                              PointerTick(state: .finish, type: .building5, topC: 4, leadingC: 128)]
    
    func drawPointers(model: PlayerModel, btns: [UIButton?]) {
        
        for img in imgVwArray {
            img.removeFromSuperview()
        }
        imgVwArray.removeAll()
        var state: LevelStates
        var building: BuildingType
        
        for (index, btn) in btns.enumerated() {
            
            switch index {
            case 0: building = .building1 ; state = model.firstState
            case 1: building = .building2 ; state = model.secondState
            case 2: building = .building3 ; state = model.thirdState
            case 3: building = .building4 ; state = model.fourthState
            case 4: building = .building5 ; state = model.fifthState
            default:  building = .building5 ; state = model.fifthState
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
