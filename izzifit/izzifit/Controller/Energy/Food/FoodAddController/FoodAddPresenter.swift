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
    func successUpdate()
    func successRemove()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------

protocol FoodAddPresenterProtocol: AnyObject {
    init(view: FoodAddOutputProtocol)
    
    func add(mealId: String, productId: String, amount: Int)
    func update(mealId: String, productId: String, amount: Int)
    func remove(mealId: String, productId: String)
}

class FoodAddPresenter: FoodAddPresenterProtocol {
    
    private weak var view: FoodAddOutputProtocol?
    
    required init(view: FoodAddOutputProtocol) {
        self.view = view
    }
    
    func add(mealId: String, productId: String, amount: Int) {
        view?.startLoader()
        
        let mutation = AddProductToMealMutation(record: AddProductToMealRecordInput(mealId: mealId, productId: productId, amount: amount))
        let _ = Network.shared.mutation(model: AddProductToMealModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    func update(mealId: String, productId: String, amount: Int) {
        view?.startLoader()
        
        let mutation = UpdateProductInMealMutation(record: UpdateProductInMealRecordInput(mealId: mealId, productId: productId, amount: amount))
        let _ = Network.shared.mutation(model: UpdateProductInMealModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successUpdate()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    func remove(mealId: String, productId: String) {
        view?.startLoader()
        
        let mutation = RemoveProductFromMealMutation(productId: productId, mealId: mealId)
        let _ = Network.shared.mutation(model: RemoveProductFromMealModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successRemove()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
}
