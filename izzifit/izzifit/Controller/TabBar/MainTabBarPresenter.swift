//
//  MainTabBarPresenter.swift
//  izzifit
//
//  Created by O l e h on 18.07.2022.
//

import UIKit
import Apollo



import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol MainTabBarOutputProtocol: BaseController {
    func drawOnboarding()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol MainTabBarProtocol: AnyObject {
    init(view: MainTabBarOutputProtocol)
    func getMe()
    func getMap()
}

class MainTabBarPresenter: MainTabBarProtocol {
    
    private weak var view: MainTabBarOutputProtocol?
    required init(view: MainTabBarOutputProtocol) {
        self.view = view
    }
    
    
    func getMe() {
      //  view?.startLoader()
        let query = MeQuery()
        let _ = Network.shared.query(model: MeModel.self, query, controller: view) { [weak self] model in
            KeychainService.standard.me = model.me
            self?.getMap()
            self?.view?.stopLoading()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
 
    func getMap() {
 
        let query = Map2Query()
        
        let _ = Network.shared.query(model: MapModel.self, query, controller: view, successHandler: { [weak self] model in
         
            switch model.map2.name {
            case "snow_map": PreferencesManager.sharedManager.currentMapName = .snow_map
            case "england_map": PreferencesManager.sharedManager.currentMapName = .england_map
            default: break
            }
            
            let allCompletedBuildings = model.map2.buildings.map({$0.level}).reduce(0, +)
            
            if allCompletedBuildings == 0 ,
                  PreferencesManager.sharedManager.currentMapName == .snow_map,
                  KeychainService.standard.me?.coins ?? 0 >= 3000 {
                PreferencesManager.sharedManager.gameOnboardingDone = false
            
            } else {
                PreferencesManager.sharedManager.gameOnboardingDone = true 
            }
                  
        
            self?.view?.drawOnboarding()
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
}
