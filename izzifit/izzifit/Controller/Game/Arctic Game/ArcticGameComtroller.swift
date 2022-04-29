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
    @IBOutlet weak var spinBtn: UIButton!
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
    
    @objc
    func xSpin() {
        firstTimerCount -= 1
        var multiplier: CGFloat = 0
        switch firstTimerCount {
        case 152: table1ContentOffset = table1.contentOffset.y
            multiplier = 1
        case 147...151: multiplier = 1
        case 142...146: multiplier = 2
        case 137...141: multiplier = 3
        case 132...136: multiplier = 4
        case 127...131: multiplier = 5
        case 122...126: multiplier = 6
        case 117...121: multiplier = 7
        case 112...116: multiplier = 8
        case 107...111: multiplier = 9
        case 102...106: multiplier = 10
        case 49...53: multiplier = 10
        case 44...48: multiplier = 9
        case 39...43: multiplier = 8
        case 33...38: multiplier = 7
        case 29...32: multiplier = 6
        case 24...28: multiplier = 5
        case 19...23: multiplier = 4
        case 14...18: multiplier = 3
        case 9...13: multiplier = 2
        case 3...8: multiplier = 1
        default: multiplier = counter.defaultSpeed
        }
        table1ContentOffset -= multiplier
        UIView.animate(withDuration: 0.03,
                       delay: 0.0,
                       options: .curveEaseIn) {
            self.table1.contentOffset.y = self.table1ContentOffset
            self.table1.layoutIfNeeded()
        } completion: { bool in
        }
       

//        UIView.animate(withDuration: 0.3) {
//        //    print(self.table1ContentOffset)
//            self.table1.contentOffset.y = self.table1ContentOffset
//            self.table1.layoutIfNeeded()
//        }
//
        guard firstTimerCount == 3 else { return }
        firstTimerCount = 153
        firstTimer.invalidate()
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
            multiplier = 1
        case 147...151: multiplier = 1
        case 142...146: multiplier = 2
        case 137...141: multiplier = 3
        case 132...136: multiplier = 4
        case 127...131: multiplier = 5
        case 122...126: multiplier = 6
        case 117...121: multiplier = 7
        case 112...116: multiplier = 8
        case 107...111: multiplier = 9
        case 102...106: multiplier = 10
        case 49...53: multiplier = 10
        case 44...48: multiplier = 9
        case 39...43: multiplier = 8
        case 33...38: multiplier = 7
        case 29...32: multiplier = 6
        case 24...28: multiplier = 5
        case 19...23: multiplier = 4
        case 14...18: multiplier = 3
        case 9...13: multiplier = 2
        case 3...8: multiplier = 1
        default: multiplier =  counter.defaultSpeed
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
            multiplier = 1
        case 147...151: multiplier = 1
        case 142...146: multiplier = 2
        case 137...141: multiplier = 3
        case 132...136: multiplier = 4
        case 127...131: multiplier = 5
        case 122...126: multiplier = 6
        case 117...121: multiplier = 7
        case 112...116: multiplier = 8
        case 107...111: multiplier = 9
        case 102...106: multiplier = 10
        case 49...53: multiplier = 10
        case 44...48: multiplier = 9
        case 39...43: multiplier = 8
        case 33...38: multiplier = 7
        case 29...32: multiplier = 6
        case 24...28: multiplier = 5
        case 19...23: multiplier = 4
        case 14...18: multiplier = 3
        case 9...13: multiplier = 2
        case 3...8: multiplier = 1
        default: multiplier =  counter.defaultSpeed
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
        self.thirdTimerCount = 153
        self.thirdTimer.invalidate()
      
    }


    
    override func viewDidLoad() {
        needSoundTap = false
        super.viewDidLoad()
        
        presenter.getMap()

        
        setCollectionView()
        setup()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.table3ContentOffset = self.table3.contentOffset.y
//            self.table2ContentOffset = self.table2.contentOffset.y
//            self.table1ContentOffset = self.table1.contentOffset.y
//        }
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
            nameLabel.text = RLocalization.energy_header_title(name)
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
                               centerV: -view.h / 40,
                               centerH: view.h / 81.2)
    }
    
    @IBAction func spinAction(_ sender: Any) {

     
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
        return cell
    }
}
    
    
    
    
    
    //    x
    //    2x
    //    3x
    //    4x
    //    scrollTo
    //    4x
    //    3x
    //    2x
    //    x
    
//
//    @objc
//    func secondTableSpin() {
//        secondTimerCount -= 1
//
//        let from = ((self.secondTimerCount ) * 100)
//        let to = from + 100
//        let randomSlotInt = Int.random(in: from...to)
//
//        let table = (self.collectionView.cellForItem(at: [0,1]) as! SlotCollectionCell).tableView
//        if self.secondTimerCount == 3 {
//            let spinTo = self.planManager.secondCurrentCombination[1]
//            let slotInt = Int.random(in: 100...200)
//            let currentRowModel = SlotRowModel(indexPathRow: slotInt,
//                                               slotInt: SpinLogicManager.array[slotInt])
//            let necessaryIndex = self.planManager.spin(to: spinTo,
//                                                       check: currentRowModel)
//            table.scrollToRow(at: [0,necessaryIndex],
//                              at: .middle,
//                              animated: true)
//        } else {
//            table.scrollToRow(at: [0,randomSlotInt],
//                              at: .middle,
//                              animated: true)
//        }
//        guard secondTimerCount == 3 else { return }
//        secondTimer.invalidate()
//        secondTimerCount = 25
//        planManager.secondSpinCounter += 1
//    }
//
//    @objc
//    func thirdTableSpin() {
//        thirdTimerCount -= 1
//
//        let from = ((self.thirdTimerCount ) * 100)
//        let to = from + 100
//        let randomSlotInt = Int.random(in: from...to)
//
//        let table = (self.collectionView.cellForItem(at: [0,2]) as! SlotCollectionCell).tableView
//        if self.thirdTimerCount == 3 {
//            let spinTo = self.planManager.thirdCurrentCombination[2]
//            let slotInt = Int.random(in: 100...200)
//            let currentRowModel = SlotRowModel(indexPathRow: slotInt,
//                                               slotInt: SpinLogicManager.array[slotInt])
//            let necessaryIndex = self.planManager.spin(to: spinTo,
//                                                       check: currentRowModel)
//            table.scrollToRow(at: [0,necessaryIndex],
//                              at: .middle,
//                              animated: true)
//        } else {
//            table.scrollToRow(at: [0,randomSlotInt],
//                              at: .middle,
//                              animated: true)
//        }
//
//        guard thirdTimerCount == 3 else { return }
//        thirdTimer.invalidate()
//        thirdTimerCount = 25
//        planManager.thirdSpinCounter += 1
//    }
//}
//----------------------------------------------
// MARK: - ArcticGameOutputProtocol
//----------------------------------------------

extension ArcticGameComtroller: ArcticGameOutputProtocol {
    func successUpgrade() {
        ///reload
    }
    
    func successSpin() {
        ///reload
    }
    
    func success() {
        ///reload
    }
}

