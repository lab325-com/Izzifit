//
//  LevelController.swift
//  izzifit
//
//  Created by O l e h on 08.06.2022.
//

import UIKit

class LevelController: BaseController {

    private var englandView: LevelView!
    
    private lazy var presenter = LevelPresenter(view: self)
    
    var cgRects = [CGRect(x: 35, y: 223, width: 144, height: 132),
                   CGRect(x: 227, y: 352, width: 138, height: 119),
                   CGRect(x: 65, y: 491, width: 96, height: 134),
                   CGRect(x: 264, y: 506, width: 101, height: 154),
                   CGRect(x: 134, y: 641, width: 127, height: 137)]
    
    private var firstRespond = true

    
    override func loadView() {
        englandView = LevelView(cgRects: cgRects)
        self.view = englandView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigationBar = true
        presenter.getBuildings{ [self] in
            if firstRespond {
                checkAvailableHummers()
                firstRespond.toggle()
             
            }
        }
    }
    
    private func checkAvailableHummers() {
        guard let count = presenter.freeBuildingsCount else { return}
        switch count {
        case 0:
            englandView.hummerBtn.isHidden = true
            englandView.hummerCountLbl.isHidden = true
        default:
            englandView.hummerBtn.isHidden = false
            englandView.hummerCountLbl.isHidden = false
            englandView.hummerCountLbl.text = "x\(count)"
        }
    }
}

extension LevelController: LevelOutputProtocol {
    
    func success() { }
    
    func successBuildings(model: [BuildingsModel]) {
        checkAvailableHummers()
        var player = PlayerModel()
        print(model)
        for building in model {
            var state: LevelStates
            let level = building.level
            switch level {
            case 0: state = .start
            case 1: state = .first
            case 2: state = .second
            case 3: state = .third
            case 4: state = .fourth
            case 5: state = .finish
            default: state = .finish
            }
            
            switch building.name {
            case BuildingType.ship.rawValue: player.firstState = state
            case BuildingType.fishing.rawValue: player.secondState = state
            case BuildingType.house.rawValue: player.thirdState = state
            case BuildingType.hay.rawValue: player.fourthState = state
            case BuildingType.sled.rawValue: player.fifthState = state
            default: break
            }
        }
        englandView.drawStates(player: player, imgStatesArr: englandView.englandLevelImgs)
    }
    
    func successBuild() { }
    
    func successMe() {
        englandView.barBackVw.getCoinsAndEnergy()
    }
}
