//
//  GameRouter.swift
//  izzifit
//
//  Created by Andrey S on 07.06.2022.
//

import UIKit

class GameRouter: BaseRouter {
    func presentEnergyPopUp(titlePopUp: String) {
        let controller = PurchasePopUp(titlePopUp: titlePopUp)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        present(controller: controller, presentStyle: .overCurrentContext)
    }
}
