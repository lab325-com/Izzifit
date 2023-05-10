//
//  VideoPlayerPresenter.swift
//  izzifit
//
//  Created by mob325 on 15.04.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol VideoPlayerOutputProtocol: BaseController {
    func successUpdate()
}

extension VideoPlayerOutputProtocol {
    func successUpdate() {}
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol VideoPlayerPresenterProtocol: AnyObject {
    init(view: VideoPlayerOutputProtocol)
    
    func startWorkout(workoutId: String)
    func doExercisese(exerciseId: String)
}

class VideoPlayerPresenter: VideoPlayerPresenterProtocol {
    
    private weak var view: VideoPlayerOutputProtocol?
    var attemptId: String?
    
    required init(view: VideoPlayerOutputProtocol) {
        self.view = view
    }
    
    func startWorkout(workoutId: String) {
        view?.startLoader()
        let mutation = StartWorkoutMutation(workoutId: workoutId)
        let _ = Network.shared.mutation(model: StartWorkoutModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.attemptId = model.startWorkout
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
    
    func doExercisese(exerciseId: String) {
        guard let attemptId = attemptId else { return }
        
        let mutation = DoExerciseMutation(exerciseId: exerciseId, attemptId: attemptId)
        
        let _ = Network.shared.mutation(model: DoExerciseModel.self, mutation, controller: view) { _ in
            
        } failureHandler: { _ in
            
        }
    }
    
    func updateEnd(of type: WorkoutAttemptFeedbackType, attemptId: String) {
        
        view?.startLoader()
        let mutation = WorkoutAttemptUpdateMutation(attemptId: attemptId, record: WorkoutAttemptUpdateInput(feedback: type))
        let _ = Network.shared.mutation(model: WorkoutAttemptUpdateModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successUpdate()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
    
    func getMe( completion: @escaping ()->()) {
        view?.startLoader()
        let query = MeQuery()
        let _ = Network.shared.query(model: MeModel.self, query, controller: view) { [weak self] model in
            KeychainService.standard.me = model.me
            completion()
            self?.view?.stopLoading()
        } failureHandler: { [weak self] error in
            completion()
            self?.view?.stopLoading()
        }
    }
}
