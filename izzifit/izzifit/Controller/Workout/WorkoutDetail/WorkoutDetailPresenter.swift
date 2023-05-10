//
//  WorkoutDetailPresenter.swift
//  izzifit
//
//  Created by mob325 on 28.03.2022.
//

import Foundation
import Apollo
import UIKit
import StoreKit
import SwiftyStoreKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol WorkoutDetailOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------

protocol WorkoutDetailPresenterProtocol: AnyObject {
    init(view: WorkoutDetailOutputProtocol)
    
    func getWorkouts(id: String)
}

class WorkoutDetailPresenter: WorkoutDetailPresenterProtocol {
    
    private weak var view: WorkoutDetailOutputProtocol?
    var paymentsInfo = [PaymentsModel]()
    
    required init(view: WorkoutDetailOutputProtocol) {
        self.view = view
    }
    
    var workout: WorkoutByIdMainModel?
   
    func getWorkouts(id: String) {
        
        view?.startLoader()
        
        let query = WorkoutByIdQuery(id: id)
        let _ = Network.shared.query(model: WorkoutByIdModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.workout = model.workoutById
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.failure()
            self?.view?.stopLoading()
        })
    }
    
    func retriveNotAutoProduct(id: Set<String>) {
    
        if Set(paymentsInfo.compactMap({$0.product})) == id {
            return
        }
        
        SwiftyStoreKit.retrieveProductsInfo(id) { [weak self] results in
            if let invalidProductId = results.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                return
            }
            self?.paymentsInfo.removeAll()
            for product in results.retrievedProducts {
                if let priceString = product.localizedPrice
                    {
                    
                    let model = PaymentsModel(product: product.productIdentifier, prettyPrice: priceString, period: "", number: 0, price: product.price.doubleValue, currencySymbol: product.priceLocale.currencySymbol)
                    self?.paymentsInfo.append(model)
                } else {
                    debugPrint(">>>>>>>>>>>>>>>>>>>incorrect product!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                }
            }
            
            if self?.paymentsInfo.count == id.count {
                self?.view?.success()
            }
        }
    }
}
