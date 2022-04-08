
import UIKit

//----------------------------------------------
// MARK: - UITableViewDataSource
//----------------------------------------------

extension WorkoutController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  workoutActivitiesIdentifier, for: indexPath) as! WorkoutActivitiesCell
            cell.delegate = self
            cell.setupCell(workoutTypes: presenter.workoutTypes, selectedTypeId: selectedTypeId)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  workoutSpecialIdentifier, for: indexPath) as! WorkoutSpecialCell
            cell.setupCell(model: presenter.recomended)
            cell.delegate = self
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  workoutExercisesIdentifier, for: indexPath) as! WorkoutExercisesCell
            cell.setupCell(model: presenter.exercises)
            cell.delegate = self
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension WorkoutController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let heightImage = UIScreen.main.bounds.size.width * 0.575
        
        switch indexPath.row {
        case 0:
            return CGSize(width: UIScreen.main.bounds.size.width , height: 110)
        case 1:
            return CGSize(width: UIScreen.main.bounds.size.width , height: heightImage + 78 + 60)
        case 2:
            let weight = (UIScreen.main.bounds.size.width - 3*16) / 2
            let height = weight * 0.682 + 70
            
            let count = presenter.exercises.count % 2 == 0 ? CGFloat(presenter.exercises.count / 2) : CGFloat(presenter.exercises.count / 2) + 1
            
            return CGSize(width: UIScreen.main.bounds.size.width , height: height * count + count * 16 + 50)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//----------------------------------------------
// MARK: - WorkoutActivitesProtocol
//----------------------------------------------

extension WorkoutController: WorkoutActivitesProtocol {
    func workoutActivitiesSelect(cell: WorkoutActivitiesCell, selectedId: Int?) {
        selectedTypeId = selectedId
    }
}

//----------------------------------------------
// MARK: - WorkoutSpecialCellProtocol
//----------------------------------------------

extension WorkoutController: WorkoutSpecialCellProtocol {
    func workoutSpecialCell(cell: WorkoutSpecialCell, model: WorkoutByIdMainModel) {
        guard let id = model.id else { return }
        WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id, model: model)
    }
}

//----------------------------------------------
// MARK: - WorkoutExercisesCellProtocol
//----------------------------------------------

extension WorkoutController: WorkoutExercisesCellProtocol {
    func workoutExercisesCell(cell: WorkoutExercisesCell, model: WorkoutByIdMainModel) {
        guard let id = model.id else { return }
        WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id, model: model)
    }
}
