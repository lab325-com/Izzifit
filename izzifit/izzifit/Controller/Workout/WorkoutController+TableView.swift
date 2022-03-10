
import UIKit

//----------------------------------------------
// MARK: - UITableViewDataSource
//----------------------------------------------

extension WorkoutController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.workoutActivitiesIdentifier) as? WorkoutActivitiesCell else { return UITableViewCell() }
            cell.setupCell(workoutTypes: presenter.workoutTypes)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.workoutSpecialIdentifier) as? WorkoutSpecialCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.workoutExercisesIdentifier) as? WorkoutExercisesCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
