//
//  MenuPresenter.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol MenuOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol MenuPresenterProtocol: AnyObject {
    init(view: MenuOutputProtocol)
    
    func profileUpdate(fitnessPreference: FitnessPreferenceType?, growthMeasure: MeasureGrowth?, targetWeightMeasure: MeasureWeight?, foodGroupId: String?, notifications: Bool?, weightMeasure: MeasureWeight?, targetWeight: Double?, weight: Double?, doSport: DoSportType?, darkTheme: Bool?, reminders: Bool?, email: String?, age: Int?, growth: Int?, goal: GoalType?, gender: GenderType?, name: String?)
}

class MenuPresenter: MenuPresenterProtocol {
    
    private weak var view: MenuOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: MenuOutputProtocol) {
        self.view = view
    }
    
    func profileUpdate(fitnessPreference: FitnessPreferenceType? = nil, growthMeasure: MeasureGrowth? = nil, targetWeightMeasure: MeasureWeight? = nil, foodGroupId: String? = nil, notifications: Bool? = nil, weightMeasure: MeasureWeight? = nil, targetWeight: Double? = nil, weight: Double? = nil, doSport: DoSportType? = nil, darkTheme: Bool? = nil, reminders: Bool? = nil, email: String? = nil, age: Int? = nil, growth: Int? = nil, goal: GoalType? = nil, gender: GenderType? = nil, name: String? = nil) {
        
        var profile = ProfileUpdateInput()
        
        if let fitnessPreference = fitnessPreference {
            profile.fitnessPreference = fitnessPreference
        }
        
        if let growthMeasure = growthMeasure {
            profile.growthMeasure = growthMeasure
        }
        
        if let targetWeight = targetWeight {
            profile.targetWeight = targetWeight
        }
        
        if let targetWeightMeasure = targetWeightMeasure {
            profile.targetWeightMeasure = targetWeightMeasure
        }
        
        if let foodGroupId = foodGroupId {
            profile.foodGroupId = foodGroupId
        }
        
        if let notifications = notifications {
            profile.notifications = notifications
        }
        
        if let weightMeasure = weightMeasure {
            profile.weightMeasure = weightMeasure
        }
        
        if let targetWeight = targetWeight {
            profile.targetWeight = targetWeight
        }
        
        if let weight = weight {
            profile.weight = weight
        }
        
        if let doSport = doSport {
            profile.doSport = doSport
        }
        
        if let darkTheme = darkTheme {
            profile.darkTheme = darkTheme
        }
        
        if let reminders = reminders {
            profile.reminders = reminders
        }
        
        if let email = email {
            profile.email = email
        }
        
        if let age = age {
            profile.age = age
        }
        
        if let growth = growth {
            profile.growth = growth
        }
        
        if let goal = goal {
            profile.goal = goal
        }
        
        if let gender = gender {
            profile.gender = gender
        }
        
        if let name = name {
            profile.name = name
        }
        
        let mutation = ProfileUpdateMutation(record: profile)
        
        view?.startLoader()
        let _ = Network.shared.mutation(model: ProfileUpdateModel.self, mutation, controller: view, successHandler: { [weak self] model in
            KeychainService.standard.me = model.profileUpdate
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
            self?.view?.stopLoading()
        })
    }
}
