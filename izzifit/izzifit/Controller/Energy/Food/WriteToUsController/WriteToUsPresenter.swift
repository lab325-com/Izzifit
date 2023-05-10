//
//  WriteToUsPresenter.swift
//  izzifit
//
//  Created by Andrey S on 23.08.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol WriteToUsOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol WriteToUsPresenterProtocol: AnyObject {
    init(view: WriteToUsOutputProtocol)
    
    func sendProduct(name: String, description: String)
}

class WriteToUsPresenter: WriteToUsPresenterProtocol {
    
    private weak var view: WriteToUsOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: WriteToUsOutputProtocol) {
        self.view = view
    }
    
    func sendProduct(name: String, description: String) {
        
        let mutation =  CreateProductRequestMutation(name: name, description: description)
        
        view?.startLoader()
        let _ = Network.shared.mutation(model: CreateProductReqModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
            self?.view?.stopLoading()
        })
    }
}
