//
//  WorkoutDetailPresenter.swift
//  izzifit
//
//  Created by Andrey S on 28.03.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol WorkoutDetailOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------

protocol WorkoutDetailPresenterProtocol: AnyObject {
    init(view: WorkoutDetailOutputProtocol)
    
    func getWorkouts(id: String)
}

class WorkoutDetailPresenter: WorkoutDetailPresenterProtocol {
    
    private weak var view: WorkoutDetailOutputProtocol?
    
    required init(view: WorkoutDetailOutputProtocol) {
        self.view = view
    }
    
    var workout: WorkoutByIdMainModel?
   
    func getWorkouts(id: String) {
        
        view?.startLoader()
        
        let query = WorkoutByIdQuery(id: id)
        let _ = Network.shared.query(model: WorkoutByIdModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.workout = model.workoutById
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
            self?.view?.stopLoading()
        })
    }
}
