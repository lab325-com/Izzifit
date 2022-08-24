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
        
        var profileUpdateInput = ProfileUpdateInput()
        
        if let name = profile.name {
            profileUpdateInput.name = name
        }
        
        if let age = profile.age {
            profileUpdateInput.age = age
        }
        
        if let email = profile.email {
            profileUpdateInput.email = email
        }
        
        if let api = profile.sport?.api {
            profileUpdateInput.doSport = api
        }
        
        if let api = profile.gender?.api {
            profileUpdateInput.gender = api
        }
        
        if let api = profile.heightMetric?.api {
            profileUpdateInput.growthMeasure = api
        }
        
        if let smHeight = profile.smHeight, profile.heightMetric == .sm {
            profileUpdateInput.growth = smHeight
        }
        
        if let ft = profile.ft, let inch = profile.inch, profile.heightMetric != .sm {
            let ftHeight = Double(ft) * 30.48 + Double(inch) * 2.54
            profileUpdateInput.growth = Int(ftHeight)
        }
        
        if let api = profile.weightMetric?.api {
            profileUpdateInput.weightMeasure = api
        }
        
        if let weight = profile.weight, let target = profile.targetWeight {
            profileUpdateInput.weight = profile.weightMetric?.api == .weightMeasureTypeLb ? weight  / 0.45359237 : weight
            profileUpdateInput.targetWeight = profile.weightMetric?.api == .weightMeasureTypeLb ? target  / 0.45359237 : target
        }
        
        if let api = profile.goal?.api {
            profileUpdateInput.goal = api
        }
        
        if let id = profile.food?.id {
            profileUpdateInput.foodGroupId = id
        }
        
        let mutation = ProfileUpdateMutation(record: profileUpdateInput)
        
        let _ = Network.shared.mutation(model: ProfileUpdateModel.self, mutation, controller: view, successHandler: { [weak self] model in
            
            if let _ = profile.weight, let _ = profile.targetWeight {
                PreferencesManager.sharedManager.tempPorifle.weight = nil
                PreferencesManager.sharedManager.tempPorifle.targetWeight = nil
            }
            KeychainService.standard.me = model.profileUpdate
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            AnalyticsHelper.sendFirebaseEvents(events: .quiz_close)
            self?.view?.failure()
        })
    }
}
