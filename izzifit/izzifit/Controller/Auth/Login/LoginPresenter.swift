//
//  LoginPresenter.swift
//  izzifit
//
//  Created by Andrey S on 18.02.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol LoginOutputProtocol: BaseController {
    func successGoOnboarding()
    func successGoMain()
    func successForgotPass()
    
    func failure(error: String)
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol LoginPresenterProtocol: AnyObject {
    init(view: LoginOutputProtocol)
    
    func login(email: String, password: String)
    func socialAuthType(authType: AuthType)
}

class LoginPresenter: LoginPresenterProtocol {
    ///702FB234-1112-437A-9998-9BF039199C17
    private weak var view: LoginOutputProtocol?
    private let udid = UIDevice.current.identifierForVendor!.uuidString
    private lazy var socialManager: SocialManager = SocialManager(controller: view!, delegate: self)
    
    required init(view: LoginOutputProtocol) {
        self.view = view
    }
    
    func login(email: String, password: String) {
        view?.startLoader()
        let mutation = LoginMutation(record: LoginRecordInput(email: email, password: password, authType: .authTypeEmail, firebaseId: PreferencesManager.sharedManager.fcmToken, timezone: TimeZone.current.identifier))
        let _ = Network.shared.mutation(model: LoginModel.self, mutation, controller: view, successHandler: { [weak self] model in
            KeychainService.standard.newAuthToken = AuthModel(token: model.login.token)
            self?.me(token: model.login.token)
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
    
    func socialAuthType(authType: AuthType) {
        switch authType {
        case .authTypeApple:
            socialManager.loginApple()
        case .authTypeFacebook:
            socialManager.loginFacebook()
        case .authTypeGoogle:
            return
        case .authTypeUdid:
            return
        case .authTypeEmail:
            return
        case .__unknown(_):
            return
        }
    }
    
    func socialLogin(authType: AuthType, token: String) {
        view?.startLoader()
        let record = LoginRecordInput(token: token, udid: udid, authType: authType, firebaseId: PreferencesManager.sharedManager.fcmToken, timezone: TimeZone.current.identifier)
        let mutation = LoginMutation(record: record)
        let _ = Network.shared.mutation(model: LoginModel.self, mutation, controller: view, successHandler: { [weak self] model in
            KeychainService.standard.newAuthToken = AuthModel(token: model.login.token)
            self?.me(token: model.login.token)
        }, failureHandler: { [weak self] error in
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
    
    func forgotPasswordUpdate(email: String) {
        view?.startLoader()
        let mutation = PasswordForgotRequestMutation(email: email)
        let _ = Network.shared.mutation(model: PasswordForgotRequestModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successForgotPass()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}

//----------------------------------------------
// MARK: - SocialManagerDelegate
//----------------------------------------------

extension LoginPresenter: SocialManagerDelegate {
    func login(authType: AuthType, token: String) {
        socialLogin(authType: authType, token: token)
    }
    
    func login(authType: AuthType, error: Error?) {
        self.view?.stopLoading()
        
        if let error = error {
            self.view?.failure(error: error.localizedDescription)
        }
    }
}
