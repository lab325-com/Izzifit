
import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------

protocol WorkoutOutputProtocol: BaseController {
    func success()
    
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------

protocol WorkoutPresenterProtocol: AnyObject {
    init(view: WorkoutOutputProtocol)
    
    func getWorkout()
    func getWorkoutsAll(categoryId: Int?)
}

class WorkoutPresenter: WorkoutPresenterProtocol {

    private weak var view: WorkoutOutputProtocol?


    required init(view: WorkoutOutputProtocol) {
        self.view = view
    }
    
    var workoutTypes = [WorkoutType]()
    var recomended = [WorkoutByIdMainModel]()
    var exercises = [WorkoutByIdMainModel]()
    var exercisesPagination: PaginationModel?
    
    func getWorkout() {
        let group = DispatchGroup()
        view?.startLoader()
        
        let query = WorkoutTypesQuery()
        
        group.enter()
        let _ = Network.shared.query(model: WorkoutTypesModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.workoutTypes = model.workoutTypes
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query2 = RecommendWorkoutsQuery()
        let _ = Network.shared.query(model: RecommendWorkoutsModel.self, query2, controller: view, successHandler: { [weak self] model in
            self?.recomended = model.recommendWorkouts
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query3 = WorkoutsQuery()
        let _ = Network.shared.query(model: WorkoutsModel.self, query3, controller: view, successHandler: { [weak self] model in
            self?.exercises = model.workouts.workouts
            self?.exercisesPagination = model.workouts.pagination
            
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            self?.view?.stopLoading()
            self?.view?.success()
        }
    }
    
    func getWorkoutsAll(categoryId: Int?) {
        
        view?.startLoader()
        let query = WorkoutsQuery(workoutTypeIds: [categoryId])
        let _ = Network.shared.query(model: WorkoutsModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.exercises = model.workouts.workouts
            self?.exercisesPagination = model.workouts.pagination
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
        
    }
}
