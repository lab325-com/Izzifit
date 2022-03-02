//
//  MenuFitnessPresenter.swift
//  izzifit
//
//  Created by Andrey S on 02.03.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol MenuFitnessOutputProtocol: BaseController {
    func success(models: [MusclesMainModel])
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol MenuFitnessPresenterProtocol: AnyObject {
    init(view: MenuFitnessOutputProtocol)
    
    func getMuscles()
}

class MenuFitnessPresenter: MenuFitnessPresenterProtocol {
    
    private weak var view: MenuFitnessOutputProtocol?
    
    required init(view: MenuFitnessOutputProtocol) {
        self.view = view
    }
    
    func getMuscles() {
        view?.startLoader()
        let query = MusclesQuery()
        
        let _ = Network.shared.query(model: MusclesModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.view?.success(models: model.muscles)
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
            self?.view?.stopLoading()
        })
    }
}
