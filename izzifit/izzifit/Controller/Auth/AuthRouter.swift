//
//  AuthRouter.swift
//  izzifit
//
//  Created by Andrey S on 17.02.2022.
//

import Foundation

class AuthRouter: BaseRouter {
    func pushLogin() {
        let controller = LoginController()
        push(controller: controller)
    }
}
