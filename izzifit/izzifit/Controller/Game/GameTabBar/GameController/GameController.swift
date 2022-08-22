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
    var onboardingView: MainGameOnboardingView?
    var autoSpinTimer = Timer()
    var gestureLongTap = 0
    var autoSpinHasUsed = false
    var encourageAnimView: EncourageAnimView?
    var encourageCounterAutoSpin = 0
    var encourageCounterManualSpin = 0
    lazy private var encourageManualSpinBorder: Int = { Int(arc4random_uniform(2) + 5) }()
    
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
            self.onboardingDraw()
            self.activateAutospin(firstLaunch: true)
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
        guard !firstLaunch else {
            return }
        GameNetworkLayer.shared.getMap(view: self) {
            self.collectionView?.removeFromSuperview()
            self.showCorrectView()
            self.gameView?.checkAvailableHummers()
            self.gameView?.updateHeader()
            self.timerSpinManager = TimerSpinManager(collectionView: self.collectionView ?? UICollectionView(), delegate: self)
            self.timerSpinManager.counter.combinations = GameNetworkLayer.shared.spins ?? [MapSpinsModel]()
            self.onboardingDraw()
            self.activateAutospin(firstLaunch: true)
        }
        autoSpinHasUsed = false
        encourageCounterAutoSpin = 0
        encourageCounterManualSpin = 0
    }
    
    @objc func closeEncourageView() {
        encourageAnimView?.removeFromSuperview()
        if let tabBar = parent as? GameTabBarController { tabBar.toggleBtnInteraction() }
        if let gameView = gameView {
            gameView.spinBtn.tag = 0
            // enable tabBar
        }
    }
    
    func onboardingDraw() {
        guard !PreferencesManager.sharedManager.gameOnboardingDone else { return }
        if let tabBarVC = self.tabBarController as? GameTabBarController {
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.onboardingView = MainGameOnboardingView(state: MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter],
                                                             delegate: self,
                                                             gameTabBar: tabBarVC,
                                                             arcGameView: self.gameView)
                
                self.view.ui.genericlLayout(object: self.onboardingView!,
                                            parentView: self.gameView?.animationImgVw ?? UIImageView(),
                                            topC: 0,
                                            bottomC: 0,
                                            leadingC: 0,
                                            trailingC: 0)
            }
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
        gestureLongTap = 0
        if let gameView = gameView {
            gameView.spinBtn.tag = 0
            autoSpinTimer.invalidate()
        }
        
        let alert = UIAlertController(title: "Congratulation",
                                      message: "You can upgrade all the buildings. The new level is coming soon.",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // Spin Methods
    
    func activateAutospin(firstLaunch: Bool) {
        if let gameView = gameView {
            
            switch firstLaunch {
            case true:
                if PreferencesManager.sharedManager.spinsRolledCounter >= 5 {
                gameView.spinBtn.setImage(RImage.spinPressAutospin(), for: .normal)
                gameView.spinBtn.setImage(RImage.spinHold2sec(), for:      .highlighted)
                gameView.spinBtn.addTarget(self, action: #selector(buttonInPressed), for: .touchDown)
   
                let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(long))
                longGesture.minimumPressDuration = 1
                gameView.spinBtn.addGestureRecognizer(longGesture)
            }
            case false:
                if PreferencesManager.sharedManager.spinsRolledCounter == 5 {
                gameView.spinBtn.setImage(RImage.spinPressAutospin(), for: .normal)
                gameView.spinBtn.setImage(RImage.spinHold2sec(), for:      .highlighted)
                gameView.spinBtn.addTarget(self, action: #selector(buttonInPressed), for: .touchDown)
   
                let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(long))
                longGesture.minimumPressDuration = 1
                gameView.spinBtn.addGestureRecognizer(longGesture)
            }
                
            }
   
        }
    }
    
    func showEncourage() {
        
        guard encourageCounterManualSpin == encourageManualSpinBorder else { return }
        // DisableTabbar
        
        if let tabBar = parent as? GameTabBarController { tabBar.toggleBtnInteraction()
            
            encourageCounterManualSpin = 0
            if let gameView = gameView {
                gameView.spinBtn.tag = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) { [self] in
                    encourageAnimView = EncourageAnimView()
                    view.ui.genericlLayout(object: encourageAnimView ?? UIView(),
                                           parentView: tabBar.view,
                                           topC: 0,
                                           bottomC: 0,
                                           leadingC: 0,
                                           trailingC: 0)
                    encourageAnimView?.closeBtn.addTarget(self, action: #selector(closeEncourageView), for: .touchUpInside)
                    encourageAnimView?.okBtn.addTarget(self, action: #selector(closeEncourageView), for: .touchUpInside)
                }
            }
        }
    }
    
    @objc func spinAction() {

        if let gameView = gameView {
            guard gameView.spinBtn.tag == 0 else { return }
            encourageCounterManualSpin += 1
            timerSpinManager.generalSpin(resultLbl: gameView.startSpinLbl,
                                         resultStackView: gameView.resultStackView,
                                         coinsLbl: gameView.barBackVw.coinsLbl,
                                         energyCountLbl: gameView.barBackVw.energyCountLbl,
                                         spinBtn: gameView.spinBtn,
                                         showProgress: { DispatchQueue.main.async { gameView.showProgress() }}
                                         ,spinsRunOut: spinsRunOut) {
                let result = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .energyZero)
                
                if !result, let ids = PreferencesManager.sharedManager.enegyZero?.idProducts { 
                    GameRouter(presenter: navigationController).presentEnergyPopUp(idProducts: ids, delegate: self)
                    gestureLongTap = 0
                    gameView.spinBtn.tag = 0
                    autoSpinTimer.invalidate()
                }
            }
            
            guard !PreferencesManager.sharedManager.gameOnboardingDone else {
                PreferencesManager.sharedManager.spinsRolledCounter += 1
                return}
            ArcticGameView.counter += 1
            gameView.showProgress()
        }
    }
    
    
    @objc func long() {
        gestureLongTap += 1
        guard gestureLongTap == 1 else { return }
        if let gameView = gameView {
            gameView.spinBtn.setImage(RImage.spinCancelAutoSpin(), for: .normal)
            self.autoSpinHasUsed = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                guard self.gestureLongTap != 0 else { return }
                self.autoSpinTimer = Timer.scheduledTimer(timeInterval: 5.0,
                                                          target: self,
                                                          selector: #selector(self.spinAction),
                                                          userInfo: nil,
                                                          repeats: true)
                self.autoSpinTimer.fire()
            }
        }
    }
    
    @objc func buttonInPressed(sender: UIButton) {
        if let gameView = gameView {
            gameView.spinBtn.setImage(RImage.spinPressAutospin(), for: .normal)
            autoSpinTimer.invalidate()
            gestureLongTap = 0
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
    func idleSpin() {
        gestureLongTap = 0
        if let gameView = gameView {
            gameView.spinBtn.setImage(RImage.spinPressAutospin(), for: .normal)
            gameView.spinBtn.tag = 0
            autoSpinTimer.invalidate()
        }
        activateAutospin(firstLaunch: false)
        showEncourage()
    }
    
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
           
                self.timerSpinManager.combinationCounter += 1
                
                self.activateAutospin(firstLaunch: false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    gameView.spinBtn.tag = 0
                    self.showEncourage()
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




//----------------------------------------------
// MARK: - MainGameOnboardingDelegate
//----------------------------------------------

extension GameController: MainGameOnboardingDelegate {
    func tapBtn() {
        
        onboardingView?.removeFromSuperview()
        
        if let tabBarVC = self.tabBarController as? GameTabBarController {
            
            switch MainGameOnboardingView.stateCounter {
            case 8:
                
                if let gameView = gameView {
                    gameView.spinBtn.sendActions(for: .touchDown)
                    MainGameOnboardingView.stateCounter += 1
                    onboardingView = MainGameOnboardingView(state: MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter],
                                                            delegate: self,
                                                            gameTabBar: tabBarVC,
                                                            arcGameView: gameView)
                    
                    view.ui.genericlLayout(object: onboardingView!,
                                           parentView: gameView.animationImgVw,
                                           topC: 0,
                                           bottomC: 0,
                                           leadingC: 0,
                                           trailingC: 0)
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        gameView.spinBtn.sendActions(for: .touchDown)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                        gameView.spinBtn.sendActions(for: .touchDown)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15.0) {
                        gameView.spinBtn.sendActions(for: .touchDown)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
                        self.onboardingView?.removeFromSuperview()
                        MainGameOnboardingView.stateCounter += 1
                        self.onboardingView = MainGameOnboardingView(state: MainGameOnboardingView.gameOnboardStates[MainGameOnboardingView.stateCounter],
                                                                     delegate: self,
                                                                     gameTabBar: tabBarVC,
                                                                     arcGameView: gameView)
                        
                        self.view.ui.genericlLayout(object: self.onboardingView!,
                                                    parentView: gameView.animationImgVw,
                                                    topC: 0,
                                                    bottomC: 0,
                                                    leadingC: 0,
                                                    trailingC: 0)
                        AnalyticsHelper.sendFirebaseEvents(events: .onb_spin_ok)
                    }
                }
            case 10:
                MainGameOnboardingView.stateCounter += 1
                tabBarVC.backBtn.sendActions(for: .touchUpInside)
            default: print("empty")
            }
        }
    }
}
