
import UIKit

protocol WorkoutActivitesProtocol: AnyObject {
    func workoutActivitiesSelect(cell: WorkoutActivitiesCell, selectedId: Int?)
}

class WorkoutActivitiesCell: UICollectionViewCell {
    
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

    weak var delegate: WorkoutActivitesProtocol?
    private var selectedId: Int? {
        didSet {
            if selectedId != oldValue {
                collectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset.left = 16
        collectionView.contentInset.right = 16
        
    }
    
    func setupCell(workoutTypes: [WorkoutType], selectedTypeId: Int?) {
        selectedId = selectedTypeId
        self.workoutTypes = workoutTypes
        collectionView.reloadData()
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDataSource
//----------------------------------------------

extension WorkoutActivitiesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutTypes.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WorkoutActivityCollectionCell
        
        if indexPath.row == 0 {
            cell.setup(workoutName: "All", isSelected: selectedId == nil)
        } else {
            cell.setup(workoutName: workoutTypes[indexPath.row - 1].name ?? "", isSelected: workoutTypes[indexPath.row - 1].id == selectedId)
        }
        
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegate
//----------------------------------------------

extension WorkoutActivitiesCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AudioManager.sharedManager.playSound()
        if indexPath.row == 0 {
            selectedId = nil
        } else {
            selectedId = workoutTypes[indexPath.row - 1].id
        }
        
        delegate?.workoutActivitiesSelect(cell: self, selectedId: selectedId)
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension WorkoutActivitiesCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let label = UILabel(frame: CGRect.zero)
        label.text = indexPath.row == 0 ? "All" : workoutTypes[indexPath.row - 1].name
        label.sizeToFit()
        
        return CGSize(width: label.frame.width + 16.0, height: height)
    }
}
