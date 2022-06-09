//
//  LevelController.swift
//  izzifit
//
//  Created by O l e h on 08.06.2022.
//

import UIKit
import Gifu

class LevelController: BaseController {

    private var englandView: LevelView!
    private var buildPopUpVw: BuildPopUpView?
    
    private lazy var presenter = LevelPresenter(view: self)
    
    var cgRects = [CGRect(x: 35, y: 223, width: 144, height: 132),
                   CGRect(x: 227, y: 352, width: 138, height: 119),
                   CGRect(x: 65, y: 491, width: 96, height: 134),
                   CGRect(x: 264, y: 506, width: 101, height: 154),
                   CGRect(x: 134, y: 641, width: 127, height: 137)]
    
    private var firstRespond = true
    var player = PlayerModel()
    let animation = GIFImageView()
    
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
        addTargets()
    }
    
    private func addTargets() {
        for btn in englandView.stateBtns {
            btn.addTarget(self,
                         action: #selector(showPopUp(sender:)),
                         for: .touchUpInside)
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
    
    @objc
    func showPopUp(sender: UIButton) {
        
        var price = Int()
        var buildType: BuildingType
        
        switch sender.tag {
        case 0: price = player.firstState.rawValue
            buildType = .ship
        case 1: price = player.secondState.rawValue
            buildType = .fishing
        case 2: price = player.thirdState.rawValue
            buildType = .house
        case 3: price = player.fourthState.rawValue
            buildType = .hay
        case 4: price = player.fifthState.rawValue
            buildType = .sled
        default: buildType = .ship
        }
        
        guard price != 0 else { return }
        
        if presenter.freeBuildingsCount ?? 0 > 0 {
            // здесь рисуй попАп за молоточек
            drawBuildPopUp(price: price,
                           buildType: buildType,
                           sender: sender)
            buildPopUpVw!.priceLbl.text = "Free"
        }
        
        guard KeychainService.standard.me?.coins ?? 0 >= price else {
            if presenter.freeBuildingsCount ?? 0 <= 0 {
                showAlert(message: "You don't have enough money") {
                    let _ = PaywallRouter(presenter: self.navigationController).presentPaywall(delegate: self, place: .goldZero)
                }
            }
            return
        }
        // тут малюй попАп за монети
        drawBuildPopUp(price: price,
                       buildType: buildType,
                       sender: sender)
    }
    
    
    @objc func closePopUp() {
        guard let buildPopUpVw = buildPopUpVw else { return }
        buildPopUpVw.removeFromSuperview()
    }
    
    @objc func upgradeBuilding(sender: UIButton) {
        for btn in englandView.stateBtns {
            btn.isUserInteractionEnabled.toggle()
        }
        guard let buildingId = presenter.buildings[safe: sender.tag]?.id else {return}
        guard let buildPopUpVw = buildPopUpVw else { return }
        buildPopUpVw.removeFromSuperview()
        view.layoutIfNeeded()
        animation.isHidden.toggle()
        animation.startAnimatingGIF()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) { [self] in
            self.animation.stopAnimatingGIF()
            self.animation.isHidden.toggle()
            self.animation.removeFromSuperview()
            
            var price = Int()
            var buildType: BuildingType
            
            switch sender.tag {
            case 0: price = self.player.firstState.rawValue
                buildType = .ship
            case 1: price = self.player.secondState.rawValue
                buildType = .fishing
            case 2: price = self.player.thirdState.rawValue
                buildType = .house
            case 3: price = self.player.fourthState.rawValue
                buildType = .hay
            case 4: price = self.player.fifthState.rawValue
                buildType = .sled
            default: buildType = .ship
            }
            
            let state = LevelStates(rawValue: price)
            switch state {
            case .start:
                AnalyticsHelper.sendFirebaseEvents(events: .map_building_updgrade,
                                                   params: ["building" : buildType.rawValue,
                                                            "upgradeLevel": "\(LevelStates.first.rawValue)"])
            case .first:
                AnalyticsHelper.sendFirebaseEvents(events: .map_building_updgrade,
                                                   params: ["building" : buildType.rawValue,
                                                            "upgradeLevel": "\(LevelStates.second.rawValue)"])
            case .second:
                AnalyticsHelper.sendFirebaseEvents(events: .map_building_updgrade,
                                                   params: ["building" : buildType.rawValue,
                                                            "upgradeLevel": "\(LevelStates.third.rawValue)"])
            case .third:
                AnalyticsHelper.sendFirebaseEvents(events: .map_building_updgrade,
                                                   params: ["building" : buildType.rawValue,
                                                            "upgradeLevel": "\(LevelStates.fourth.rawValue)"])
            case .fourth:
                AnalyticsHelper.sendFirebaseEvents(events: .map_building_complete,
                                                   params: ["building" : buildType.rawValue])
            case .finish: break
            case .none: break
            }
            
            for btn in englandView.stateBtns {
                btn.isUserInteractionEnabled.toggle()
            }
     
            presenter.upgradeBuild(buildingId: buildingId) { [self] in
                let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .upgraidBuilding)
            }
        }
    }
    
    
    func drawBuildPopUp(price: Int,
                        buildType: BuildingType,
                        sender: UIButton) {
       
        buildPopUpVw = nil
        buildPopUpVw = BuildPopUpView()
        guard let buildPopUpVw = buildPopUpVw else { return }
            buildPopUpVw.hummerBtn.isHidden = true
            buildPopUpVw.hummerCountLbl.isHidden = true
            view.ui.genericlLayout(object: buildPopUpVw,
                                   parentView: view,
                                   topC: 0,
                                   bottomC: 0,
                                   leadingC: 0,
                                   trailingC: 0)
        view.layoutIfNeeded()
        checkAvailableHummers()
        
        if let count = presenter.freeBuildingsCount {
            switch count {
            case 0:
                buildPopUpVw.hummerBtn.isHidden = true
                buildPopUpVw.hummerCountLbl.isHidden = true
            default:
                buildPopUpVw.hummerBtn.isHidden = false
                buildPopUpVw.hummerCountLbl.isHidden = false
                buildPopUpVw.hummerCountLbl.text = "x\(count)"
            }
        }
        
        buildPopUpVw.fillStates(by: LevelStates(rawValue: price) ?? .finish)
        
        AnalyticsHelper.sendFirebaseEvents(events: .map_building_tap, params: ["building" : buildType.rawValue])
        
        buildPopUpVw.priceLbl.text = "\(price)"
        buildPopUpVw.draw(buildType, state: LevelStates(rawValue: price) ?? .start)
        buildPopUpVw.upgradeBtn.tag = sender.tag
        buildPopUpVw.upgradeBtn.addTarget(self,
                                          action: #selector(upgradeBuilding(sender:)),
                                          for: .touchUpInside)
        buildPopUpVw.mainBtn.addTarget(self,
                                       action: #selector(closePopUp),
                                       for: .touchUpInside)
        
        view.ui.genericlLayout(object: animation,
                               parentView: sender,
                               width: 200,
                               height: 200,
                               centerV: 0,
                               centerH: 0)
        view.layoutIfNeeded()
    }
}

extension LevelController: LevelOutputProtocol {
    
    func success() { }
    
    func successBuildings(model: [BuildingsModel]) {
        checkAvailableHummers()
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


//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension LevelController: PaywallProtocol {
    func paywallActionBack(controller: BaseController) { self.dismiss(animated: true) }
    func paywallSuccess(controller: BaseController) { }
}
