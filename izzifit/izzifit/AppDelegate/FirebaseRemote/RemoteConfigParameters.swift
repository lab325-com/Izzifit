//
//  File.swift
//  izzifit
//
//  Created by Andrey S on 23.05.2022.
//

import Foundation
import Firebase

enum RemoteConfigParameters: String, CaseIterable {
    case paywallScreen = "PaywallScreen"
}

extension RemoteConfigParameters {

    var value: Codable? {
        switch self {
        case .paywallScreen:
            return try? self.toCodable().get() as PaywallScreenModel
        }
    }

    private func toCodable<T: Codable>() -> Result<T, Error> {
        let data = RemoteConfig.remoteConfig().configValue(forKey: self.rawValue).dataValue
        
         return Result { try JSONDecoder().decode(T.self, from: data) }
    }
}
