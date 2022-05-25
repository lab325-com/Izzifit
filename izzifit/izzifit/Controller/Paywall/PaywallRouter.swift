//
//  PaywallRouter.swift
//  izzifit
//
//  Created by Andrey S on 04.04.2022.
//

import Foundation

class PaywallRouter: BaseRouter {
    func presentPaywall(delegate: PaywallProtocol, place: PlaceType) -> Bool {
        
        if KeychainService.standard.me?.Subscription != nil {
            return false
        }
        
        let screen = PreferencesManager.sharedManager.screensPaywall.first(where: {$0.place == place})?.screen
        
        switch screen {
        case .base:
            let controller = PaywallController(delegate: delegate)
            present(controller: controller)
        case .onePrice:
            let controller = PaywallSingleController(delegate: delegate)
            present(controller: controller)
        case .twoPrice:
            let controller = PaywallMultiplyController(delegate: delegate, screen: .twoPrice)
            present(controller: controller)
        case .threePrice:
            let controller = PaywallMultiplyController(delegate: delegate, screen: .threePrice)
            present(controller: controller)
        default:
            if place == .afterOnboarding || place == .workout {
                let controller = PaywallController(delegate: delegate)
                present(controller: controller)
            } else {
                return false
            }
        }
        
        return true
    }
}
