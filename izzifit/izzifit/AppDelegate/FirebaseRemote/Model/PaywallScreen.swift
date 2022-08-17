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
    case afterAnimateOnboarding
    
    case workoutTraini //+
    case meals //+
    case drinkWater //+
    case mood //+
    case sleep //+
    case chooseAcivity //+
    
    case push
    case settings
}

enum PaywallScreenType: String, Codable {
    case base
    case onePrice
    case twoPrice
    case threePrice
    case oneTime
    case congratulations
    
    case energyBuy
    case wokoutInApp
    case dietPlan
    
    case variant11
    case variant12
    case variant13
    
    case allSubs
}

struct PaywallScreenModel: Codable {
    let screens: [ScreensPaywallModel]
}

struct ScreensPaywallModel: Codable {
    let place: PlaceType
    let screen: PaywallScreenType?
}
