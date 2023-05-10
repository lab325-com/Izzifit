//
//  EnergyChooseActivityCell.swift
//  izzifit
//
//  Created by mob325 on 09.03.2022.
//

import UIKit

protocol EnergyChooseActivityProtocol: AnyObject {
    func energyChooseActivitySelect(cell: EnergyChooseActivityCell, model: WorkoutsWidgetMainModel)
}

class EnergyChooseActivityCell: BaseTableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightCollectionView: NSLayoutConstraint!
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var countEnergyLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let weight  = UIScreen.main.bounds.size.width * 0.4373
    private let height  = (UIScreen.main.bounds.size.width * 0.4373) * 0.6829 + 45
    
    private let cellIdentifier = String(describing: EnergyChooseActivityCollectionCell.self)
    
    private var models: [WorkoutsWidgetMainModel] = [] {
        didSet {
            if models != oldValue {
                collectionView.reloadData()
            }
        }
    }
    
    weak var delegate: EnergyChooseActivityProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTitleLabel.text = RLocalization.energy_choose_activity()
        heightCollectionView.constant = height
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: cellIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: cellIdentifier)
        
        collectionView.reloadData()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(models: [WorkoutsWidgetMainModel]) {
        self.models = models
        
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//----------------------------------------------


extension EnergyChooseActivityCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  cellIdentifier, for: indexPath) as! EnergyChooseActivityCollectionCell
        cell.setupCell(model: models[indexPath.row])
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension EnergyChooseActivityCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: weight , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AudioManager.sharedManager.playSound()
        delegate?.energyChooseActivitySelect(cell: self, model: models[indexPath.row])
    }
}
