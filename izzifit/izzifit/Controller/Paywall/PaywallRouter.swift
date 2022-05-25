//
//  PaywallRouter.swift
//  izzifit
//
//  Created by Andrey S on 04.04.2022.
//

import Foundation

class PaywallRouter: BaseRouter {
    func presentPaywall(delegate: PaywallProtocol, place: PlaceType) {
        
        let screen = PreferencesManager.sharedManager.screensPaywall.first(where: {$0.place == place})?.screen
        
        switch screen {
        case .base:
            let controller = PaywallController(delegate: delegate)
            present(controller: controller)
//            let controller = PaywallSingleController(delegate: delegate)
//            present(controller: controller)
        case .onePrice:
            let controller = PaywallController(delegate: delegate)
            present(controller: controller)
        case .twoPrice:
            let controller = PaywallController(delegate: delegate)
            present(controller: controller)
        case .threePice:
            let controller = PaywallController(delegate: delegate)
            present(controller: controller)
        default:
            let controller = PaywallController(delegate: delegate)
            present(controller: controller)
        }
        
        
    }
}
