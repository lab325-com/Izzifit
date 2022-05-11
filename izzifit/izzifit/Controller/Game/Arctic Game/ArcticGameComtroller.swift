//
//  ArcticGameComtroller.swift
//  izzifit
//
//  Created by O l e h on 07.04.2022.
//

import UIKit

class ArcticGameComtroller: BaseController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coinslabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
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
    
    private var collectionView: UICollectionView!
    // Рассмотри возможность реализации без таймеров, а просто через цикл и asyncAfter
    private var firstTimerCount = 153
    private var secondTimerCount = 153
    private var thirdTimerCount = 153
    
    var table1ContentOffset: CGFloat = 0
    var table2ContentOffset: CGFloat = 0
    var table3ContentOffset: CGFloat = 0
    private lazy var presenter = ArcticGamePresenter(view: self)
    
    private var firstTimer = Timer()
    private var secondTimer = Timer()
    private var thirdTimer = Timer()
    private var spinManager = SpinLogicManager()
    
    private var planManager = PlanSpinManager()
    var countOfStrides: CGFloat = 0
    
    private lazy var table1: UITableView = {
        (collectionView.cellForItem(at: [0,0]) as! SlotCollectionCell).tableView
    }()
    
    private lazy var table2: UITableView = {
        let table =  (collectionView.cellForItem(at: [0,1]) as! SlotCollectionCell).tableView
        return table
    }()
    
    private lazy var table3: UITableView = {
        (collectionView.cellForItem(at: [0,2]) as! SlotCollectionCell).tableView
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
    
    @objc
    func xSpin() {
        firstTimerCount -= 1
        var multiplier: CGFloat = 0
        
        switch firstTimerCount {
        case 152: table1ContentOffset = table1.contentOffset.y
            multiplier = StrideConstants.firstStride
        case 147...151: multiplier = StrideConstants.firstStride
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
        } completion: { bool in
        }

        guard firstTimerCount == 3 else { return }
        
        firstTimerCount = 153
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
        case 152: table2ContentOffset = table2.contentOffset.y
            print(table2.contentOffset.y)
            print(table2.contentSize)
            print(countOfStrides)
            multiplier = StrideConstants.firstStride
        case 147...151: multiplier = StrideConstants.firstStride
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
        self.secondTimerCount = 153
        self.secondTimer.invalidate()
    }
    
    @objc
    func x3Spin() {
        thirdTimerCount -= 1
        var multiplier: CGFloat = 0
        
        switch thirdTimerCount {
        case 152: table3ContentOffset = table3.contentOffset.y
            multiplier = StrideConstants.firstStride
        case 147...151: multiplier = StrideConstants.firstStride
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
        presenter.getSpin(spinId: counter.combinations[self.combinationCounter].id)
    
        self.thirdTimerCount = 153
        self.thirdTimer.invalidate()
    }
    
    override func viewDidLoad() {
        needSoundTap = false
        hiddenNavigationBar = true
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.presenter.getMap { spins in
                self.counter.combinations = spins
            }
        }
        setCollectionView()
        setup()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        actionBack()
    }
    
    private func setup() {
        resultLblTopConstraint.constant =  view.w / 9.37
        slotHouseImgVwTopConstraint.constant = view.h / 4.51
        slotBackImgVw.centerYAnchor.constraint(equalTo: slotHouseImgVw.centerYAnchor, constant: (view.h / 10.33) / 2).isActive = true
        shadowViewBottomConstraint.constant = view.h / 10
        coinslabel.text = "\(KeychainService.standard.me?.coins ?? 0)"
        energyLabel.text = "\(KeychainService.standard.me?.energy ?? 0)"
        
        if let name = KeychainService.standard.me?.name {
            nameLabel.text = name
        } else {
            nameLabel.isHidden = true
        }
        avatarImageView.kf.setImage(with: URL(string: KeychainService.standard.me?.Avatar?.url ?? ""),
                                    placeholder: RImage.placeholder_food_ic(),
                                    options: [.transition(.fade(0.25))])
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
                               centerV: -view.h / 48, //40
                               centerH: view.h / 81.2)
    }
    
    @IBAction func spinAction(_ sender: Any) {
        guard KeychainService.standard.me?.energy ?? 0.0 > 0.0 else { return }
        AudioManager.sharedManager.playSound(type: .spinTap_10)
        
        spinManager.spinAction(coinsLbl: coinslabel,
                               energyLbl: energyLabel,
                               resultLbl: resultLbl,
                               collectionView: collectionView,
                               spinBtn: spinBtn) {
            
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
        for award in model {
            switch award.type{
            case .spinObjectRewardTypeCoin:
                KeychainService.standard.me?.coins! += award.amount
            case .spinObjectRewardTypeEnergy:
                KeychainService.standard.me?.energy! += Float(award.amount)
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
                // теперь тут будет по первому элементу тупла функция по начислению бонусов
                self.spinManager.accrueBonuses(by: tupleResult.0, resultLbl: self.resultLbl)
                // функция котороая красит бордер ячеек по второму элементу тупла
                self.spinManager.paintBlueBorder(tupleResult.1,
                                                 indexPathes: [self.counter.firstIndexPathRow,
                                                               self.counter.startSecondIndexPathRow,
                                                               self.counter.startThirdIndexPathRow],
                                                 collectionView: self.collectionView)
            }
            let lastSpinIndex = self.counter.combinations.count - 1
            switch self.combinationCounter {
            case lastSpinIndex: self.combinationCounter = 0
            default:  self.combinationCounter += 1
            }
        }
    }
    
    func success() {
        collectionView.reloadData()
    }
}

