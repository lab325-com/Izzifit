
import UIKit

class WorkoutActivitiesCell: UITableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let height = 32.0
    
    let cellIdentifier = String(describing: WorkoutActivityCollectionCell.self)
    
    var workoutTypes = [WorkoutType]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset.left = 16
        collectionView.contentInset.right = 16
        collectionView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func setupCell(workoutTypes: [WorkoutType]) {
        self.workoutTypes = workoutTypes
        collectionView.reloadData()
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDataSource
//----------------------------------------------

extension WorkoutActivitiesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WorkoutActivityCollectionCell
        
        cell.setup(workoutType: workoutTypes[indexPath.row])
        
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

extension WorkoutActivitiesCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let label = UILabel(frame: CGRect.zero)
        label.text = workoutTypes[indexPath.item].name
        label.sizeToFit()
        
        return CGSize(width: label.frame.width + 16.0, height: height)
    }
}
