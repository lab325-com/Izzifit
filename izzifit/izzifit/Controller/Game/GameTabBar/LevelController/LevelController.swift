//
//  LevController.swift
//  izzifit
//
//  Created by mob325 on 02.08.2022.
//

import UIKit

class LevelController: BaseController {

    var levelView:                  LevelView!
    private var buildPopUpVw:       LevelPopUpView?
    private var finishLevelPopUp:   LevelFinishView?
    
    var player = PlayerModel()
    let animation = UIImageView()
    private var pointers = PointersAndTicks()
    var onboardingView: MainGameOnboardingView?
    
    private var firstLaunch = true
    
    override func loadView() {
        super.loadView()
        levelView = LevelView()
        levelView.frame = view.bounds
        view.addSubview(levelView)
        succesBuildings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            GameNetworkLayer.shared.getMap(view: self) {
                self.drawLevel()
                guard !PreferencesManager.sharedManager.gameOnboardingDone else { return }
                if let tabBarVC = self.tabBarController as? GameTabBarController {
                self.onboardingView = MainGameOnboardingView(state: MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter],
                                                            delegate: self,
                                                            gameTabBar: tabBarVC)
                        
                self.view.ui.genericlLayout(object: self.onboardingView!,
                                            parentView: self.view,
                                            topC: 0,
                                            bottomC: 0,
                                            leadingC: 0,
                                            trailingC: 0)
                }
            }
        hiddenNavigationBar = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard !firstLaunch else { firstLaunch = false
            return}
        GameNetworkLayer.shared.getMap(view: self) {
            self.drawLevel()
        }
    }
    
    private func drawLevel() {
        self.levelView.removeFromSuperview()
        self.levelView = LevelView()
        self.levelView.frame = self.view.bounds
        self.view.addSubview(self.levelView)
        self.addTargets()
        self.succesBuildings()
        self.levelView.barBackVw.getCoinsAndEnergy()
        self.checkAvailableHummers()
        let x = (428 - UIScreen.main.bounds.size.width) / 2
        self.levelView.scrollView.setContentOffset(CGPoint(x: x,y: 0),
                                                animated: true)
    }
  
    private func addTargets() {
        for btn in levelView.stateBtns {
            btn.addTarget(self,
                         action: #selector(showPopUp(sender:)),
                         for: .touchUpInside)
        }
    }
    
    private func succesBuildings() {
        
        checkAvailableHummers()
        
        guard let buildings = GameNetworkLayer.shared.buildings else { return }
        var levelCounter = 0
        for building in buildings {
            var state: LevelStates
            let level = building.level
            switch level {
            case 0: state =     .start
            case 1: state =     .first
            case 2: state =     .second
            case 3: state =     .third
            case 4: state =     .fourth
            case 5: state =     .finish
            default: state =    .finish
            }
            levelCounter += level
            switch building.name {
            case BuildingType.building1.rawValue: player.firstState =   state
            case BuildingType.building2.rawValue: player.secondState =  state
            case BuildingType.building3.rawValue: player.thirdState =   state
            case BuildingType.building4.rawValue: player.fourthState =  state
            case BuildingType.building5.rawValue: player.fifthState =   state
            default: break
            }
        }
        
        levelView.levelCounterLbl.text = "\(levelCounter)/25"
        levelView.drawStates(player: player)
        if GameNetworkLayer.shared.mapName == .snow_map {
            pointers.drawPointers(model: player, btns: levelView.stateBtns)
        }
        
        let maxLevel = player.checkMaxLevel()
        guard maxLevel else { return }
        var title = String()
        
        switch GameNetworkLayer.shared.mapName {
        case .snow_map:    title = "Arctic"
        case .england_map: title = "EngLand"
        default: return
        }
        
        finishLevelPopUp = LevelFinishView(title: title,
                                            delegate: self)
        
        view.ui.genericlLayout(object: finishLevelPopUp ?? UIView(),
                               parentView: view,
                               topC: 0,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
    }
    
    @objc
    func showPopUp(sender: UIButton) {
        
        var price = Int()
        var buildType: BuildingType
        
        switch sender.tag {
        case 0: price = player.firstState.rawValue
                buildType = .building1
        case 1: price = player.secondState.rawValue
                buildType = .building2
        case 2: price = player.thirdState.rawValue
                buildType = .building3
        case 3: price = player.fourthState.rawValue
                buildType = .building4
        case 4: price = player.fifthState.rawValue
                buildType = .building5
        default: buildType = .building1
        }
        
        guard price != 0 else { return }
        if let count = GameNetworkLayer.shared.hummersCount {
        if count > 0 {
            // здесь рисуй попАп за молоточек
            drawBuildPopUp(price: price,
                           buildType: buildType,
                           popType: .buildPopType,
                           sender: sender)
            buildPopUpVw!.priceLbl.text = "Free"
        }
        }
        guard KeychainService.standard.me?.coins ?? 0 >= price else {
            if let count = GameNetworkLayer.shared.hummersCount {
            if count <= 0 {
                drawBuildPopUp(price: price,
                               buildType: buildType,
                               popType: .notEnoughMoney,
                               sender: sender)
        }
        }
            return
        }
        // тут малюй попАп за монети
        if let count =  GameNetworkLayer.shared.hummersCount {
        guard count == 0 else { return }
        drawBuildPopUp(price: price,
                       buildType: buildType,
                       popType: .buildPopType,
                       sender: sender)
        }
    }
    
    @objc func closePopUp() {
        guard let buildPopUpVw = buildPopUpVw else { return }
        buildPopUpVw.removeFromSuperview()
    }
    
    @objc func upgradeBuilding(sender: UIButton) {
   
        for btn in levelView.stateBtns {
            btn.isUserInteractionEnabled.toggle()
        }
        
        var buildingName = String()
        
        switch sender.tag {
        case 0: buildingName = "ship"
        case 1: buildingName = "fishing"
        case 2: buildingName = "house"
        case 3: buildingName = "hay"
        case 4: buildingName = "sled"
        default: break
        }
        
        let building = GameNetworkLayer.shared.buildings?.filter({$0.name == buildingName})
        guard let buildingId = building?.first?.id else { return }
        guard let buildPopUpVw = buildPopUpVw     else { return }
        buildPopUpVw.removeFromSuperview()
        view.layoutIfNeeded()
        
        animation.prepareAnimation(name: "construction3", loopRepeated: true)
        animation.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) { [self] in
            self.animation.removeFromSuperview()
            
            var price = Int()
            var buildType: BuildingType
            
            switch sender.tag {
            case 0: price = self.player.firstState.rawValue
                    buildType = .building1
            case 1: price = self.player.secondState.rawValue
                    buildType = .building2
            case 2: price = self.player.thirdState.rawValue
                    buildType = .building3
            case 3: price = self.player.fourthState.rawValue
                    buildType = .building4
            case 4: price = self.player.fifthState.rawValue
                    buildType = .building5
            default: buildType = .building1
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
            
            for btn in levelView.stateBtns {
                btn.isUserInteractionEnabled.toggle()
            }
     
            levelView.barBackVw.prevCoins = KeychainService.standard.me?.coins ?? 0
            GameNetworkLayer.shared.upgradeBuild(buildingId: buildingId,
                                                 view: self) {
                let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .upgraidBuilding)
            } completion: { self.succesBuildings()
                self.levelView.barBackVw.runNumbers(isCoins: true,
                                     duration: 3,
                                    startValue:  self.levelView.barBackVw.prevCoins,
                                     endValue: KeychainService.standard.me?.coins ?? 0)
            }
        }
    }
    
    private func checkAvailableHummers() {
        if let count =  GameNetworkLayer.shared.hummersCount {
            switch count {
            case 0:  levelView.hummerBtn.isHidden = true
                     levelView.hummerCountLbl.isHidden = true
            default: levelView.hummerBtn.isHidden = false
                     levelView.hummerCountLbl.isHidden = false
                     levelView.hummerCountLbl.text = "x\(count)"
            }
        }
    }
    
    func drawBuildPopUp(price: Int,
                        buildType: BuildingType,
                        popType: LevelPopType,
                        sender: UIButton) {
        
        buildPopUpVw = nil
   
        buildPopUpVw = LevelPopUpView(popType: popType,
                                      delegate: self)
        guard let buildPopUpVw = buildPopUpVw else { return }
            buildPopUpVw.hummerImgVw.isHidden = true
            buildPopUpVw.hummerCountLbl.isHidden = true
            view.ui.genericlLayout(object: buildPopUpVw,
                                   parentView: view,
                                   topC: 0,
                                   bottomC: 0,
                                   leadingC: 0,
                                   trailingC: 0)
        view.layoutIfNeeded()
        checkAvailableHummers()
        if let count =  GameNetworkLayer.shared.hummersCount {
            switch count {
            case 0:  buildPopUpVw.hummerImgVw.isHidden = true
                     buildPopUpVw.hummerCountLbl.isHidden = true
            
            default: buildPopUpVw.hummerImgVw.isHidden = false
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
        
        buildPopUpVw.closeBtn.addTarget(self,
                                       action: #selector(closePopUp),
                                       for: .touchUpInside)
        
        buildPopUpVw.emptySpaceBtn.addTarget(self,
                                             action: #selector(closePopUp),
                                             for: .touchUpInside)
        
        view.ui.genericlLayout(object: animation,
                               parentView: sender,
                               width: 200,
                               height: 200,
                               centerV: 0,
                               centerH: 0)
        
        animation.isHidden = true
        view.layoutIfNeeded()
    }
}


extension LevelController: LevelPopUpDelegate {
    func arrowBtnAction(view: UIView) {
        view.removeFromSuperview()
        let result = PaywallRouter(presenter: self.navigationController).presentPaywall(delegate: self,
                                                                                        place: .goldZero)

        if !result, let ids = PreferencesManager.sharedManager.coinsZero?.idProducts {
            GameRouter(presenter: self.navigationController).presentEnergyPopUp(idProducts: ids,
                                                                                delegate: self)
        }
    }
}

//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension LevelController: PaywallProtocol {
    func paywallActionBack(controller: BaseController) { self.dismiss(animated: true) }
    func paywallSuccess(controller: BaseController) { }
}

//----------------------------------------------
// MARK: - GamePurchasePopProtocol
//----------------------------------------------

extension LevelController: PurchasePopUpProtocol {
    func purchasePopUpSpin(controller: PurchasePopUp) {
        if let tabBarVC = self.tabBarController as? GameTabBarController {
           
            if let energy = KeychainService.standard.me?.energy {
                 
                switch energy{
                case let x where x < 1.0: tabBarVC.actionBack()
                default:  tabBarVC.spin()
                }
            } else { tabBarVC.actionBack()   }
        }
    }
    
    func purchasePopUpClose(controller: PurchasePopUp) {
        if let model = PreferencesManager.sharedManager.localPushs.first(where: {$0.type == .goldZero}) {
            LocalPushManager.sharedManager.sendNotification(title: model.title, body: model.description, idetifier: "goldZero")
        }
    }
    
    func purchasePopUpSuccess(controller: PurchasePopUp) {
        levelView.barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        levelView.barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
    }
}

//----------------------------------------------
// MARK: - LevelFinishDelegate
//----------------------------------------------

extension LevelController: LevelFinishDelegate {
    func nextMap(view: UIView) {
        finishLevelPopUp?.removeFromSuperview()
  
        GameNetworkLayer.shared.nextMap(view: self) {
        if let tabBarVC = self.tabBarController as? GameTabBarController { tabBarVC.spin() }
        }
    }
}

extension LevelController: MainGameOnboardingDelegate {
    func tapBtn() {

        if let tabBarVC = self.tabBarController as? GameTabBarController {
        switch MainGameOnboardingView.stateCounter {
        case 1,4:  levelView.stateBtns[2].sendActions(for: .touchUpInside)
        case 2, 5: buildPopUpVw!.upgradeBtn.sendActions(for: .touchUpInside)
        case 7: tabBarVC.spin()
            onboardingView!.removeFromSuperview()
        default: print("default")
        }
        MainGameOnboardingView.stateCounter += 1
        onboardingView!.removeFromSuperview()

        onboardingView = MainGameOnboardingView(state: MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter],
                                                delegate: self)

        view.ui.genericlLayout(object: onboardingView!,
                               parentView: view,
                               topC: 0,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)

        guard MainGameOnboardingView.stateCounter == 3 || MainGameOnboardingView.stateCounter == 6 else { return }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
            MainGameOnboardingView.stateCounter += 1
            self.onboardingView!.removeFromSuperview()
            self.onboardingView = MainGameOnboardingView(state: MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter],
                                                    delegate: self,
                                                    gameTabBar: tabBarVC)

            self.view.ui.genericlLayout(object: self.onboardingView!,
                                        parentView: self.view,
                                           topC: 0,
                                           bottomC: 0,
                                           leadingC: 0,
                                           trailingC: 0)
        }
      }
    }
}
