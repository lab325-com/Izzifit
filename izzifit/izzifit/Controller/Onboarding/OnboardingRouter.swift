//
//  OnboardingRouter.swift
//  izzifit
//
//  Created by Andrey S on 15.02.2022.
//

import Foundation

class OnboardingRouter: BaseRouter {
    func pushSwipe() {
        let controller = OnboardingSwipeContoller()
        push(controller: controller)
    }
    
    func pushName() {
        let controller = QuizeNameController()
        push(controller: controller)
    }
    
    func pushGender() {
        let controller = QuizeGenderController()
        push(controller: controller)
    }
    
    func pushGoal() {
        let controller = QuizeGoalController()
        push(controller: controller)
    }
    
    func pushAge() {
        let controller = QuizeAgeController()
        push(controller: controller)
    }
    
    func pushHeight() {
        let controller = QuizeHeightController()
        push(controller: controller)
    }
    
    func pushWeight() {
        let controller = QuizeWeightController()
        push(controller: controller)
    }
    
    func pushTargetWeight() {
        let controller = QuizeTargetWeightController()
        push(controller: controller)
    }
    
    func pushFood() {
        let controller = QuizeFoodController()
        push(controller: controller)
    }
    
    func pushSport() {
        let controller = QuizeSportController()
        push(controller: controller)
    }
    
    func pushEmail() {
        let controller = QuizeEmailController()
        push(controller: controller)
    }
    
    func pushProgress() {
        let controller = QuizeProgressController()
        push(controller: controller)
    }
    
    func presentVideo(delegate: QuizeVideoPotocol) {
        let controller = QuizeVideoController(delegate: delegate)
        let nav = NavigationController(rootViewController: controller)
        present(controller: nav)
    }
}
