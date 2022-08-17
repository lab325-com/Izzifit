//
//  GameNetworkLayer.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import Apollo
import UIKit

protocol SpinAwardProtocol: BaseController {
    func completeAward(model: [SpinMainModel])
    func idleSpin()
}

class GameNetworkLayer {
    
    static var shared: GameNetworkLayer = {
        let manager = GameNetworkLayer()
        return manager
    }()
    
    var mapName: MapName { PreferencesManager.sharedManager.currentMapName ?? .snow_map }
    var hummersCount: Int?
    var spins: [MapSpinsModel]?
    var buildings: [BuildingsModel]?
    var slotObjects: [SpinObjectsModel]?
    var slotURLs: [URL]?
    var backMapId = String()
    
    func getMap(view: BaseController, completion: @escaping () -> ()) {
        view.startLoader()
        let query = Map2Query()
        
        let _ = Network.shared.query(model: MapModel.self, query, controller: view, successHandler: { [weak self] model in
           
            switch model.map2.name {
            case "snow_map":    PreferencesManager.sharedManager.currentMapName = .snow_map
            case "england_map": PreferencesManager.sharedManager.currentMapName = .england_map
            case "france_map":  PreferencesManager.sharedManager.currentMapName = .france_map
            default: break
            }
            
            self?.hummersCount = model.map2.freeBuildingsCount
            self?.spins =        model.map2.spins
            self?.buildings =    model.map2.buildings
            self?.slotObjects =  model.map2.spinObjects
            self?.backMapId =    model.map2.id
            
            if let slotObjects = self?.slotObjects {
             var urls = [URL]()
            for object in slotObjects {
                if let urlString = object.image.urlIosFull,
                   let url = URL(string: urlString) {
                    urls.append(url)
                }
            }
                self?.slotURLs = urls
            }
            self?.getMe(view: view) {
                completion()
            }
       
        }, failureHandler: { error in
            view.stopLoading()
        })
    }

   private func getMe(view: BaseController, completion: @escaping () -> ()) {
        let query = MeQuery()
        let _ = Network.shared.query(model: MeModel.self, query, controller: view) { model in
            KeychainService.standard.me = model.me
            completion()
            view.stopLoading()
        } failureHandler: { error in
            view.stopLoading()
        }
    }
    
    func nextMap(view: BaseController, completion: @escaping () -> ()) {
        view.startLoader()
        let mutation = FinishMapMutation(mapId: backMapId)
        let _ = Network.shared.mutation(model: FinishMapModel.self, mutation, controller: view) {
            [weak self] model in
            guard model.finishMap else { return }
            completion()
        } failureHandler: { error in
            view.stopLoading()
        }
    }
    
    func upgradeBuild(buildingId: String,
                      view: BaseController,
                      buildCompletion: @escaping () -> (),
                      completion: @escaping () -> ()) {
        view.startLoader()
        let mutation = UpgradeBuildingMutation(buildingId: buildingId)
        let _ = Network.shared.mutation(model: UpgradeBuildingModel.self,
                                        mutation,
                                        controller: view,
                                        successHandler: { [weak self] model in
            buildCompletion()
            self?.getMap(view: view, completion: { completion() })
        }, failureHandler: { [weak self] error in view.stopLoading() })
    }
    
    func getSpin(spinId: String,
                 view: SpinAwardProtocol) {
        view.startLoader()
        let query = SpinQuery(spinId: spinId)
        let _ = Network.shared.query(model: SpinModel.self, query, controller: view, successHandler: { [weak self] model in
            view.completeAward(model: model.spin)
            view.stopLoading()
        }, failureHandler: { [weak self] error in
            view.idleSpin()
            view.stopLoading()
        })
    }
    
    private init() { }
}

extension GameNetworkLayer: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}


