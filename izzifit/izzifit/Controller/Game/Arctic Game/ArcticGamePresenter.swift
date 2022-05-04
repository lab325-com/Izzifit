//
//  ArcticGamePresenter.swift
//  izzifit
//
//  Created by Andrey S on 29.04.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol ArcticGameOutputProtocol: BaseController {
    func success()
    func successSpin()
    func successUpgrade()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol ArcticGameProtocol: AnyObject {
    init(view: ArcticGameOutputProtocol)
    
    func getMap(completion: @escaping( ([[Int]]) -> () ))
    func getSpin(spinId: String)
    func upgrateBuild(buildingId: String)
}

class ArcticGamePresenter: ArcticGameProtocol {
    ///702FB234-1112-437A-9998-9BF039199C17
    private weak var view: ArcticGameOutputProtocol?
    
    var map: MapMainModel?
    var spins: [SpinMainModel] = []
    var intSpins: [[Int]] = []
    
    required init(view: ArcticGameOutputProtocol) {
        self.view = view
    }
    
    func getMap(completion: @escaping ([[Int]]) -> ()  ) {
        view?.startLoader()
        let query = MapQuery()
        let _ = Network.shared.query(model: MapModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.map = model.map
            var combinations = [[Int]]()
            
            DispatchQueue.main.async {
                for spin in model.map.spins {
                    combinations.append(spin.spinObjectIds)
                    print(spin.spinObjectIds)
                }
                completion(combinations)
            }
            
            self?.view?.success()
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
    
    func getSpin(spinId: String) {
        view?.startLoader()
        let query = SpinQuery(spinId: spinId)
        let _ = Network.shared.query(model: SpinModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.spins = model.spin
            self?.view?.successSpin()
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
    
    func upgrateBuild(buildingId: String) {
        view?.startLoader()
        
        let mutation = UpgradeBuildingMutation(buildingId: buildingId)
        let _ = Network.shared.mutation(model: UpgradeBuildingModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.successUpgrade()
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
}
