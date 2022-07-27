//
//  GameNetworkLayer.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import Apollo
import UIKit

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
    
    // get Map Data
    
    func getMap(view: BaseController, startLoader: @escaping () -> (), stopLoader: @escaping () -> ()) {
        startLoader()
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
            
            self?.getMe(view: view, stopLoader: stopLoader)
        }, failureHandler: { error in  stopLoader() })
    }
    
    // send SpinID
    
    // send BuildingID
    
    
    func getMe(view: BaseController, stopLoader: @escaping () -> ()) {
        let query = MeQuery()
        let _ = Network.shared.query(model: MeModel.self, query, controller: view) { model in
            KeychainService.standard.me = model.me
            stopLoader()
        } failureHandler: { error in stopLoader()}
    }

    private init() { }
    
}

extension GameNetworkLayer: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}


