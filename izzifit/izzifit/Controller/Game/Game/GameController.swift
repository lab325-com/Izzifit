//
//  GameController.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import UIKit

class GameController: BaseController {
 
    var gameView: SpinGameViewProtocol?
    private var collectionView: UICollectionView?
    private var firstLaunch = true
    private var timerSpinManager: TimerSpinManager!

    
    override func loadView() {
        super.loadView()
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     self.gameView = ArcticGameView()
        case .england_map:  self.gameView = EnglandGameView()
        case .france_map:   self.gameView = FranceGameView()
        case .none:         self.gameView = ArcticGameView()
        }
        
        gameView?.frame = view.bounds
        view.addSubview(gameView ?? UIView())
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GameNetworkLayer.shared.getMap(view: self) {
            self.showCorrectView()
            self.firstLaunch = false
            self.gameView?.checkAvailableHummers()
            self.gameView?.updateHeader()
            self.timerSpinManager = TimerSpinManager(collectionView: self.collectionView ?? UICollectionView(), delegate: self)
            self.timerSpinManager.counter.combinations = GameNetworkLayer.shared.spins ?? [MapSpinsModel]()
        }
        
        AnalyticsHelper.sendFirebaseEvents(events: .spin_open)
        needSoundTap = false
        hiddenNavigationBar = true
        let swipeRight = UISwipeGestureRecognizer(target: self,
                                                  action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard !firstLaunch else { return }
        GameNetworkLayer.shared.getMap(view: self) {
            self.collectionView?.removeFromSuperview()
            self.showCorrectView()
            self.gameView?.checkAvailableHummers()
            self.gameView?.updateHeader()
            self.timerSpinManager = TimerSpinManager(collectionView: self.collectionView ?? UICollectionView(), delegate: self)
            self.timerSpinManager.counter.combinations = GameNetworkLayer.shared.spins ?? [MapSpinsModel]()
        }
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void { actionBack() }
    
    func showCorrectView() {
        gameView?.removeFromSuperview()
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     self.gameView = ArcticGameView()
        case .england_map:  self.gameView = EnglandGameView()
        case .france_map:   self.gameView = FranceGameView()
        case .none:         self.gameView = ArcticGameView()
        }
        
        view.ui.genericlLayout(object: gameView ?? UIView(),
                               parentView: view,
                               topC: 0,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
        
        gameView?.hummerBtn.isHidden = true
        gameView?.hummerCountLbl.isHidden = true
        gameView?.spinBtn.addTarget(self,
                                   action: #selector(spinAction),
                                   for: .touchDown)
        setCollectionView()
    }
    
    private func setCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.h / 12.68,
                                 height: view.h / 4.41)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = view.h / 101.5
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView?.backgroundColor = . clear
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(SlotCollectionCell.self,
                                forCellWithReuseIdentifier: SlotCollectionCell.id)
        
        var width = CGFloat()
        var centerH = CGFloat()
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:     width = view.h / 3.90 ; centerH = view.h / 116
        case .england_map:  width = view.h / 3.70 ; centerH = view.h / 126
        case .france_map:   width = view.hRatio(cH: 220); centerH = view.hRatio(cH: 9)
        case .none:         break
        }
        
        view.ui.genericlLayout(object: collectionView ?? UICollectionView(),
                               parentView: gameView?.slotBackImgVw ?? UIImageView(),
                               width: width,
                               height: view.h / 5.77,
                               centerV: -view.h / 73,
                               centerH: centerH)
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

    
    
    // Spin Methods
    
    @objc func spinAction() {
        if let gameView = gameView {
            timerSpinManager.generalSpin(resultLbl: gameView.startSpinLbl,
                                         resultStackView: gameView.resultStackView,
                                         coinsLbl: gameView.barBackVw.coinsLbl,
                                         energyCountLbl: gameView.barBackVw.energyCountLbl,
                                         spinBtn: gameView.spinBtn,
                                         showProgress: { DispatchQueue.main.async { gameView.showProgress() }}
                                         ,spinsRunOut: spinsRunOut) {
                let result = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .energyZero)

                if !result, let ids = PreferencesManager.sharedManager.enegyZero?.idProducts {
                    GameRouter(presenter: navigationController).presentEnergyPopUp(idProducts: ids, titlePopUp: "Arctic", delegate: self)
                }
            }
            guard !PreferencesManager.sharedManager.gameOnboardingDone  else { return }
            ArcticGameView.counter += 1
            gameView.showProgress()
        }
    }
}


//----------------------------------------------
// MARK: - UICollectionViewDataSource
//----------------------------------------------

extension GameController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotCollectionCell.id, for: indexPath) as! SlotCollectionCell
        cell.section = indexPath.row
        cell.setupCell()
        return cell
    }
}

//----------------------------------------------
// MARK: - SpinAwardProtocol
//----------------------------------------------
extension GameController: SpinAwardProtocol {
    func completeAward(model: [SpinMainModel]) {
        if let tupleAward = gameView?.showAwards(model: model),
           let gameView = gameView {
        
        var spinManager = CombinationsAwardsManager()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let spinTags = self.timerSpinManager.convertSpinTypes(self.timerSpinManager.counter.combinations[self.timerSpinManager.combinationCounter].spinObjectIds)
                if let tupleResult = spinManager.recognizeSetCombinations(spinTags) {
                spinManager.accrueBonuses(by: tupleResult.0,
                                               homeView: gameView,
                                               barBackVw: gameView.barBackVw,
                                               hiddenStack: gameView.resultStackView,
                                               awardImgVw: gameView.awardImgVw,
                                               awardTitleLbl: gameView.awardTitleLbl,
                                               awardCountLbl: gameView.awardCountLbl,
                                               coinsAmount: tupleAward.coinsAward,
                                               spinsAmount: tupleAward.spinsAward) { gameView.threeHummersCombination() }
                gameView.showProgress()
                } else {
                    spinManager.coinBag(in: spinTags,
                                             hiddenStack: gameView.resultStackView,
                                             awardImgVw: gameView.awardImgVw,
                                             awardTitleLbl: gameView.awardTitleLbl,
                                             awardCountLbl: gameView.awardCountLbl,
                                             coinsAmount: tupleAward.coinsAward,
                                             animateCoins: gameView.barBackVw.animateCoins(speed:))
                }
            let lastSpinIndex = self.timerSpinManager.counter.combinations.count - 1
            switch self.timerSpinManager.combinationCounter {
            case lastSpinIndex: self.timerSpinManager.combinationCounter = 0
            default:  self.timerSpinManager.combinationCounter += 1
            }
        }
        let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .afterSpeen)
        }
    }
}

//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension GameController: PaywallProtocol {
    func paywallActionBack(controller: BaseController) { self.dismiss(animated: true) }
    func paywallSuccess(controller: BaseController) { }
}

//----------------------------------------------
// MARK: - PurchasePopUpProtocol
//----------------------------------------------

extension GameController: PurchasePopUpProtocol {
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
        gameView?.updateHeader()
    }
}
