//
//  WorkoutRouter.swift
//  izzifit
//
//  Created by Andrey S on 28.03.2022.
//

import Foundation

class WorkoutRouter: BaseRouter {
    func pushDetailWorkout(id: String) {
        let controller = WorkoutDetailController(id: id)
        push(controller: controller)
    }
    
    func pushDetailMuscle(muscles: [String]) {
        let controller = WorkoutDetailMuscleController(muscles: muscles)
        push(controller: controller)
    }
}
