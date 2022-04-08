//
//  QuizeFoodPresenter.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol QuizeFoodOutputProtocol: BaseController {
    func successSetProduct()
    func success(model: FoodGroupsModel)
    func successProducts(models: [ProductsMainModel])
    func failure()
}

extension QuizeFoodOutputProtocol {
    func successSetProduct() {}
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol QuizeFoodPresenterProtocol: AnyObject {
    init(view: QuizeFoodOutputProtocol)
    
    func getFoods()
}

class QuizeFoodPresenter: QuizeFoodPresenterProtocol {
    
    private weak var view: QuizeFoodOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: QuizeFoodOutputProtocol) {
        self.view = view
    }
    
    func getFoods() {
        
        view?.startLoader()
        let query = FoodGroupsQuery()
        
        let _ = Network.shared.query(model: FoodGroupsModel.self, query, controller: view, successHandler: { [weak self] model in
            PreferencesManager.sharedManager.foods = model.foodGroups
            self?.view?.stopLoading()
            self?.view?.success(model: model)
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    func getProducts(foodGroupId: Int) {
        view?.startLoader()
        let query = ProductsQuery(foodGroupId: foodGroupId)
        
        let _ = Network.shared.query(model: ProductsModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successProducts(models: model.products)
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    func setProducts(productIds: [String]) {
        view?.startLoader()
        let query = ToggleProductInRationQuery(productIds: productIds)
        let _ = Network.shared.query(model: ToggleProductInRationModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successSetProduct()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
}
