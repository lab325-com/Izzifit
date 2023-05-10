
import UIKit

class WorkoutActivityCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(workoutName: String, isSelected: Bool) {
        typeLabel.text = workoutName
        
        mainView.backgroundColor = isSelected == true ? UIColor(rgb: 0xFF42A8) : UIColor(rgb: 0xF1EFF5)
        typeLabel.textColor = isSelected == true ? UIColor.white : UIColor(rgb: 0x3F3E56, alpha: 0.8)
    }
}
