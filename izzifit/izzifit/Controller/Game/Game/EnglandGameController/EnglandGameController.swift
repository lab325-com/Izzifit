//
//  EnglandGameController.swift
//  izzifit
//
//  Created by O l e h on 02.06.2022.
//

import UIKit

class EnglandGameController: BaseController {
    
    private lazy var presenter = ArcticGamePresenter(view: self)
    private var timerSpinManager: TimerSpinManager!
    private var spinManager = CombinationsAwardsManager()
    
    private var gameView: EnglandGameView!
    private var collectionView: UICollectionView!

 
    override func loadView() {
        gameView = EnglandGameView()
        self.view = gameView
        setCollectionView()
    }
    
    override func viewDidLoad() {
        
      
        
        AnalyticsHelper.sendFirebaseEvents(events: .spin_open)
        needSoundTap = false
        hiddenNavigationBar = true
        super.viewDidLoad()
        timerSpinManager = TimerSpinManager(collectionView: collectionView,
                                            presenter: presenter)
        DispatchQueue.main.async {
            self.presenter.getMap { spins in
                self.checkAvailableHummers()
                self.timerSpinManager.counter.combinations = spins
            }
        }
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        gameView.spinBtn.addTarget(self, action: #selector(spinAction), for: .touchUpInside)
        
        let vc = PurchasePopUp()
        present(vc, animated: true)
    }
    
    private func setCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.h / 12.01,
                                 height: view.h / 4.41)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = view.h / 162.4
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        collectionView.backgroundColor = . clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SlotCollectionCell.self,
                                forCellWithReuseIdentifier: SlotCollectionCell.id)
        
        view.ui.genericlLayout(object: collectionView,
                               parentView: gameView.slotBackImgVw,
                               width: view.h / 3.60,
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
                                     showProgress: { DispatchQueue.main.async {  self.gameView.showProgress() }}
                                     ,spinsRunOut: spinsRunOut) {
            let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .energyZero)
        }
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        actionBack()
    }
    
    func threeHummersCombination() {
        guard var count = presenter.freeBuildingsCount else { return }
        count += 1
        gameView.hummerCountLbl.text = "x\(count)"
        gameView.hummerBtn.isHidden = false
        gameView.hummerCountLbl.isHidden = false
    }
    
    private func checkAvailableHummers() {
        gameView.hummerBtn.isUserInteractionEnabled = false
        guard let count = presenter.freeBuildingsCount else { return }
        switch count {
        case 0:
            gameView.hummerBtn.isHidden = true
            gameView.hummerCountLbl.isHidden = true
        default:
            gameView.hummerBtn.isHidden = false
            gameView.hummerCountLbl.isHidden = false
            gameView.hummerCountLbl.text = "x\(count)"
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

extension EnglandGameController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotCollectionCell.id, for: indexPath) as! SlotCollectionCell
        cell.section = indexPath.row
        cell.setupCell(model: presenter.maps, game: .england)
        return cell
    }
}

//----------------------------------------------
// MARK: - EnglandGameOutputProtocol
//----------------------------------------------

extension EnglandGameController: ArcticGameOutputProtocol {
    
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
            case .spinObjectRewardTypeBuild:
                let alert = UIAlertController(title: "Free Building",
                                              message: "This could be your design",
                                              preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            case .__unknown(_): print("")
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            if let tupleResult = self.spinManager.recognizeSetCombinations(self.timerSpinManager.counter.combinations[self.timerSpinManager.combinationCounter].spinObjectIds) {
                self.spinManager.accrueBonuses(by: tupleResult.0,
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
    
    func success() { collectionView.reloadData() }
}

//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension EnglandGameController: PaywallProtocol {
    func paywallActionBack(controller: BaseController) { self.dismiss(animated: true) }
    func paywallSuccess(controller: BaseController) { }
}
