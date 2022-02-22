//
//  PasswordForgotRequest.swift
//  izzifit
//
//  Created by Andrey S on 21.02.2022.
//

import Foundation

struct PasswordForgotRequestModel: Codable {
    let passwordForgotRequest: PasswordForgotMainRequestModel
}

struct PasswordForgotMainRequestModel: Codable {
    let token: String
}

