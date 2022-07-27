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
    
    // get Map Data
    
    func getMap(view: BaseController, startLoader: @escaping () -> (), stopLoader: @escaping () -> ()) {
        startLoader()
        let query = Map2Query()
        
        let _ = Network.shared.query(model: MapModel.self, query, controller: view, successHandler: { model in
         
//            self?.maps = model
//            self?.freeBuildingsCount = model.map2.freeBuildingsCount
//
//            switch model.map2.name {
//            case "snow_map": PreferencesManager.sharedManager.currentMapName = .snow_map
//            case "england_map": PreferencesManager.sharedManager.currentMapName = .england_map
//            default: break
//            }

           stopLoader()
        }, failureHandler: { error in
           stopLoader()
        })
    }
    
    
    // get spin Data
    
    
    // get buildings Data
    
    
    // send SpinID
    
    // send BuildingID
    
    
    
    
    
    
    
    private init() { }
    
}

extension GameNetworkLayer: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}


