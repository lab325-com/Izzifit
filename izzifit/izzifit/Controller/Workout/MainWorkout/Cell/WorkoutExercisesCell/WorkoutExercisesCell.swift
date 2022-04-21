//
//  WorkoutExercisesCell.swift
//  izzifit
//
//  Created by Andrey S on 31.03.2022.
//

import UIKit

protocol WorkoutExercisesCellProtocol: AnyObject {
    func workoutExercisesCell(cell: WorkoutExercisesCell, model: WorkoutByIdMainModel)
}

class WorkoutExercisesCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellIdentifier = String(describing: WorkoutExercisesDetailCell.self)
    weak var delegate: WorkoutExercisesCellProtocol?
    
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

extension WorkoutExercisesCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  cellIdentifier, for: indexPath) as! WorkoutExercisesDetailCell
        cell.setupCell(model: models[indexPath.row])
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension WorkoutExercisesCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let weight = (UIScreen.main.bounds.size.width - 3*16) / 2
        let height = weight * 0.682 + 70
        return CGSize(width: weight, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.workoutExercisesCell(cell: self, model: models[indexPath.row])
    }
}
