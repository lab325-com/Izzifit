//
//  WorkoutSpecialCell.swift
//  izzifit
//
//  Created by Andrey S on 30.03.2022.
//

import UIKit

protocol WorkoutSpecialCellProtocol: AnyObject {
    func workoutSpecialCell(cell: WorkoutSpecialCell, model: WorkoutByIdMainModel)
}

class WorkoutSpecialCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellIdentifier = String(describing: WorkoutSpecialDetailCell.self)
    weak var delegate: WorkoutSpecialCellProtocol?
    
    private var models: [WorkoutByIdMainModel] = [] {
        didSet {
            if models != oldValue {
                collectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: cellIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: cellIdentifier)
    }

    func setupCell(model: [WorkoutByIdMainModel]) {
        self.models = model
        self.collectionView.reloadData()
    }
}

//----------------------------------------------
// MARK: - UITableViewDataSource
//----------------------------------------------

extension WorkoutSpecialCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  cellIdentifier, for: indexPath) as! WorkoutSpecialDetailCell
        cell.setupCell(model: models[indexPath.row])
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension WorkoutSpecialCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heightImage = UIScreen.main.bounds.size.width * 0.575
        return CGSize(width: UIScreen.main.bounds.size.width - 56, height: heightImage + 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AudioManager.sharedManager.playSound()
        delegate?.workoutSpecialCell(cell: self, model: models[indexPath.row])
    }
}
