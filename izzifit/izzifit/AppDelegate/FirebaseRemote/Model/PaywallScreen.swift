//
//  PaywallScreen.swift
//  izzifit
//
//  Created by Andrey S on 23.05.2022.
//

import Foundation

enum PlaceType: String, Codable {
    case afterOnboarding //+
    case workout //+
    case dashboard //+
    case upgraidBuilding
    case afterSpeen
    case energyZero
    case goldZero
    
    case meals //+
    case drinkWater //+
    case mood //+
    case sleep //+
    case chooseAcivity //+
}

enum PaywallScreenType: String, Codable {
    case base
    case onePrice
    case twoPrice
    case threePice
}

struct PaywallScreenModel: Codable {
    let screens: [ScreensPaywallModel]
}

struct ScreensPaywallModel: Codable {
    let place: PlaceType
    let screen: PaywallScreenType?
}
