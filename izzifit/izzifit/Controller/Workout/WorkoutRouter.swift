//
//  WorkoutRouter.swift
//  izzifit
//
//  Created by mob325 on 28.03.2022.
//

import Foundation

class WorkoutRouter: BaseRouter {
    func pushDietDetail(id: String, idSpecialId: String) {
        let controller = DietDetailController(id: id, idSpecialId: idSpecialId)
        push(controller: controller)
    }
    
    func pushDetailWorkout(id: String, idSpecialId: String? = nil) {
        let controller = WorkoutDetailController(id: id, idSpecialId: idSpecialId)
        push(controller: controller)
    }
    
    func pushDetailMuscle(muscles: [String]) {
        let controller = WorkoutDetailMuscleController(muscles: muscles)
        push(controller: controller)
    }
    
    func pushVideoPlayer(workout: WorkoutByIdMainModel, exercises: [ExerciseModel]) {
        let controller = VideoPlayerController(workout: workout, exercises: exercises)
        push(controller: controller)
    }
    
    func pushVideoNotFinished(delegate: VideoNotFinishedProtocol, attemptId: String) {
        let controller = VideoNotFinished(delegate: delegate, attemptId: attemptId)
        push(controller: controller)
    }
    
    func pushVideoFinished(attemptId: String, workout: WorkoutByIdMainModel) {
        let controller = VideoFinishedController(attemptId: attemptId, workout: workout)
        push(controller: controller)
    }
    
}
