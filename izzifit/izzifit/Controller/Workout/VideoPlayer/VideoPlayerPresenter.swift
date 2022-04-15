//
//  VideoPlayerPresenter.swift
//  izzifit
//
//  Created by Andrey S on 15.04.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol VideoPlayerOutputProtocol: BaseController {
    
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
    private var attemptId: String?
    
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
}
