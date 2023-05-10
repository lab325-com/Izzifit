//
//  LoginModel.swift
//  izzifit
//
//  Created by mob325 on 16.02.2022.
//

import Foundation

struct LoginModel: Codable {
    let login: LoginMainModel
}

struct LoginMainModel: Codable {
    let token: String
}
