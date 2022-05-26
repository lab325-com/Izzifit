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
    @IBOutlet weak var spinBtn: UIButton! {
        didSet {
            spinBtn.setImage(UIImage(named: "spinBtnNormal"), for: .normal)
            spinBtn.setImage(UIImage(named: "spinBtnSelected"), for: .selected)
        }
    }
    
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
    // Рассмотри возможность реализации без таймеров, а просто через цикл и asyncAfter
    private var firstTimerCount = 152
    private var secondTimerCount = 152
    private var thirdTimerCount = 152
    
    var table1ContentOffset: CGFloat = 0
    var table2ContentOffset: CGFloat = 0
    var table3ContentOffset: CGFloat = 0
    private lazy var presenter = ArcticGamePresenter(view: self)
    
    private var firstTimer = Timer()
    private var secondTimer = Timer()
    private var thirdTimer = Timer()
    private var spinManager = SpinLogicManager()
    var countOfStrides: CGFloat = 0
    
    let progressImg = UIImage(named: "progressActive")
    
    private lazy var table1: UITableView = {
        guard let cell = collectionView.cellForItem(at: [0,0]) as? SlotCollectionCell else { return UITableView() }
        return cell.tableView
    }()
    
    private lazy var table2: UITableView = {
        guard let cell = collectionView.cellForItem(at: [0,1]) as? SlotCollectionCell else { return UITableView() }
        return cell.tableView    }()
    
    private lazy var table3: UITableView = {
        guard let cell = collectionView.cellForItem(at: [0,2]) as? SlotCollectionCell else { return UITableView() }
        return cell.tableView
    }()
    
    private lazy var counter: OffsetCounter = {
        OffsetCounter(strideOffset: table1.sizeHeight / 2.9)
    }()
    
    private lazy var firstSpeed: CGFloat = {
        counter.spiningStride(to: counter.combinations[combinationCounter].spinObjectIds[0],
                              from: 0,
                              currentArray: OffsetCounter.firstArray)
    }()
    private lazy var secondSpeed: CGFloat = {
        counter.spiningStride(to: counter.combinations[combinationCounter].spinObjectIds[1],
                              from: 1,
                              currentArray: OffsetCounter.secondArray)
    }()
    private lazy var thirdSpeed: CGFloat = {
        counter.spiningStride(to: counter.combinations[combinationCounter].spinObjectIds[2],
                              from: 2,
                              currentArray: OffsetCounter.thirdArray)
    }()
    
    private var combinationCounter = 0 {
        didSet {
            firstSpeed = counter.spiningStride(to: counter.combinations[combinationCounter].spinObjectIds[0],
                                               from: 0,
                                               currentArray: OffsetCounter.firstArray)
            secondSpeed = counter.spiningStride(to: counter.combinations[combinationCounter].spinObjectIds[1],
                                                from: 1,
                                                currentArray: OffsetCounter.secondArray)
            thirdSpeed = counter.spiningStride(to: counter.combinations[combinationCounter].spinObjectIds[2],
                                               from: 2,
                                               currentArray: OffsetCounter.thirdArray)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hummerBtn.isHidden = true
        hummerCountLbl.isHidden = true
        checkAvailableHummers()
        // Поменяй
        avatarImageView.isHidden = true
        barBackImgVw.isHidden = true
        view.ui.genericlLayout(object: barBackVw,
                               parentView: gameBackImgVw,
                               height: view.h / 9.2,
                               topC: 0,
                               leadingC: 0,
                               trailingC: 0)
        
        barBackVw.coinsLbl.text = "\(KeychainService.standard.me?.coins ?? 0)"
        barBackVw.energyCountLbl.text = "\(Int(KeychainService.standard.me?.energy ?? 0))"
        
    }
    
    private func setup() {
        
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
                               width: view.h / 4.77,//170,
                               height: view.h / 40.6,//20,
                               bottomToO: slotHouseImgVw.bottomAnchor,
                               bottomCG: view.h / 50.75,//16,
                               trailingToO: slotHouseImgVw.trailingAnchor,
                               trailingCG: view.h / 8.54) //95)
        
        spinManager.showProgress(imgVw: progressImgVw,
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
        AnalyticsHelper.sendFirebaseEvents(events: .spin_open)
        needSoundTap = false
        hiddenNavigationBar = true
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.presenter.getMap { spins in
                self.checkAvailableHummers()
                self.counter.combinations = spins
            }
        }
        setCollectionView()
        setup()
        let swipeRight = UISwipeGestureRecognizer(target: self,
                                                  action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    
    @objc
    func xSpin() {
        firstTimerCount -= 1
        var multiplier: CGFloat = 0
        
        switch firstTimerCount {
        case 151: table1ContentOffset = table1.contentOffset.y
            multiplier = StrideConstants.firstStride
        case 147...150: multiplier = StrideConstants.firstStride
        case 142...146: multiplier = StrideConstants.secondStride
        case 137...141: multiplier = StrideConstants.thirdStride
        case 132...136: multiplier = StrideConstants.fourthStride
        case 127...131: multiplier = StrideConstants.fifthStride
        case 122...126: multiplier = StrideConstants.sixthStride
        case 117...121: multiplier = StrideConstants.seventhStride
        case 112...116: multiplier = StrideConstants.eighthStride
        case 107...111: multiplier = StrideConstants.ninethStride
        case 102...106: multiplier = StrideConstants.tenthStride
        case 49...53: multiplier = StrideConstants.tenthStride
        case 44...48: multiplier = StrideConstants.ninethStride
        case 39...43: multiplier = StrideConstants.eighthStride
        case 33...38: multiplier = StrideConstants.seventhStride
        case 29...32: multiplier = StrideConstants.sixthStride
        case 24...28: multiplier = StrideConstants.fifthStride
        case 19...23: multiplier = StrideConstants.fourthStride
        case 14...18: multiplier = StrideConstants.thirdStride
        case 9...13: multiplier = StrideConstants.secondStride
        case 3...8: multiplier = StrideConstants.firstStride
        default: multiplier = firstSpeed
        }
        
        table1ContentOffset -= multiplier
        UIView.animate(withDuration: 0.03,
                       delay: 0.0,
                       options: .curveEaseIn) {
            self.table1.contentOffset.y = self.table1ContentOffset
            self.table1.layoutIfNeeded()
        } completion: { bool in }
        
        guard firstTimerCount == 3 else { return }
        
        firstTimerCount = 152
        firstTimer.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            print(self.table1.indexPathsForVisibleRows![1])
        }
    }
    
    @objc
    func x2Spin() {
        secondTimerCount -= 1
        var multiplier: CGFloat = 0
        
        switch secondTimerCount {
        case 151: table2ContentOffset = table2.contentOffset.y
            print(table2.contentOffset.y)
            print(table2.contentSize)
            print(countOfStrides)
            multiplier = StrideConstants.firstStride
        case 147...150: multiplier = StrideConstants.firstStride
        case 142...146: multiplier = StrideConstants.secondStride
        case 137...141: multiplier = StrideConstants.thirdStride
        case 132...136: multiplier = StrideConstants.fourthStride
        case 127...131: multiplier = StrideConstants.fifthStride
        case 122...126: multiplier = StrideConstants.sixthStride
        case 117...121: multiplier = StrideConstants.seventhStride
        case 112...116: multiplier = StrideConstants.eighthStride
        case 107...111: multiplier = StrideConstants.ninethStride
        case 102...106: multiplier = StrideConstants.tenthStride
        case 49...53: multiplier = StrideConstants.tenthStride
        case 44...48: multiplier = StrideConstants.ninethStride
        case 39...43: multiplier = StrideConstants.eighthStride
        case 33...38: multiplier = StrideConstants.seventhStride
        case 29...32: multiplier = StrideConstants.sixthStride
        case 24...28: multiplier = StrideConstants.fifthStride
        case 19...23: multiplier = StrideConstants.fourthStride
        case 14...18: multiplier = StrideConstants.thirdStride
        case 9...13: multiplier = StrideConstants.secondStride
        case 3...8: multiplier = StrideConstants.firstStride
        default: multiplier =  secondSpeed
        }
        
        countOfStrides += multiplier
        table2ContentOffset -= multiplier
        UIView.animate(withDuration: 0.03,
                       delay: 0.0,
                       options: .curveEaseIn) {
            self.table2.contentOffset.y = self.table2ContentOffset
            self.table2.layoutIfNeeded()
        } completion: { bool in
            
        }
        guard self.secondTimerCount == 3 else { return }
        self.secondTimerCount = 152
        self.secondTimer.invalidate()
    }
    
    func threeHummersCombination() {
        guard var count = presenter.freeBuildingsCount else { return }
        count += 1
        hummerCountLbl.text = "x\(count)"
        hummerBtn.isHidden = false
        hummerCountLbl.isHidden = false
    }
    
    @objc
    func x3Spin() {
        thirdTimerCount -= 1
        var multiplier: CGFloat = 0
        
        switch thirdTimerCount {
        case 151: table3ContentOffset = table3.contentOffset.y
            multiplier = StrideConstants.firstStride
        case 147...150: multiplier = StrideConstants.firstStride
        case 142...146: multiplier = StrideConstants.secondStride
        case 137...141: multiplier = StrideConstants.thirdStride
        case 132...136: multiplier = StrideConstants.fourthStride
        case 127...131: multiplier = StrideConstants.fifthStride
        case 122...126: multiplier = StrideConstants.sixthStride
        case 117...121: multiplier = StrideConstants.seventhStride
        case 112...116: multiplier = StrideConstants.eighthStride
        case 107...111: multiplier = StrideConstants.ninethStride
        case 102...106: multiplier = StrideConstants.tenthStride
        case 49...53: multiplier =  StrideConstants.tenthStride
        case 44...48: multiplier = StrideConstants.ninethStride
        case 39...43: multiplier = StrideConstants.eighthStride
        case 33...38: multiplier = StrideConstants.seventhStride
        case 29...32: multiplier = StrideConstants.sixthStride
        case 24...28: multiplier = StrideConstants.fifthStride
        case 19...23: multiplier = StrideConstants.fourthStride
        case 14...18: multiplier = StrideConstants.thirdStride
        case 9...13: multiplier = StrideConstants.secondStride
        case 3...8: multiplier = StrideConstants.firstStride
        default: multiplier =  thirdSpeed
        }
        
        table3ContentOffset -= multiplier
        UIView.animate(withDuration: 0.03,
                       delay: 0.0,
                       options: .curveEaseIn) {
            self.table3.contentOffset.y = self.table3ContentOffset
            self.table3.layoutIfNeeded()
        } completion: { bool in
        }
        guard self.thirdTimerCount == 3 else { return }
        
        self.thirdTimerCount = 152
        self.thirdTimer.invalidate()
        
        guard combinationCounter < counter.combinations.count else { return }
        presenter.getSpin(spinId: counter.combinations[self.combinationCounter].id)
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
        present(alert,
                animated: true)
    }
    
    
    @IBAction func spinAction(_ sender: Any) {
        
        guard counter.combinations.count > combinationCounter else { spinsRunOut()
            return }
        guard KeychainService.standard.me?.energy ?? 0.0 > 0.99 else {
            let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .energyZero)
            return
        }
        
        resultLbl.text = ""
        resultStackView.isHidden = true
        AudioManager.sharedManager.playSound(type: .spinTap_10)
        AnalyticsHelper.sendFirebaseEvents(events: .spin_tap)
        // поменяй лейблы
        spinManager.spinAction(coinsLbl: barBackVw.coinsLbl,
                               energyLbl: barBackVw.energyCountLbl,
                               resultLbl: resultLbl,
                               collectionView: collectionView,
                               spinBtn: spinBtn) {
            
            DispatchQueue.main.async {
                self.spinManager.showProgress(imgVw: self.progressImgVw,
                                              img: self.progressImg ?? UIImage())
            }
            
            firstTimer = Timer.scheduledTimer(timeInterval: 0.03,
                                              target: self,
                                              selector: #selector(xSpin),
                                              userInfo: nil,
                                              repeats: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.secondTimer = Timer.scheduledTimer(timeInterval: 0.03,
                                                        target: self,
                                                        selector: #selector(self.x2Spin),
                                                        userInfo: nil,
                                                        repeats: true)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.thirdTimer = Timer.scheduledTimer(timeInterval: 0.03,
                                                       target: self,
                                                       selector: #selector(self.x3Spin),
                                                       userInfo: nil,
                                                       repeats: true)
            }
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
    
    func successUpgrade() {
        ///reload
    }
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
            if let tupleResult = self.spinManager.recognizeSetCombinations(self.counter.combinations[self.combinationCounter].spinObjectIds) {
                print(tupleResult)
                self.spinManager.accrueBonuses(by: tupleResult.0,
                                               hiddenStack: self.resultStackView,
                                               awardImgVw: self.awardImgVw,
                                               awardTitleLbl: self.awardTitleLbl,
                                               awardCountLbl: self.awardCountLbl,
                                               coinsAmount: coinsAmount,
                                               spinsAmount: spinsAmount) {
                    self.threeHummersCombination()
                }
                self.spinManager.paintBlueBorder(tupleResult.1,
                                                 indexPathes: [self.counter.firstIndexPathRow,
                                                               self.counter.startSecondIndexPathRow,
                                                               self.counter.startThirdIndexPathRow],
                                                 collectionView: self.collectionView)
                
                self.spinManager.showProgress(imgVw: self.progressImgVw,
                                              img: self.progressImg ?? UIImage())
            }
            let lastSpinIndex = self.counter.combinations.count - 1
            switch self.combinationCounter {
            case lastSpinIndex: self.combinationCounter = 0
            default:  self.combinationCounter += 1
            }
        }
        
        let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .afterSpeen)
        
    }
    
    func success() {
        collectionView.reloadData()
    }
}

//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension ArcticGameComtroller: PaywallProtocol {
    func paywallActionBack(controller: BaseController) {
        self.dismiss(animated: true)
    }
    
    func paywallSuccess(controller: BaseController) {
        
    }
}

