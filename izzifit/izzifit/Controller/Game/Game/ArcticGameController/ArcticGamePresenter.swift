//
//  ArcticGamePresenter.swift
//  izzifit
//
//  Created by Andrey S on 29.04.2022.
//

import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol ArcticGameOutputProtocol: BaseController {
    func success(map: MapModel)
    func successSpin(model: [SpinMainModel])
    func successUpgrade()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol ArcticGameProtocol: AnyObject {
    init(view: ArcticGameOutputProtocol)
    
    func getMap(completion: @escaping ([MapSpinsModel]) -> ())
    func getSpin(spinId: String)
}

class ArcticGamePresenter: ArcticGameProtocol {
    ///702FB234-1112-437A-9998-9BF039199C17
    private weak var view: ArcticGameOutputProtocol?
    required init(view: ArcticGameOutputProtocol) {
        self.view = view
    }
    
    var maps: MapModel?
    var freeBuildingsCount: Int?
    
    func getMap(completion: @escaping ([MapSpinsModel]) -> ()) {
        view?.startLoader()
        let query = MapQuery()
        let _ = Network.shared.query(model: MapModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.maps = model
            self?.freeBuildingsCount = model.map.freeBuildingsCount
            
            switch model.map.name {
            case "show_map": PreferencesManager.sharedManager.currentMapName = .snow_map
            case "england_map": PreferencesManager.sharedManager.currentMapName = .england_map
            default: break
            }

            NotificationCenter.default.post(name: Constants.Notifications.endRemoteConfigEndNotification,
                                            object: self,
                                            userInfo: nil)
            DispatchQueue.main.async {
                completion(model.map.spins)
              
            }
            self?.view?.success(map: model)
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
    
    func getSpin(spinId: String) {
        view?.startLoader()
        let query = SpinQuery(spinId: spinId)
        let _ = Network.shared.query(model: SpinModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.view?.successSpin(model: model.spin)
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
}
