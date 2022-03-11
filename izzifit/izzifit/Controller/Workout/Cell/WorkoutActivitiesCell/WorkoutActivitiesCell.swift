
import UIKit

class WorkoutActivitiesCell: UITableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
//    private let weight = UIScreen.main.bounds.size.width
//    private let height = UIScreen.main.bounds.size.height
    
    let cellIdentifier = String(describing: WorkoutActivityCollectionCell.self)
    
    var workoutTypes = [WorkoutType]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.reloadData()
    }
    
    func setupCell(workoutTypes: [WorkoutType]) {
        //self.workoutTypes = workoutTypes
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDataSource
//----------------------------------------------

extension WorkoutActivitiesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WorkoutActivityCollectionCell
        
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegate
//----------------------------------------------

extension WorkoutActivitiesCell: UICollectionViewDelegate {
    
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

//extension WorkoutActivitiesCell: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: weight , height: height)
//    }
//}
