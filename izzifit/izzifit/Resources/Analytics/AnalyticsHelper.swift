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
    case screens
}

enum FirebaseEvents: String {
    case app_open
    case login_skip
    case login_false
    
    case onb_start
    case onb_finish
    case onb_close
    case onb_skip_step
    case onb_set_name
    case onb_set_gender
    case onb_set_goal
    case onb_set_age
    case onb_set_height
    case onb_set_weight
    case onb_set_target_weight
    case onb_set_diet
    case onb_set_activity
    case onb_set_email
    
    case pay_open
    case pay_close
    case pay_purchase
    case pay_purchase_success
    case pay_purchase_false
    
    case dash_open
    case dash_water_tap
    case dash_sleep_tap
    case dash_emotion_tap
    case dash_activity_tap
    case dash_training_tap
    case dash_update_weight_tap
    case dash_meal_breakfast_tap
    case dash_meal_lunch_tap
    case dash_meal_snack_tap
    case dash_meal_dinner_tap
    case dash_meal_food_search
    case dash_meal_food_true
    case dash_meal_food_add
    case dash_meal_fodd_add_own
    
    case exe_open
    case exe_filter_tap
    case exe_tap
    
    case workout_open
    case workout_start
    case workout_finish
    case workout_mark_tap
    case workout_pause
    case workout_next_exe
    case workout_prev_exe
    case workout_skip
    case workout_countinue
    
    case profile_open
    
    case settings_open
    case settings_change
    
    case other_legal_open
    
    case spin_open
    case  spin_tap
    case spin_reward
    
    case map_open
    case map_building_tap
    case map_building_updgrade
    case map_hummer_use
    case map_building_complete
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
