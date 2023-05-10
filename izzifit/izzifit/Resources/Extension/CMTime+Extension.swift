//
//  CMTime+Extension.swift
//  izzifit
//
//  Created by mob325 on 14.04.2022.
//

import AVFoundation

extension CMTime {
    var durationText:String {
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let hours:Int = Int(totalSeconds / 3600)
        let minutes:Int = Int(totalSeconds % 3600 / 60)
        let seconds:Int = Int((totalSeconds % 3600) % 60)
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
