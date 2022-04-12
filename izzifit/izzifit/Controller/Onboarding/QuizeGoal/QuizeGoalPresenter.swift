//
//  QuizePresenter.swift
//  izzifit
//
//  Created by Andrey S on 11.04.2022.
//

import Foundation

protocol QuizeQoalOutputProtocol: BaseController {
    func success()
    func failure()
}

protocol QuizeQoalPresenterProtocol: AnyObject {
    init(view: QuizeQoalOutputProtocol)
    func getGoals()
}


class QuizeQoalPresenter: QuizeQoalPresenterProtocol {
    
    private weak var view: QuizeQoalOutputProtocol?
    
    var types: [QuizeGoalType] = []
    
    required init(view: QuizeQoalOutputProtocol) {
        self.view = view
    }
    
    func getGoals() {
        view?.startLoader()
        
        let query1 = AvailableGoalsQuery()
        let _ = Network.shared.query(model: AvailableGoalsModel.self, query1, controller: view) { [weak self] model in
            self?.types = model.availableGoals
            self?.view?.stopLoading()
            self?.view?.success()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        }
    }
}
