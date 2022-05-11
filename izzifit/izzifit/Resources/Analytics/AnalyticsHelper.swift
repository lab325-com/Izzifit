//
//  AnalyticsHelper.swift
//  izzifit
//
//  Created by Andrey S on 10.05.2022.
//

import Foundation
import Firebase
import FirebaseAnalytics

enum FirebaseScreenEvents: String {
    case login_screen
    case onboarding_screen
    case onboarding_gender_screen
    case onboarding_goal_screen
    case onboarding_age_screen
    case onboarding_height_screen
    case onboarding_weight_screen
    case onboarding_target_weight_screen
    case onboarding_food_screen
    case onboarding_sport_screen
    case onboarding_email_screen
    case onboarding_progress_screen
}

enum FirebaseEvents: String {
    case open
    case source
    case status
    case step
    case complete
}

class AnalyticsHelper: NSObject {
    static func sendFirebaseEvents(events: FirebaseEvents, params: [String : Any]? = nil) {
        Analytics.logEvent(events.rawValue, parameters: params)
    }
    
    static func sendFirebaseScreenEvent(screen: FirebaseScreenEvents) {
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: screen.rawValue])
    }
}
