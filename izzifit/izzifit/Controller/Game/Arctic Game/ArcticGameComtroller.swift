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
    
    
   private var collectionView: UICollectionView!
   private var timerCount = 0
   private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigationBar = true
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
        layout.itemSize = CGSize(width: view.w / 5.55,
                                 height: view.w / 2.04)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = view.w / 37.5
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView.backgroundColor = . clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SlotCollectionCell.self,
                                forCellWithReuseIdentifier: SlotCollectionCell.id)
        
        view.ui.genericlLayout(object: collectionView,
                               parentView: slotBackImgVw,
                               topC: -15,
                               bottomC: 15,
                               leadingC: view.w / 33.5,
                               trailingC: 0)
    }
    
    @IBAction func spinAction(_ sender: Any) {
        
        if var energy = KeychainService.standard.me?.energy {
            energy -= 1
            KeychainService.standard.me?.energy = energy
        }
        setup()
        spinBtn.isUserInteractionEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 0.3,
                                     target: self,
                                     selector: #selector(randomSpinSlots),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc
    func randomSpinSlots() {
        timerCount += 1
        for i in collectionView.visibleCells.indices {
            let randomSlotInt = arc4random_uniform(4)
            let cell = collectionView.cellForItem(at: [0,i]) as! SlotCollectionCell
            cell.array.shuffle()
            cell.tableView.reloadData()
            let table = ( collectionView.cellForItem(at: [0,i]) as! SlotCollectionCell).tableView
            
            table.scrollToRow(at: [0,Int(randomSlotInt)],
                              at: .middle,
                              animated: true)
        }
        guard timerCount == 13 else { return }
        
        let resultIndices = getResultIndices(collectionView)
        print(resultIndices)
        timer.invalidate()
        timerCount = 0
        spinBtn.isUserInteractionEnabled = true
    }
    
    
    func getResultIndices(_ collectionView: UICollectionView) -> [Int] {
        var indicesArray = [Int]()
        
        for item in collectionView.visibleCells.indices {
            
            let middleIndex = (collectionView.cellForItem(at: [0,item]) as! SlotCollectionCell).tableView.visibleCells[1].tag
            indicesArray.append(middleIndex)
        }
        
        return indicesArray
    }
}

extension ArcticGameComtroller: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotCollectionCell.id, for: indexPath) as! SlotCollectionCell
        
        return cell
    }
}
