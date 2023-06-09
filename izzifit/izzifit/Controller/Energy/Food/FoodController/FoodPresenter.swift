//
//  FoodPresenter.swift
//  izzifit
//
//  Created by mob325 on 16.03.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol FoodOutputProtocol: BaseController {
    func success()
    func successSeach()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------

protocol FoodPresenterProtocol: AnyObject {
    init(view: FoodOutputProtocol)
    
    func search(text: String, id: Int?)
    func getProducts(mealTypes: MealType, mealId: String)
}

class FoodPresenter: FoodPresenterProtocol {
    
    private weak var view: FoodOutputProtocol?
    
    required init(view: FoodOutputProtocol) {
        self.view = view
    }
    
    var recentProducts: [ProductsMainModel] = []
    var recomendetsProducts: [ProductsMainModel] = []
    var productsByMeal: [ProductsMainModel] = []
    var defaultProduct: [ProductsMainModel] = []
    
    var sourceByMeal: [SourcesByMealMainModel] = []
    
    var sections: [Int: [ProductsMainModel]] = [:]
    var namesSections: [String] = []
    
    var searchProducts: [ProductsMainModel] = []
    private var searchRequest: Cancellable?
    
    func getProducts(mealTypes: MealType, mealId: String) {
        sections.removeAll()
        namesSections.removeAll()
        
        view?.startLoader()
        
        let group = DispatchGroup()
        
        group.enter()
        let query1 = RecentProductsQuery()
        let _ = Network.shared.query(model: RecentProductsModel.self, query1, controller: view, successHandler: { [weak self] model in
            self?.recentProducts = model.recentProducts
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query2 = RecommendProductsQuery(mealType: mealTypes)
        let _ = Network.shared.query(model: RecommendProductsModel.self, query2, controller: view, successHandler: { [weak self] model in
            self?.recomendetsProducts = model.recommendProducts
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        

        group.enter()
        let query3 = ProductsByMealQuery(mealId: mealId)
        let _ = Network.shared.query(model: ProductsByMealModel.self, query3, controller: view, successHandler: { [weak self] model in
            self?.productsByMeal = model.productsByMeal
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query4 = SourcesByMealQuery(mealId: mealId)
        let _ = Network.shared.query(model: SourcesByMealModel.self, query4, controller: view, successHandler: { [weak self] model in
            self?.sourceByMeal = model.sourcesByMeal
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            guard let `self` = self else { return }
            
            if self.productsByMeal.count > 0 {
                self.sections[self.sections.count] = self.productsByMeal
                self.namesSections.append(RLocalization.food_already_eate())
            }
            
            if self.recentProducts.count > 0 {
                self.sections[self.sections.count] = self.recentProducts
                self.namesSections.append(RLocalization.food_recent())
            }
            
            if self.recomendetsProducts.count > 0 {
                self.sections[self.sections.count] = self.recomendetsProducts
                self.namesSections.append(RLocalization.food_we_recomend())
            }
            
            if self.productsByMeal.count == 0 && self.recentProducts.count == 0 && self.recomendetsProducts.count == 0 {
                let query = ProductsQuery(search: "", sourceIds: nil, onlyToggled: true)
                let _ = Network.shared.query(model: ProductsModel.self, query, controller: self.view, successHandler: { [weak self] model in
                    guard let `self` = self else { return }
                    self.sections[self.sections.count] = model.products
                    self.namesSections.append("Product")
                    self.view?.stopLoading()
                    self.view?.success()
                }, failureHandler: { [weak self] error in
                    self?.view?.stopLoading()
                    self?.view?.failure()
                })
            } else {
                self.view?.stopLoading()
                self.view?.success()
            }
        }
    }
    
    func search(text: String, id: Int?) {
        //view?.startLoader()
        
        searchRequest?.cancel()
        
        let query = ProductsQuery(search: text, sourceIds: id != nil ? [id] : nil, onlyToggled: true)
        searchRequest = Network.shared.query(model: ProductsModel.self, query, controller: view, successHandler: { [weak self] model in
            if model.products.count != 0 {
                AnalyticsHelper.sendFirebaseEvents(events: .dash_meal_food_true)
            }
            
            self?.searchProducts = model.products
            //self?.view?.stopLoading()
            self?.view?.successSeach()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            //self?.view?.failure()
        })
    }
}
