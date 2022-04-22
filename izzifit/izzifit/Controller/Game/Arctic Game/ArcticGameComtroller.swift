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
    private var timerCount = 21
    private var timer = Timer()
    private var spinManager = SpinLogicManager()
    private var planManager = PlanSpinManager()
    
    override func viewDidLoad() {
        //  hiddenNavigationBar = true
        super.viewDidLoad()
        setup()
        setCollectionView()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        actionBack()
    }
    
    private func setup() {
        //        spinBtn.titleLabel?.font = UIFont
        
        var div: CGFloat = 0
        if UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0 > 0 {
            div = (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) - 20
        }
        resultLblTopConstraint.constant =  view.w / 9.37
        slotHouseImgVwTopConstraint.constant = view.h / 4.51
        //        slotBackImgVw.topAnchor.constraint(equalTo: slotHouseImgVw.topAnchor, constant: view.h / 6 +   div).isActive = true
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
        for i in collectionView.visibleCells.indices {
            
            let table = ( collectionView.cellForItem(at: [0,i]) as! SlotCollectionCell).tableView
            table.scrollToRow(at: [0,2798],
                              at: .middle,
                              animated: true)
        }
        
        
        view.ui.genericlLayout(object: collectionView,
                               parentView: slotBackImgVw,
                               width: view.h / 3.60,
                               height: view.h / 5.77,
                               centerV: -view.h / 40,
                               centerH: view.h / 81.2)
        
        
        
    }
    
    @IBAction func spinAction(_ sender: Any) {
        
        planManager.globalSpinCounter += 1
        spinManager.spinAction(coinsLbl: coinslabel,
                               energyLbl: energyLabel,
                               resultLbl: resultLbl,
                               collectionView: collectionView,
                               spinBtn: spinBtn) {
            
            timer = Timer.scheduledTimer(timeInterval: 0.15,
                                         target: self,
                                         selector: #selector(randomSpinSlots),
                                         userInfo: nil,
                                         repeats: true)
            
            
        }
    }
    
    @objc
    func randomSpinSlots() {
        timerCount -= 1
        var timeCoefficient = 0.0
        for i in collectionView.visibleCells.indices {
            switch i {
            case 1: timeCoefficient = 0.0
            case 2: timeCoefficient = 0.0
            default: break
            }
            
       //     DispatchQueue.main.asyncAfter(deadline: .now() + timeCoefficient) {
                let to = ((self.timerCount ) * 100) + 100
                let from = to - 100
                let randomSlotInt = Int.random(in: from...to)
                let table = (self.collectionView.cellForItem(at: [0,i]) as! SlotCollectionCell).tableView
                if self.timerCount == 3 {
                    let spinTo = self.planManager.currentCombination[i]
                    let slotInt = Int.random(in: 100...200)
                    let currentRowModel = SlotRowModel(indexPathRow: slotInt,
                                                       slotInt: SpinLogicManager.array[slotInt])
                 let necessaryIndex = self.planManager.spin(to: spinTo,
                                     check: currentRowModel,
                                     tableView: table)
                    
                    table.scrollToRow(at: [0,necessaryIndex],
                                      at: .middle,
                                      animated: true)
           
                } else {
                    table.scrollToRow(at: [0,randomSlotInt],
                                      at: .middle,
                                      animated: true)
                }
          //  }
        }
        guard timerCount == 3 else { return }
        timer.invalidate()
        timerCount = 21
    }
}

extension ArcticGameComtroller: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotCollectionCell.id, for: indexPath) as! SlotCollectionCell
        return cell
    }
}
