//
//  DisplayLinkEntity.swift
//  izzifit
//
//  Created by O l e h on 25.07.2022.
//

import UIKit


struct DisplayLinkEntity {
    
    var counterStartValue: Int
    var counterEndValue: Int
    var counterDuration: TimeInterval
    var counterDisplayLink: CADisplayLink?
    var counterStartDate: Date?
    
    init() {
        self.counterStartValue = 0
        self.counterEndValue =   0
        self.counterDuration =   0
        self.counterDisplayLink = nil
        self.counterStartDate =   nil
    }
    
    mutating func restartEntity() {
        counterDisplayLink?.invalidate()
        counterDisplayLink = nil
        counterStartDate =   nil
    }
}
