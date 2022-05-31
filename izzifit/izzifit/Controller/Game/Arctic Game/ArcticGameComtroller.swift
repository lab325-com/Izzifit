//
//  ArcticGameComtroller.swift
//  izzifit
//
//  Created by O l e h on 07.04.2022.
//

import UIKit

class ArcticGameComtroller: BaseController {
    
    private var barBackVw = GameBarBackView(backImage: UIImage(named: "gameBarBack")!)
    
    @IBOutlet weak var gameBackImgVw: UIImageView!
    
    @IBOutlet weak var barBackImgVw: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var slotBackImgVw: UIImageView!
    @IBOutlet weak var spinBtn: UIButton!
    @IBOutlet weak var slotHouseImgVw: UIImageView!
    @IBOutlet weak var resultLbl: UILabel!
    
    @IBOutlet weak var shadowViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var slotHouseImgVwTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultLblTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImgVwTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var hummerBtn: UIButton!
    @IBOutlet weak var hummerCountLbl: UILabel!
    @IBOutlet weak var resultStackView: UIStackView!
    private var progressImgVw = UIImageView()
    
    @IBOutlet weak var awardImgVw: UIImageView!
    @IBOutlet weak var awardTitleLbl: UILabel!
    @IBOutlet weak var awardCountLbl: UILabel!
    private var collectionView: UICollectionView!
    
    private lazy var presenter = ArcticGamePresenter(view: self)
    private var timerSpinManager: TimerSpinManager!
    private var spinManager = CombinationsAwardsManager()
    
    private var gameView: GameView!
    
    let progressImg = UIImage(named: "progressActive")
    
    override func loadView() {
    gameView = GameView()
        self.view = gameView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        avatarImageView.isHidden = true
//        barBackImgVw.isHidden = true
//        view.ui.genericlLayout(object: barBackVw,
//                               parentView: gameBackImgVw,
//                               height: view.h / 9.2,
//                               topC: 0,
//                               leadingC: 0,
//                               trailingC: 0)
//
//        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
//        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
    }
    
    private func setup() {
        spinBtn.setImage(UIImage(named: "spinBtnNormal"), for: .normal)
        spinBtn.setImage(UIImage(named: "spinBtnSelected"), for: .selected)
        resultStackView.isHidden = true
        resultLblTopConstraint.constant =  view.h / 17.65
        resultLbl.font = UIFont(name: "Inter-Black",
                                size: view.h/54.13)
        
        slotHouseImgVwTopConstraint.constant = view.h / 4.51
        slotBackImgVw.centerYAnchor.constraint(equalTo: slotHouseImgVw.centerYAnchor, constant: (view.h / 10.33) / 2).isActive = true
        shadowViewBottomConstraint.constant = view.h / 10
        logoImgVwTopConstraint.constant = view.h / 35.3
        
        awardTitleLbl.font = UIFont(name: "Inter-BoldItalic",
                                    size: view.h / 101.5)
        
        awardCountLbl.font = UIFont(name: "Inter-Bold",
                                    size: view.h/40.6 )
        awardCountLbl.text = "100"
        
        NSLayoutConstraint.activate([
            resultLbl.heightAnchor.constraint(equalToConstant: view.h/54.13),
            resultStackView.centerYAnchor.constraint(equalTo: resultLbl.centerYAnchor),
            resultStackView.centerXAnchor.constraint(equalTo: resultLbl.centerXAnchor),
            awardImgVw.heightAnchor.constraint(equalToConstant: view.h/30.07),
            awardImgVw.widthAnchor.constraint(equalToConstant: view.h/26.19),
            awardTitleLbl.heightAnchor.constraint(equalToConstant: view.h / 100)
        ])
        
        if let name = KeychainService.standard.me?.name {
            barBackVw.nameLbl.text = name
        } else {
            barBackVw.nameLbl.isHidden = true
        }
        
        barBackVw.avatarImgVw.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""),
                                          placeholder: RImage.placeholder_food_ic(),
                                          options: [.transition(.fade(0.25))])
        
        view.ui.genericlLayout(object: progressImgVw,
                               parentView: view,
                               width: view.h / 4.77,
                               height: view.h / 40.6,
                               bottomToO: slotHouseImgVw.bottomAnchor,
                               bottomCG: view.h / 50.75,
                               trailingToO: slotHouseImgVw.trailingAnchor,
                               trailingCG: view.h / 8.54)
        
        timerSpinManager.combinationManager.showProgress(imgVw: progressImgVw,
                                                         img: progressImg ?? UIImage())
    }
    
    private func checkAvailableHummers() {
        hummerBtn.isUserInteractionEnabled = false
        guard let count = presenter.freeBuildingsCount else { return }
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
    
    override func viewDidLoad() {
//        setCollectionView()
//        hummerBtn.isHidden = true
//        hummerCountLbl.isHidden = true
//        AnalyticsHelper.sendFirebaseEvents(events: .spin_open)
//        needSoundTap = false
//        hiddenNavigationBar = true
//        super.viewDidLoad()
//        timerSpinManager = TimerSpinManager(collectionView: collectionView,
//                                            presenter: presenter)
//        DispatchQueue.main.async {
//            self.presenter.getMap { spins in
//                self.checkAvailableHummers()
//                self.timerSpinManager.counter.combinations = spins
//            }
//        }
//        setup()
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
//        swipeRight.direction = .right
//        self.view.addGestureRecognizer(swipeRight)
    }
    
    func threeHummersCombination() {
        guard var count = presenter.freeBuildingsCount else { return }
        count += 1
        hummerCountLbl.text = "x\(count)"
        hummerBtn.isHidden = false
        hummerCountLbl.isHidden = false
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        actionBack()
    }
    
    private func setCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.h / 12.01,
                                 height: view.h / 4.41)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = view.h / 81.2
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        collectionView.backgroundColor = . clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SlotCollectionCell.self,
                                forCellWithReuseIdentifier: SlotCollectionCell.id)
        
        view.ui.genericlLayout(object: collectionView,
                               parentView: slotBackImgVw,
                               width: view.h / 3.60,
                               height: view.h / 5.77,
                               centerV: -view.h / 48,
                               centerH: view.h / 81.2)
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
    
    @IBAction func spinAction(_ sender: Any) {
        
        timerSpinManager.generalSpin(resultLbl: resultLbl,
                                     resultStackView: resultStackView,
                                     coinsLbl: barBackVw.coinsLbl,
                                     energyCountLbl: barBackVw.energyCountLbl,
                                     spinBtn: spinBtn,
                                     showProgress: { DispatchQueue.main.async {
            self.spinManager.showProgress(imgVw: self.progressImgVw,
                                          img: self.progressImg ?? UIImage())
        }
        },spinsRunOut: spinsRunOut) {
            let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .energyZero)
        }
    }
}

extension ArcticGameComtroller: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotCollectionCell.id, for: indexPath) as! SlotCollectionCell
        cell.section = indexPath.row
        cell.setupCell(model: presenter.maps)
        return cell
    }
}

//----------------------------------------------
// MARK: - ArcticGameOutputProtocol
//----------------------------------------------

extension ArcticGameComtroller: ArcticGameOutputProtocol {
    
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
                                               hiddenStack: self.resultStackView,
                                               awardImgVw: self.awardImgVw,
                                               awardTitleLbl: self.awardTitleLbl,
                                               awardCountLbl: self.awardCountLbl,
                                               coinsAmount: coinsAmount,
                                               spinsAmount: spinsAmount) { self.threeHummersCombination() }
                
                self.spinManager.showProgress(imgVw: self.progressImgVw,
                                              img: self.progressImg ?? UIImage())
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

extension ArcticGameComtroller: PaywallProtocol {
    func paywallActionBack(controller: BaseController) {
        self.dismiss(animated: true)
    }
    
    func paywallSuccess(controller: BaseController) { }
}

