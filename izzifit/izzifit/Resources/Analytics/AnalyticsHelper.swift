//
//  AnalyticsHelper.swift
//  izzifit
//
//  Created by mob325 on 10.05.2022.
//

import Foundation
import Firebase
import FirebaseAnalytics
import FBSDKCoreKit
import AppsFlyerLib

enum FirebaseScreenEvents: String {
    case screens
}

enum FirebaseEvents: String {
    case app_open
    case login_skip
    case login_false
    
    case login_fb
    case login_apple
    case login_mail
    case login_fb_true
    case login_apple_true
    case login_mail_true
    
    case onb_start
    case onb_upgrade_ok
    case onb_spin_ok
    case onb_water_ok
    case onb_finish
    
    case quiz_start
    case quiz_popup_show
    case quiz_finish
    case quiz_close
    case quiz_skip_step
    case quiz_set_name
    case quiz_set_gender
    case quiz_set_goal
    case quiz_set_age
    case quiz_set_height
    case quiz_set_weight
    case quiz_set_target_weight
    case quiz_set_diet
    case quiz_set_activity
    case quiz_set_email
    case quiz_email_validation
    
    case pay_open
    case pay_close
    case pay_purchase
    case pay_purchase_success
    case pay_purchase_false
    case pay_inapp_open
    case pay_inapp_close
    case pay_buy_free_trial
    
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
    case dash_meal_food_add_true
    case dash_meal_fodd_add_own
    case dash_steps_tap
    
    case exe_open
    case exe_filter_tap
    case exe_tap
    
    case workout_open
    case workout_start
    case workout_finish
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
    case spin_tap
    case spin_reward
    
    case map_open
    case map_building_tap
    case map_building_updgrade
    case map_hummer_use
    case map_building_complete
    
    case dash_paid_mk_tap
    case pay_paid_mk_open
    case pay_paid_mk_close
    case push_open
    
    case pay_paid_diet_tap
    case pay_paid_diet_close
    case dash_paid_diet_tap
}

enum FacebookEvents: String {
    case fb_pay_purchase
    case fb_pay_purchase_success
    case fb_pay_purchase_failure
}

class AnalyticsHelper: NSObject {
    static func sendFirebaseEvents(events: FirebaseEvents, params: [String : Any]? = nil) {
        #if DEBUG
            debugPrint("firebase & analytics debug ------->>>>: \(events.rawValue), params: \(params ?? [:])")
        #else
            Analytics.logEvent(events.rawValue, parameters: params)
        
            AppsFlyerLib.shared().logEvent(events.rawValue, withValues: params)
        #endif
    }
    
    static func sendFirebaseScreenEvent(screen: FirebaseScreenEvents) {
        #if DEBUG
            debugPrint("firebase screen debug ------->>>>: \(screen.rawValue)")
        #else
            Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: screen.rawValue])
        #endif
    }
    
    static func sendFacebookEvent(event: FacebookEvents, values: [String : Any]? = nil) {
        #if DEBUG
            debugPrint("facebook debug ------->>>>: \(event.rawValue), params: \(values ?? [:])")
        #else
            Analytics.logEvent(event.rawValue, parameters: values)
        #endif
    }
}
