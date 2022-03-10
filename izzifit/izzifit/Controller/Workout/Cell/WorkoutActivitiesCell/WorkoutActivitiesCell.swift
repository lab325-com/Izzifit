
import UIKit

class WorkoutActivitiesCell: UITableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var activitiesCollection: UICollectionView!
    
    //----------------------------------------------
    // MARK: - Prooerties
    //----------------------------------------------
    
    let activityCellIdentifier = String(describing: ActivityCell.self)
    
    var workoutTypes = [WorkoutType]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        activitiesCollection.register(UINib(nibName: activityCellIdentifier, bundle: nil), forCellWithReuseIdentifier: activityCellIdentifier)
    }
    
    func setupCell(workoutTypes: [WorkoutType]) {
        self.workoutTypes = workoutTypes
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: activityCellIdentifier, for: indexPath) as! ActivityCell
        
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegate
//----------------------------------------------

extension WorkoutActivitiesCell: UICollectionViewDelegate {
    
}
