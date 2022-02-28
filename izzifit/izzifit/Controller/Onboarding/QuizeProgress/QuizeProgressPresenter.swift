//
//  QuizeProgressPresenter.swift
//  izzifit
//
//  Created by Andrey S on 17.02.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol QuizeProgressOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol QuizeProgressPresenterProtocol: AnyObject {
    init(view: QuizeProgressOutputProtocol)
    
    func profileUpdate()
}

class QuizeProgressPresenter: QuizeProgressPresenterProtocol {
    
    private weak var view: QuizeProgressOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: QuizeProgressOutputProtocol) {
        self.view = view
    }
    
    func profileUpdate() {
        let profile = PreferencesManager.sharedManager.tempPorifle
        
        let name = profile.name
        let age = profile.age
        let email = profile.email
        let sport = profile.sport?.api
        let gender = profile.gender?.api
        
        let growthMeasure = profile.heightMetric?.api
        let smHeight = profile.smHeight
        let ftHeight = Double(profile.ft ?? 0) * 30.48 + Double(profile.inch ?? 0) * 2.54
        let growth = profile.heightMetric == .sm ? smHeight : Int(ftHeight)
        
        let weightMeasure = profile.weightMetric?.api
        let weight = profile.weight
        
        let targetWeightMeasure = profile.targetWeightMetric?.api
        let targetWeight = profile.targetWeight
        
        let goalType = profile.goal?.api
        let foodId = profile.food?.id
        
        let mutation = ProfileUpdateMutation(record: ProfileUpdateInput(
            targetWeightMeasure: targetWeightMeasure, gender: gender, targetWeight: targetWeight, foodGroupId: foodId, growthMeasure: growthMeasure, goal: goalType, email: email, name: name, growth: growth, weight: weight, weightMeasure: weightMeasure, age: age, doSport: sport))
        
        let _ = Network.shared.mutation(model: ProfileUpdateModel.self, mutation, controller: view, successHandler: { [weak self] model in
            KeychainService.standard.me = model.profileUpdate
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
        })
    }
}
