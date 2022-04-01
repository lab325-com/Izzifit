
import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------

protocol WorkoutOutputProtocol: BaseController {
    func successGetWorkoutTypes()
    
    func failure(error: String)
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------

protocol WorkoutPresenterProtocol: AnyObject {
    init(view: WorkoutOutputProtocol)
    
    func getWorkoutTypes()
}

class WorkoutPresenter: WorkoutPresenterProtocol {

    private weak var view: WorkoutOutputProtocol?


    required init(view: WorkoutOutputProtocol) {
        self.view = view
    }
    
    var workoutTypes = [WorkoutType]()
    
    func getWorkoutTypes() {
        view?.startLoader()
        
        let query = WorkoutTypesQuery()
        
        let _ = Network.shared.query(model: WorkoutTypesModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.workoutTypes = model.workoutTypes
            self?.view?.successGetWorkoutTypes()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure(error: error.localizedDescription)
        })
    }
}
