//
//  LevelPresenter.swift
//  izzifit
//
//  Created by O l e h on 12.05.2022.
//

import UIKit
import Apollo

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol LevelOutputProtocol: BaseController {
    func success()
    func successBuildings(model: [BuildingsModel])
    func successBuild()
    func successMe()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol LevelProtocol: AnyObject {
    init(view: LevelOutputProtocol)
    func getBuildings()
    func upgradeBuild(buildingId: String, useFreeBuilding: Bool)
}

class LevelPresenter: LevelProtocol {
    
    private weak var view: LevelOutputProtocol?
    required init(view: LevelOutputProtocol) {
        self.view = view
    }
    
    var freeBuildingsCount: Int?
    var buildings = [BuildingsModel]()
    func getBuildings() {
        view?.startLoader()
        let query = MapQuery()
        let _ = Network.shared.query(model: MapModel.self, query, controller: view, successHandler: { [weak self] model in
           self?.freeBuildingsCount = model.map.freeBuildingsCount
            self?.buildings = model.map.buildings
            self?.view?.successBuildings(model: model.map.buildings)
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
    
    func upgradeBuild(buildingId: String, useFreeBuilding: Bool) {
        view?.startLoader()
        
        let mutation = UpgradeBuildingMutation(buildingId: buildingId)
        let _ = Network.shared.mutation(model: UpgradeBuildingModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.successBuild()
            self?.getMe()
            self?.getBuildings()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
    
    func getMe() {
        let query = MeQuery()
        let _ = Network.shared.query(model: MeModel.self, query, controller: view) { [weak self] model in
            
            KeychainService.standard.me = model.me
            self?.view?.successMe()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
       
        }
    }
}



