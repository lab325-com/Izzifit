//
//  LocalPushManager.swift
//  izzifit
//
//  Created by Andrey S on 14.06.2022.
//

import Foundation
import UserNotifications

class LocalPushManager {
    private let userNotificationCenter = UNUserNotificationCenter.current()
    
    static let sharedManager: LocalPushManager = {
        let sharedInstance = LocalPushManager()
        return sharedInstance
    }()
    
    func sendNotification(title: String, body: String, idetifier: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.body = body
        notificationContent.sound = .default
        //notificationContent.badge = NSNumber(value: 3)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
                                                        repeats: false)
        let request = UNNotificationRequest(identifier: idetifier,
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
}
