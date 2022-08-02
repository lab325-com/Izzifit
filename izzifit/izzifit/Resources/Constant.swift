//
//  Constant.swift
//  izzifit
//
//  Created by Andrey S on 18.05.2022.
//

import Foundation

struct Constants {
    struct Notifications {
        static let updateEnergyNotification: NSNotification.Name = NSNotification.Name("updateEnergyNotification")
        static let endRemoteConfigEndNotification: NSNotification.Name = NSNotification.Name("endRemoteConfigEndNotification")
        static let newEndRemoteConfigEndNotification: NSNotification.Name = NSNotification.Name("newEndRemoteConfigEndNotification")
        static let openWorkoutNotification: NSNotification.Name = NSNotification.Name("openWorkoutNotification")
        static let pushNotification: NSNotification.Name = NSNotification.Name("pushNotification")
    }
}
