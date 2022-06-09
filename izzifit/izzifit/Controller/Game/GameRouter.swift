//
//  GameRouter.swift
//  izzifit
//
//  Created by Andrey S on 07.06.2022.
//

import UIKit

class GameRouter: BaseRouter {
    func presentEnergyPopUp(idProducts: [InAppPurchaseType], titlePopUp: String, delegate: PurchasePopUpProtocol) {
        let controller = PurchasePopUp(idProducts: idProducts, titlePopUp: titlePopUp, delegate: delegate)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        present(controller: controller, presentStyle: .overCurrentContext)
    }
}
