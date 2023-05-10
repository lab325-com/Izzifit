//
//  MenuPresenter.swift
//  izzifit
//
//  Created by mob325 on 23.02.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol MenuOutputProtocol: BaseController {
    func success()
    func successDeleteAccount()
    func failure()
}

extension MenuOutputProtocol {
    func successDeleteAccount() {}
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol MenuPresenterProtocol: AnyObject {
    init(view: MenuOutputProtocol)
    
    func profileUpdate(fitnessPreference: WorkoutDifficulty?, growthMeasure: GrowthMeasure?, foodGroupId: Int?, notifications: Bool?, weightMeasure: WeightMeasure?, targetWeight: Double?, weight: Double?, doSport: DoSportType?, darkTheme: Bool?, reminders: Bool?, email: String?, age: Int?, growth: Int?, goal: GoalType?, gender: GenderType?, name: String?)
    
    func deleteAccount()
}

class MenuPresenter: MenuPresenterProtocol {
    
    private weak var view: MenuOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: MenuOutputProtocol) {
        self.view = view
    }
    
    func profileUpdate(fitnessPreference: WorkoutDifficulty? = nil, growthMeasure: GrowthMeasure? = nil, foodGroupId: Int? = nil, notifications: Bool? = nil, weightMeasure: WeightMeasure? = nil, targetWeight: Double? = nil, weight: Double? = nil, doSport: DoSportType? = nil, darkTheme: Bool? = nil, reminders: Bool? = nil, email: String? = nil, age: Int? = nil, growth: Int? = nil, goal: GoalType? = nil, gender: GenderType? = nil, name: String? = nil) {
        
        var profile = ProfileUpdateInput()
        
        if let fitnessPreference = fitnessPreference {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "fitnessPreference"])
            profile.fitnessPreference = fitnessPreference
        }
        
        if let growthMeasure = growthMeasure {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "growthMeasure"])
            profile.growthMeasure = growthMeasure
        }
        
        if let foodGroupId = foodGroupId {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "foodGroupId"])
            profile.foodGroupId = foodGroupId
        }
        
        if let notifications = notifications {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "notifications"])
            profile.notifications = notifications
        }
        
        if let weightMeasure = weightMeasure {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "weightMeasure"])
            profile.weightMeasure = weightMeasure
        }
        
        if let targetWeight = targetWeight {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "targetWeight"])
            profile.targetWeight = targetWeight
        }
        
        if let weight = weight {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "weight"])
            profile.weight = weight
        }
        
        if let doSport = doSport {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "doSport"])
            profile.doSport = doSport
        }
        
        if let darkTheme = darkTheme {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "darkTheme"])
            profile.darkTheme = darkTheme
        }
        
        if let reminders = reminders {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "reminders"])
            profile.reminders = reminders
        }
        
        if let email = email {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "email"])
            profile.email = email
        }
        
        if let age = age {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "age"])
            profile.age = age
        }
        
        if let growth = growth {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "growth"])
            profile.growth = growth
        }
        
        if let goal = goal {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "goal"])
            profile.goal = goal
        }
        
        if let gender = gender {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "gender"])
            profile.gender = gender
        }
        
        if let name = name {
            AnalyticsHelper.sendFirebaseEvents(events: .settings_change, params: ["change": "name"])
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
    
    func deleteAccount() {
        view?.startLoader()
        
        let mutation = ProfileDeleteMutation()
        
        let _ = Network.shared.mutation(model: ProfileDeleteModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successDeleteAccount()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
            self?.view?.stopLoading()
        })
    }
}
