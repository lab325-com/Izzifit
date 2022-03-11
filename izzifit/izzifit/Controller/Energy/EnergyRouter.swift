//
//  EnergyRouter.swift
//  izzifit
//
//  Created by Andrey S on 11.03.2022.
//

import Foundation

class EnergyRouter: BaseRouter {
    func pushProgrress() {
        let controller = EnergyProgressController()
        push(controller: controller)
    }
}
