//
//  EnergyPresenter.swift
//  izzifit
//
//  Created by Andrey S on 05.03.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol EnergyOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol EnergyPresenterProtocol: AnyObject {
    init(view: EnergyOutputProtocol)
    
    func getWidgets(date: String)
}

class EnergyPresenter: EnergyPresenterProtocol {
    
    private weak var view: EnergyOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: EnergyOutputProtocol) {
        self.view = view
    }
    
    var drinkWidget: DrinkWidgetMainModel?
    var sleepWidget: SleepWidgetMainModel?
    var mealsWidget: MealsWidgetMainModel?
    var moodWidget: MoodWidgetMainModel?
    
    func getWidgets(date: String) {
        
        view?.startLoader()
        
        let group = DispatchGroup()
        
        group.enter()
        let query1 = DrinkWidgetQuery(date: date)
        let _ = Network.shared.query(model: DrinkWidgetModel.self, query1, controller: view, successHandler: { [weak self] model in
            self?.drinkWidget = model.drinkWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query2 = SleepWidgetQuery(date: date)
        let _ = Network.shared.query(model: SleepWidgetModel.self, query2, controller: view, successHandler: { [weak self] model in
            self?.sleepWidget = model.sleepWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        

        group.enter()
        let query3 = MealsWidgetQuery(date: date)
        let _ = Network.shared.query(model: MealsWidgetModel.self, query3, controller: view, successHandler: { [weak self] model in
            self?.mealsWidget = model.mealsWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query4 = MoodWidgetQuery(date: date)
        let _ = Network.shared.query(model: MoodWidgetModel.self, query4, controller: view, successHandler: { [weak self] model in
            self?.moodWidget = model.moodWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            self?.view?.stopLoading()
            self?.view?.success()
        }
    }
}
