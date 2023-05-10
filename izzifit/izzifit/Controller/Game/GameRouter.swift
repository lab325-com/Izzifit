//
//  GameRouter.swift
//  izzifit
//
//  Created by mob325 on 07.06.2022.
//

import UIKit

class GameRouter: BaseRouter {
    func presentEnergyPopUp(idProducts: [InAppPurchaseType], delegate: PurchasePopUpProtocol) {
        let controller = PurchasePopUp(idProducts: idProducts, delegate: delegate)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        present(controller: controller, presentStyle: .overCurrentContext)
    }
}
