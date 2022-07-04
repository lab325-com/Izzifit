//
//  LevelController.swift
//  izzifit
//
//  Created by O l e h on 14.04.2022.
//

import UIKit
import SwiftUI

class LevelController: BaseController {
    
    private var barBackVw = GameBarBackView(backImage: UIImage(named: "levelShadowViewBack")!)
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var shipBtn: UIButton!
    @IBOutlet weak var fishBtn: UIButton!
    @IBOutlet weak var igluBtn: UIButton!
    @IBOutlet weak var goldBtn: UIButton!
    @IBOutlet weak var deerBtn: UIButton!
    
    let animation = UIImageView()
    
    @IBOutlet weak var hummerBtn: UIButton!
    @IBOutlet weak var hummerCountLbl: UILabel!
    
    private var buildPopUpVw: LevelPopUpView?
    
    private lazy var btns = [shipBtn,
                             fishBtn,
                             igluBtn,
                             goldBtn,
                             deerBtn]
    
    private var player = PlayerModel()
    
    private var pointers = PointersAndTicks()
    private var firstRespond = true
    private lazy var presenter = LevelPresenter(view: self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hummerBtn.isUserInteractionEnabled = false
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
    }
    
    override func viewDidLoad() {
        hummerBtn.isHidden = true
        hummerCountLbl.isHidden = true
        needSoundTap = false
        super.viewDidLoad()
        presenter.getBuildings()
        view.ui.genericlLayout(object: barBackVw,
                               parentView: self.view,
                               height: view.h / 9.2,
                               topC: 0,
                               leadingC: 0,
                               trailingC: 0)
        setup()
        hiddenNavigationBar = true
        addTargets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkAvailableHummers()
        let x = (439 - UIScreen.main.bounds.size.width) / 2
        self.scrollView.setContentOffset(CGPoint(x: x,
                                                 y: 0),
                                         animated: true)
    }
    
    private func checkAvailableHummers() {
        switch presenter.freeBuildingsCount {
        case 0:
            hummerBtn.isHidden = true
            hummerCountLbl.isHidden = true
        default:
            hummerBtn.isHidden = false
            hummerCountLbl.isHidden = false
            hummerCountLbl.text = "x\(presenter.freeBuildingsCount)"
        }
    }
    
    private func addTargets() {
        for btn in btns {
            guard let bt = btn else {return}
            bt.addTarget(self,
                         action: #selector(showPopUp(sender:)),
                         for: .touchUpInside)
        }
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
        
        if presenter.freeBuildingsCount  > 0 {
            // здесь рисуй попАп за молоточек
            drawBuildPopUp(price: price,
                           buildType: buildType,
                           popType: .buildPopType,
                           sender: sender)
            buildPopUpVw!.priceLbl.text = "Free"
        }
        
        guard KeychainService.standard.me?.coins ?? 0 >= price else {
            if presenter.freeBuildingsCount  <= 0 {
                drawBuildPopUp(price: price,
                               buildType: buildType,
                               popType: .notEnoughMoney,
                               sender: sender)
            }
            return
        }
        guard presenter.freeBuildingsCount  == 0 else { return }
        // тут малюй попАп за монети
        drawBuildPopUp(price: price,
                       buildType: buildType,
                       popType: .buildPopType,
                       sender: sender)
    }
    
    func drawBuildPopUp(price: Int,
                        buildType: BuildingType,
                        popType: LevelPopType,
                        sender: UIButton) {
       
        buildPopUpVw = nil
        buildPopUpVw = LevelPopUpView(popType: popType,
                                      title: "Arctic",
                                      mapName: .england_map,
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
        
            switch presenter.freeBuildingsCount {
            case 0:
                buildPopUpVw.hummerImgVw.isHidden = true
                buildPopUpVw.hummerCountLbl.isHidden = true
            default:
                buildPopUpVw.hummerImgVw.isHidden = false
                buildPopUpVw.hummerCountLbl.isHidden = false
                buildPopUpVw.hummerCountLbl.text = "x\(presenter.freeBuildingsCount)"
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
        
        view.ui.genericlLayout(object: animation,
                               parentView: sender,
                               width: 200,
                               height: 200,
                               centerV: 0,
                               centerH: 0)
        animation.isHidden = true
        view.layoutIfNeeded()
    }
    
    @objc func closePopUp() {
        guard let buildPopUpVw = buildPopUpVw else { return }
        buildPopUpVw.removeFromSuperview()
    }
    
    @objc func upgradeBuilding(sender: UIButton) {
   
        for btn in btns {
            btn?.isUserInteractionEnabled.toggle()
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
        
        let building = presenter.buildings.filter({ $0.name == buildingName })
        
        guard let buildingId = building.first?.id else { return }
        guard let buildPopUpVw = buildPopUpVw else { return }
        buildPopUpVw.removeFromSuperview()
        view.layoutIfNeeded()
        animation.prepareAnimation(name: "construction3", loopRepeated: true)
        animation.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) { [self] in
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
            player.updateState(buildType: buildType, currentState: state!)
            
            for btn in self.btns {
                btn?.isUserInteractionEnabled.toggle()
            }
        
            for imgVw in  pointers.imgVwArray { imgVw.removeFromSuperview()}
       
            pointers.drawPointers(model: self.player, btns: self.btns)
            presenter.upgradeBuild(buildingId: buildingId)
        }
    }
    
    
    private func setup() {
        
        for i in 0...4 {
            btns[i]?.tag = i
        }
        if let name = KeychainService.standard.me?.name { barBackVw.nameLbl.text = name }
        else { barBackVw.nameLbl.isHidden = true }
        barBackVw.avatarImgVw.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""),
                                          placeholder: RImage.placeholder_food_ic(),
                                          options: [.transition(.fade(0.25))])
    }
    
    private func drawStates() {
        
        switch player.firstState {
        case .start: shipBtn.setImage(view.image(img: .shipStart),for: .normal)
        case .first: shipBtn.setImage(view.image(img: .shipFirst), for: .normal)
        case .second: shipBtn.setImage(view.image(img: .shipSecond),for: .normal)
        case .third: shipBtn.setImage(view.image(img: .shipThird),for: .normal)
        case .fourth: shipBtn.setImage(view.image(img: .shipFourth), for: .normal)
        case .finish: shipBtn.setImage(view.image(img: .shipFinish),for: .normal)
        }
        
        switch player.secondState {
        case .start: fishBtn.setImage(view.image(img: .fishStart), for: .normal)
        case .first: fishBtn.setImage(view.image(img: .fishFirst),for: .normal)
        case .second: fishBtn.setImage(view.image(img: .fishSecond),for: .normal)
        case .third: fishBtn.setImage(view.image(img: .fishThird),for: .normal)
        case .fourth: fishBtn.setImage(view.image(img: .fishFourth),for: .normal)
        case .finish: fishBtn.setImage(view.image(img: .fishFinish),for: .normal)
        }
        
        switch player.thirdState {
        case .start: igluBtn.setImage(view.image(img: .igluStart),for: .normal)
        case .first: igluBtn.setImage(view.image(img: .igluFirst),for: .normal)
        case .second: igluBtn.setImage(view.image(img: .igluSecond),for: .normal)
        case .third: igluBtn.setImage(view.image(img: .igluThird), for: .normal)
        case .fourth: igluBtn.setImage(view.image(img: .igluFourth),for: .normal)
        case .finish: igluBtn.setImage(view.image(img: .igluFinish), for: .normal)
        }
        
        switch player.fourthState {
        case .start: goldBtn.setImage(view.image(img: .goldStart),for: .normal)
        case .first: goldBtn.setImage(view.image(img: .goldFirst), for: .normal)
        case .second: goldBtn.setImage(view.image(img: .goldSecond),for: .normal)
        case .third: goldBtn.setImage(view.image(img: .goldThird),for: .normal)
        case .fourth: goldBtn.setImage(view.image(img: .goldFourth),for: .normal)
        case .finish: goldBtn.setImage(view.image(img: .goldFinish),for: .normal)
        }
        
        switch player.fifthState {
        case .start: deerBtn.setImage(view.image(img: .deersStart), for: .normal)
        case .first: deerBtn.setImage(view.image(img: .deersFirst), for: .normal)
        case .second: deerBtn.setImage(view.image(img: .deersSecond),for: .normal)
        case .third: deerBtn.setImage(view.image(img: .deersThird), for: .normal)
        case .fourth: deerBtn.setImage(view.image(img: .deersFourth),for: .normal)
        case .finish: deerBtn.setImage(view.image(img: .deersFinish),for: .normal)
        }
    }
}

extension LevelController: LevelOutputProtocol {
    
    func success() { }
    
    func successBuildings(model: [BuildingsModel]) {
        checkAvailableHummers()
        drawStates()
            pointers.drawPointers(model: player, btns: btns)
        
        let maxLevel = player.checkMaxLevel()
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
            case BuildingType.building1.rawValue: player.firstState = state
            case BuildingType.building2.rawValue: player.secondState = state
            case BuildingType.building3.rawValue: player.thirdState = state
            case BuildingType.building4.rawValue: player.fourthState = state
            case BuildingType.building5.rawValue: player.fifthState = state
            default: break
            }
        }
        guard !maxLevel else { return }
        drawStates()
        pointers.drawPointers(model: player, btns: btns)
    }
    
    func successBuild() {
        let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .upgraidBuilding)
        let maxLevel = player.checkMaxLevel()
        guard maxLevel else { return }
        
        let finishLevelPopUp = LevelFinishView(title: "Arctic",
                                               delegate: self)
        view.ui.genericlLayout(object: finishLevelPopUp,
                               parentView: view,
                               topC: 0,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
    }
    
    func successMe() {
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
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
            tabBarVC.spin()
        }
    }
    
    func purchasePopUpClose(controller: PurchasePopUp) {
        if let model = PreferencesManager.sharedManager.localPushs.first(where: {$0.type == .goldZero}) {
            LocalPushManager.sharedManager.sendNotification(title: model.title, body: model.description, idetifier: "goldZero")
        }
    }
    
    func purchasePopUpSuccess(controller: PurchasePopUp) {
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
    }
}

//----------------------------------------------
// MARK: - LevelFinishDelegate
//----------------------------------------------


extension LevelController: LevelFinishDelegate {
    func nextMap(view: UIView) {
        PreferencesManager.sharedManager.currentMapName = .england_map
        NotificationCenter.default.post(name: Constants.Notifications.endRemoteConfigEndNotification,
                                        object: self,
                                        userInfo: nil)
        if let tabBarVC = self.tabBarController as? GameTabBarController {
            tabBarVC.spin()
        }
    }
}

extension LevelController: LevelPopUpDelegate {
    func arrowBtnAction(view: UIView) {
        view.removeFromSuperview()
        let result = PaywallRouter(presenter: self.navigationController).presentPaywall(delegate: self, place: .goldZero)

        if !result, let ids = PreferencesManager.sharedManager.coinsZero?.idProducts {
            GameRouter(presenter: self.navigationController).presentEnergyPopUp(idProducts: ids, titlePopUp: "Arctic", delegate: self)
        }
    }
}
