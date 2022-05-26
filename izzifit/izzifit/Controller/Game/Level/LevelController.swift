//
//  LevelController.swift
//  izzifit
//
//  Created by O l e h on 14.04.2022.
//

import UIKit
import Gifu
import SwiftUI

class LevelController: BaseController {
    
    private var barBackVw = GameBarBackView(backImage: UIImage(named: "levelShadowViewBack")!)
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var shipBtn: UIButton!
    @IBOutlet weak var fishBtn: UIButton!
    @IBOutlet weak var igluBtn: UIButton!
    @IBOutlet weak var goldBtn: UIButton!
    @IBOutlet weak var deerBtn: UIButton!
    
    let animation = GIFImageView()
    
    @IBOutlet weak var hummerBtn: UIButton!
    @IBOutlet weak var hummerCountLbl: UILabel!
    
    private var buildPopUpVw = BuildPopUpView()
    
    private lazy var btns = [shipBtn,
                             fishBtn,
                             igluBtn,
                             goldBtn,
                             deerBtn]
    
    private var player = PlayerModel(shipState: .start,
                                     fishState: .finish,
                                     igluState: .fourth,
                                     goldState: .third,
                                     deerState: .second)
    
    private var pointers: PointersAndTicks?
    private var firstRespond = true
    
    private lazy var presenter = LevelPresenter(view: self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hummerBtn.isUserInteractionEnabled = false
        
        view.ui.genericlLayout(object: barBackVw,
                               parentView: self.view,
                               height: view.h / 9.2,
                               topC: 0,
                               leadingC: 0,
                               trailingC: 0)
        
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(KeychainService.standard.me?.energy ?? 0)"
        
        buildPopUpVw.hummerBtn.isHidden = true
        buildPopUpVw.hummerCountLbl.isHidden = true
        checkAvailableHummers()
    }
    
    override func viewDidLoad() {
        needSoundTap = false
        super.viewDidLoad()
        presenter.getBuildings{ [self] in
            if firstRespond {
                firstRespond.toggle()
                pointers = PointersAndTicks()
                if let x = pointers {
                    x.drawPointers(model: player, btns: btns)
                }
            }
        }
        setup()
        hiddenNavigationBar = true
        activateAnimation()
        addTargets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let x = (439 - UIScreen.main.bounds.size.width) / 2
        self.scrollView.setContentOffset(CGPoint(x: x,
                                                 y: 0),
                                         animated: true)
    }
    
    private func checkAvailableHummers() {
        guard let count = presenter.freeBuildingsCount else { return}
        switch count {
        case 0:
            hummerBtn.isHidden = true
            hummerCountLbl.isHidden = true
        default:
            hummerBtn.isHidden = false
            hummerCountLbl.isHidden = false
            hummerCountLbl.text = "x\(count)"
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
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Sorry",
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        alert.addAction(okAction)
        present(alert,animated: true)
    }
    
    @objc
    func showPopUp(sender: UIButton) {
        
        var price = Int()
        var buildType: BuildingType
        
        switch sender.tag {
        case 0: price = player.shipState.rawValue
            buildType = .ship
        case 1: price = player.fishState.rawValue
            buildType = .fishing
        case 2: price = player.igluState.rawValue
            buildType = .house
        case 3: price = player.goldState.rawValue
            buildType = .hay
        case 4: price = player.deerState.rawValue
            buildType = .sled
        default: buildType = .ship
        }
        
        guard price != 0 else { return }
        
        guard KeychainService.standard.me?.coins ?? 0 >= price || presenter.freeBuildingsCount ?? 0 > 0  else {
            showAlert(message: "You don't have enough money")
            let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .goldZero)
            return
        }
        
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
        
        buildPopUpVw.hummerBtn.addTarget(self,
                                         action: #selector(useFreeHummer),
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
    
    @objc func useFreeHummer() {
        AnalyticsHelper.sendFirebaseEvents(events: .map_hummer_use)
        buildPopUpVw.priceLbl.text = "Free"
        guard var count = presenter.freeBuildingsCount else { return }
        presenter.freeBuildingsCount! -= 1
        count -= 1
        
        switch count {
        case 0:
            buildPopUpVw.hummerBtn.isHidden = true
            buildPopUpVw.hummerCountLbl.isHidden = true
        default:
            buildPopUpVw.hummerCountLbl.text = "x\(count)"
        }
    }
    
    @objc func closePopUp() { buildPopUpVw.removeFromSuperview()
        buildPopUpVw.reloadInputViews()
    }
    
    @objc func upgradeBuilding(sender: UIButton) {
        for btn in btns {
            btn?.isUserInteractionEnabled.toggle()
        }
        guard let buildingId = presenter.buildings[safe: sender.tag]?.id else {return}
        
        buildPopUpVw.removeFromSuperview()
        view.layoutIfNeeded()
        animation.isHidden.toggle()
        animation.startAnimatingGIF()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
            self.animation.stopAnimatingGIF()
            self.animation.isHidden.toggle()
            self.animation.removeFromSuperview()
            
            var price = Int()
            var buildType: BuildingType
            
            switch sender.tag {
            case 0: price = self.player.shipState.rawValue
                buildType = .ship
            case 1: price = self.player.fishState.rawValue
                buildType = .fishing
            case 2: price = self.player.igluState.rawValue
                buildType = .house
            case 3: price = self.player.goldState.rawValue
                buildType = .hay
            case 4: price = self.player.deerState.rawValue
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
            
            for btn in self.btns {
                btn?.isUserInteractionEnabled.toggle()
            }
            if let points = self.pointers {
                for imgVw in  points.imgVwArray {
                    imgVw.removeFromSuperview()
                }
            }
            self.pointers = PointersAndTicks()
            if let x = self.pointers {
                x.drawPointers(model: self.player, btns: self.btns)
            }
        }
        
        buildPopUpVw.removeFromSuperview()
        presenter.upgradeBuild(buildingId: buildingId)
    }
    
    private func activateAnimation() {
        animation.prepareForAnimation(withGIFNamed: "construction3")
        animation.isHidden.toggle()
    }
    
    private func setup() {
        
        for i in 0...4 {
            btns[i]?.tag = i
        }
        if let name = KeychainService.standard.me?.name {
            barBackVw.nameLbl.text = name
        } else {
            barBackVw.nameLbl.isHidden = true
        }
        barBackVw.avatarImgVw.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""),
                                          placeholder: RImage.placeholder_food_ic(),
                                          options: [.transition(.fade(0.25))])
    }
    
    
    private func drawStates() {
        
        switch player.shipState {
        case .start: shipBtn.setImage(view.image(img: .shipStart),for: .normal)
        case .first: shipBtn.setImage(view.image(img: .shipFirst), for: .normal)
        case .second: shipBtn.setImage(view.image(img: .shipSecond),for: .normal)
        case .third: shipBtn.setImage(view.image(img: .shipThird),for: .normal)
        case .fourth: shipBtn.setImage(view.image(img: .shipFourth), for: .normal)
        case .finish: shipBtn.setImage(view.image(img: .shipFinish),for: .normal)
        }
        
        switch player.fishState {
        case .start: fishBtn.setImage(view.image(img: .fishStart), for: .normal)
        case .first: fishBtn.setImage(view.image(img: .fishFirst),for: .normal)
        case .second: fishBtn.setImage(view.image(img: .fishSecond),for: .normal)
        case .third: fishBtn.setImage(view.image(img: .fishThird),for: .normal)
        case .fourth: fishBtn.setImage(view.image(img: .fishFourth),for: .normal)
        case .finish: fishBtn.setImage(view.image(img: .fishFinish),for: .normal)
        }
        
        switch player.igluState {
        case .start: igluBtn.setImage(view.image(img: .igluStart),for: .normal)
        case .first: igluBtn.setImage(view.image(img: .igluFirst),for: .normal)
        case .second: igluBtn.setImage(view.image(img: .igluSecond),for: .normal)
        case .third: igluBtn.setImage(view.image(img: .igluThird), for: .normal)
        case .fourth: igluBtn.setImage(view.image(img: .igluFourth),for: .normal)
        case .finish: igluBtn.setImage(view.image(img: .igluFinish), for: .normal)
        }
        
        switch player.goldState {
        case .start: goldBtn.setImage(view.image(img: .goldStart),for: .normal)
        case .first: goldBtn.setImage(view.image(img: .goldFirst), for: .normal)
        case .second: goldBtn.setImage(view.image(img: .goldSecond),for: .normal)
        case .third: goldBtn.setImage(view.image(img: .goldThird),for: .normal)
        case .fourth: goldBtn.setImage(view.image(img: .goldFourth),for: .normal)
        case .finish: goldBtn.setImage(view.image(img: .goldFinish),for: .normal)
        }
        
        switch player.deerState {
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
            case BuildingType.ship.rawValue: player.shipState = state
            case BuildingType.fishing.rawValue: player.fishState = state
            case BuildingType.house.rawValue: player.igluState = state
            case BuildingType.hay.rawValue: player.goldState = state
            case BuildingType.sled.rawValue: player.deerState = state
            default: break
            }
        }
        drawStates()

        let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .upgraidBuilding)
    }
    
    func successBuild() { }
    
    func successMe() {
        
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
    }
}

//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension LevelController: PaywallProtocol {
    func paywallActionBack(controller: BaseController) {
        self.dismiss(animated: true)
    }
    
    func paywallSuccess(controller: BaseController) {
        
    }
}



