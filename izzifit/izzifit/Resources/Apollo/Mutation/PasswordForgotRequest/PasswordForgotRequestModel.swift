//
//  PasswordForgotRequest.swift
//  izzifit
//
//  Created by mob325 on 21.02.2022.
//

import Foundation

struct PasswordForgotRequestModel: Codable {
    let passwordForgotRequest: PasswordForgotMainRequestModel
}

struct PasswordForgotMainRequestModel: Codable {
    let token: String?
}

