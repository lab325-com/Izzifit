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
        
        profileUpdateInput.name = profile.name
        profileUpdateInput.age = profile.age
        profileUpdateInput.email = profile.email
        profileUpdateInput.doSport = profile.sport?.api
        profileUpdateInput.gender = profile.gender?.api
        
        profileUpdateInput.growthMeasure = profile.heightMetric?.api
        let smHeight = profile.smHeight
        let ftHeight = Double(profile.ft ?? 0) * 30.48 + Double(profile.inch ?? 0) * 2.54
        profileUpdateInput.growth = profile.heightMetric == .sm ? smHeight : Int(ftHeight)
        
        profileUpdateInput.weightMeasure = profile.weightMetric?.api
        profileUpdateInput.weight = profile.weight
        
        profileUpdateInput.targetWeight = profile.targetWeight
        
        profileUpdateInput.goal = profile.goal?.api
        profileUpdateInput.foodGroupId = profile.food?.id
        
        let mutation = ProfileUpdateMutation(record: profileUpdateInput)
        
        let _ = Network.shared.mutation(model: ProfileUpdateModel.self, mutation, controller: view, successHandler: { [weak self] model in
            AnalyticsHelper.sendFirebaseEvents(events: .status, params: ["ok": true])
            KeychainService.standard.me = model.profileUpdate
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            AnalyticsHelper.sendFirebaseEvents(events: .status, params: ["failure": true, "error": error.localizedDescription])
            self?.view?.failure()
        })
    }
}
