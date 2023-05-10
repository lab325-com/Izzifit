//
//  PaywallPushRouter.swift
//  izzifit
//
//  Created by mob325 on 02.08.2022.
//

import Foundation

class PaywallPushRouter: BaseRouter {
    func presentPaywall(delegate: PaywallProtocol) -> Bool {
        
        if KeychainService.standard.me?.Subscription != nil {
            return false
        }
        
        guard let type = PreferencesManager.sharedManager.pushOpen else { return false }
        
        switch type {
        case .water, .waterNotFinished:
            let controller = Paywall30Controller(delegate: delegate, screen: .variant11, place: .push)
            present(controller: controller)
        case .mood:
            let controller = Paywall30Controller(delegate: delegate, screen: .variant12, place: .push)
            present(controller: controller)
        default:
            let controller = Paywall30Controller(delegate: delegate, screen: .variant13, place: .push)
            present(controller: controller)
        }
        
        return true
    }
}
