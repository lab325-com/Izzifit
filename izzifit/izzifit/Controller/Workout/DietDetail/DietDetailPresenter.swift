//
//  DietDetailPresenter.swift
//  izzifit
//
//  Created by mob325 on 12.08.2022.
//

import Foundation

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol DietDetailOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------

protocol DietDetailPresenterProtocol: AnyObject {
    init(view: DietDetailOutputProtocol)
    
    func getDiet(id: String)
}

class DietDetailPresenter: DietDetailPresenterProtocol {
    
    private weak var view: DietDetailOutputProtocol?
    var paymentsInfo = [PaymentsModel]()
    
    required init(view: DietDetailOutputProtocol) {
        self.view = view
    }
    
    var diet: DietPlanModel?
   
    var openDay: Int? = 1
    var isBuy = false
    
    func getDiet(id: String) {
        
        view?.startLoader()
        
        let query = DietPlanByIdQuery(id: id)
        let _ = Network.shared.query(model: DietPlanByIdModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.diet = model.dietPlanById
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
            self?.view?.stopLoading()
        })
    }
}
