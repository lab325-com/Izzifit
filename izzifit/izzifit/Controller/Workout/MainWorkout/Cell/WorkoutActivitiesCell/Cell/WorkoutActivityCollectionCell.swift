
import UIKit

class WorkoutActivityCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(workoutType: WorkoutType) {
        typeLabel.text = workoutType.name
    }
}
