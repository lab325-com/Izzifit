//
//  PaywallRouter.swift
//  izzifit
//
//  Created by Andrey S on 04.04.2022.
//

import Foundation

class PaywallRouter: BaseRouter {
    func presentPaywall(delegate: PaywallProtocol) {
        let controller = PaywallController(delegate: delegate)
        present(controller: controller)
    }
    
    func presentPaywallSingle() {
        let controller = PaywallSingleController()
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        present(controller: controller, presentStyle: .overFullScreen)
    }
}
