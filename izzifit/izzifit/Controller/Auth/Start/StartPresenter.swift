//
//  StartPresenter.swift
//  izzifit
//
//  Created by Andrey S on 16.02.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol StartOutputProtocol: BaseController {
    func successGoOnboarding()
    func successGoMain()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol StartPresenterProtocol: AnyObject {
    init(view: StartOutputProtocol)
    
    func login()
}

class StartPresenter: StartPresenterProtocol {
    ///702FB234-1112-437A-9998-9BF039199C17
    private weak var view: StartOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: StartOutputProtocol) {
        self.view = view
    }
    
    func login() {
        view?.startLoader()
        let mutation = LoginMutation(record: LoginRecordInput(udid: uuid, authType: .authTypeUdid))
        let _ = Network.shared.mutation(model: LoginModel.self, mutation, controller: view, successHandler: { [weak self] model in
            KeychainService.standard.newAuthToken = AuthModel(token: model.login.token)
            self?.me(token: model.login.token)
            AnalyticsHelper.sendFirebaseEvents(events: .status, params: ["ok": true])
        }, failureHandler: { [weak self] error in
            AnalyticsHelper.sendFirebaseEvents(events: .status, params: ["failure": true, "error": error.localizedDescription])
            self?.view?.stopLoading()
        })
    }
    
    func me(token: String) {
        let query = MeQuery()
        
        let _ = Network.shared.query(model: MeModel.self, query, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            KeychainService.standard.me = model.me
            
            if model.me.showOnBoarding == true {
                self?.view?.successGoOnboarding()
            } else {
                self?.view?.successGoMain()
            }
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }

    }
}
