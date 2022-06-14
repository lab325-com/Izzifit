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
    case preOnboarding = "PreOnboarding"
    case energyZero = "EnergyZero"
    case coinsZero = "CoinsZero"
    case localPush = "LocalPush"
}

extension RemoteConfigParameters {

    var value: Codable? {
        switch self {
        case .paywallScreen:
            return try? self.toCodable().get() as PaywallScreenModel
        case .preOnboarding:
            return try? self.toCodable().get() as PreOnboardingModel
        case .energyZero:
            return try? self.toCodable().get() as ZeroPopUModel
        case .coinsZero:
            return try? self.toCodable().get() as ZeroPopUModel
        case .localPush:
            return try? self.toCodable().get() as [LocalPushModel]
        }
    }

    private func toCodable<T: Codable>() -> Result<T, Error> {
        let data = RemoteConfig.remoteConfig().configValue(forKey: self.rawValue).dataValue
        
         return Result { try JSONDecoder().decode(T.self, from: data) }
    }
}
