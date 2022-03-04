//
//  MenuWriteQuestionPresenter.swift
//  izzifit
//
//  Created by Andrey S on 03.03.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol MenuWriteQuestionOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol MenuWriteQuestionPresenterProtocol: AnyObject {
    init(view: MenuWriteQuestionOutputProtocol)
    
    func sendQuestion(email: String, message: String)
}

class MenuWriteQuestionPresenter: MenuWriteQuestionPresenterProtocol {
    
    private weak var view: MenuWriteQuestionOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: MenuWriteQuestionOutputProtocol) {
        self.view = view
    }
    
    func sendQuestion(email: String, message: String) {
        
        let mutation = AskQuestionMutation(email: email, question: message)
        
        view?.startLoader()
        let _ = Network.shared.mutation(model: AskQuestionModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
            self?.view?.stopLoading()
        })
    }
}
