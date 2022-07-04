//
//  GameController.swift
//  izzifit
//
//  Created by O l e h on 01.06.2022.
//

import UIKit

class ArcticGameController: BaseController {
    
    private lazy var presenter = ArcticGamePresenter(view: self)
    private var timerSpinManager: TimerSpinManager!
    private var spinManager = CombinationsAwardsManager()
    
    private var gameView: ArcticGameView!
    private var collectionView: UICollectionView!
    
    override func loadView() {
        gameView = ArcticGameView()
        self.view = gameView
        gameView.hummerBtn.isHidden = true
        gameView.hummerCountLbl.isHidden = true
        setCollectionView()
    }
    
    override func viewDidLoad() {
        AnalyticsHelper.sendFirebaseEvents(events: .spin_open)
        needSoundTap = false
        hiddenNavigationBar = true
        super.viewDidLoad()
        timerSpinManager = TimerSpinManager(collectionView: collectionView,
                                            presenter: presenter)
        presenter.getMap()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
     
        gameView.spinBtn.addTarget(self, action: #selector(spinAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkAvailableHummers()
        gameView.updateHeader()
    }
    
    private func setCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.h / 12.68,
                                 height: view.h / 4.41)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = view.h / 101.5
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView.backgroundColor = . clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SlotCollectionCell.self,
                                forCellWithReuseIdentifier: SlotCollectionCell.id)
        
        view.ui.genericlLayout(object: collectionView,
                               parentView: gameView.slotBackImgVw,
                               width: view.h / 3.90,
                               height: view.h / 5.77,
                               centerV: -view.h / 73,
                               centerH: view.h / 116)
    }
    
    @objc func spinAction() {
        timerSpinManager.generalSpin(resultLbl: gameView.startSpinLbl,
                                     resultStackView: gameView.resultStackView,
                                     coinsLbl: gameView.barBackVw.coinsLbl,
                                     energyCountLbl: gameView.barBackVw.energyCountLbl,
                                     spinBtn: gameView.spinBtn,
                                     showProgress: { DispatchQueue.main.async { self.gameView.showProgress() }}
                                     ,spinsRunOut: spinsRunOut) {
            let result = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .energyZero)

            if !result, let ids = PreferencesManager.sharedManager.enegyZero?.idProducts {
                GameRouter(presenter: navigationController).presentEnergyPopUp(idProducts: ids, titlePopUp: "Arctic", delegate: self)
            }
        }
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void { actionBack() }
    
    func threeHummersCombination() {
        presenter.freeBuildingsCount += 1
        gameView.hummerCountLbl.text = "x\(presenter.freeBuildingsCount)"
        gameView.hummerBtn.isHidden = false
        gameView.hummerCountLbl.isHidden = false
    }
    
    private func checkAvailableHummers() {
        gameView.hummerBtn.isUserInteractionEnabled = false
        switch presenter.freeBuildingsCount {
        case 0:
            gameView.hummerBtn.isHidden = true
            gameView.hummerCountLbl.isHidden = true
        default:
            gameView.hummerBtn.isHidden = false
            gameView.hummerCountLbl.isHidden = false
            gameView.hummerCountLbl.text = "x\(presenter.freeBuildingsCount)"
        }
    }
    
    private func spinsRunOut() {
        let alert = UIAlertController(title: "Congratulation",
                                      message: "You can upgrade all the buildings. The new level is coming soon.",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


extension ArcticGameController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotCollectionCell.id, for: indexPath) as! SlotCollectionCell
        cell.section = indexPath.row
        cell.setupCell(model: presenter.maps, game: .arctic)
        return cell
    }
}

//----------------------------------------------
// MARK: - ArcticGameOutputProtocol
//----------------------------------------------

extension ArcticGameController: ArcticGameOutputProtocol {
    
    func successUpgrade() {}
    
    func successSpin(model: [SpinMainModel]) {
        var coinsAmount = Int()
        var spinsAmount = Int()
        for award in model {
            switch award.type {
            case .spinObjectRewardTypeCoin:
                KeychainService.standard.me?.coins! += award.amount
                coinsAmount = award.amount
            case .spinObjectRewardTypeEnergy:
                KeychainService.standard.me?.energy! += Float(award.amount)
                spinsAmount = award.amount
            case .spinObjectRewardTypeBuild: print("")
            case .__unknown(_): print("")
            }
        }
        gameView.startSpinLbl.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let spinTags = self.timerSpinManager.convertSpinTypes(self.timerSpinManager.counter.combinations[self.timerSpinManager.combinationCounter].spinObjectIds)
                if let tupleResult = self.spinManager.recognizeSetCombinations(spinTags) {
                self.spinManager.accrueBonuses(by: tupleResult.0,
                                               homeView: self.gameView,
                                               hiddenStack: self.gameView.resultStackView,
                                               awardImgVw: self.gameView.awardImgVw,
                                               awardTitleLbl: self.gameView.awardTitleLbl,
                                               awardCountLbl: self.gameView.awardCountLbl,
                                               coinsAmount: coinsAmount,
                                               spinsAmount: spinsAmount) { self.threeHummersCombination() }
                self.gameView.showProgress()
            }
            let lastSpinIndex = self.timerSpinManager.counter.combinations.count - 1
            switch self.timerSpinManager.combinationCounter {
            case lastSpinIndex: self.timerSpinManager.combinationCounter = 0
            default:  self.timerSpinManager.combinationCounter += 1
            }
        }
        let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .afterSpeen)
    }
    
    func success(map: MapModel) {
        checkAvailableHummers()
        timerSpinManager.counter.combinations = map.map2.spins
        collectionView.reloadData()
    }
}

//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension ArcticGameController: PaywallProtocol {
    func paywallActionBack(controller: BaseController) { self.dismiss(animated: true) }
    func paywallSuccess(controller: BaseController) { }
}

//----------------------------------------------
// MARK: - PurchasePopUpProtocol
//----------------------------------------------

extension ArcticGameController: PurchasePopUpProtocol {
    func purchasePopUpSpin(controller: PurchasePopUp) {
        
        /// сделай тоже самое по англии
        if let tabBarVC = self.tabBarController as? GameTabBarController {
           
            NotificationCenter.default.post(name: Constants.Notifications.openWorkoutNotification,
                                            object: self,
                                            userInfo: nil)
            tabBarVC.actionBack()
        }
    }
    
    func purchasePopUpClose(controller: PurchasePopUp) {
        if let model = PreferencesManager.sharedManager.localPushs.first(where: {$0.type == .energyZero}) {
            LocalPushManager.sharedManager.sendNotification(title: model.title, body: model.description, idetifier: "energyZero")
        }
    }
    
    func purchasePopUpSuccess(controller: PurchasePopUp) {
        gameView.updateHeader()
    }
}
