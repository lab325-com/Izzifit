//
//  FoodAddPresenter.swift
//  izzifit
//
//  Created by Andrey S on 21.03.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol FoodAddOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------

protocol FoodAddPresenterProtocol: AnyObject {
    init(view: FoodAddOutputProtocol)
    
    func add(mealId: String, productId: String, amount: Int)
}

class FoodAddPresenter: FoodAddPresenterProtocol {
    
    private weak var view: FoodAddOutputProtocol?
    
    required init(view: FoodAddOutputProtocol) {
        self.view = view
    }
    
    func add(mealId: String, productId: String, amount: Int) {
        view?.startLoader()
        
        let mutation = AddProductToMealMutation(record: AddProductToMealRecordInput(productId: productId, amount: amount, mealId: mealId))
        let _ = Network.shared.mutation(model: AddProductToMealModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
}
