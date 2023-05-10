//
//  AudioManager.swift
//  izzifit
//
//  Created by mob325 on 27.04.2022.
//

import Foundation
import AVFoundation

enum AudioSound: String {
    case tapMain_1              = "1_tap_main"
    case spinTap_10             = "10_spin_tap"
    case spinnerMain_11         = "11_spinner_main"
    case coinsX2_13             = "13_coins_x2"
    case coinsX3_14             = "14_coins_x3"
    case coinsPackX2_15         = "15_coins_pack_x2"
    case coinsPackX3_16         = "16_coins_pack_x3"
    case energyX2_17            = "17_energy_x2"
    case energyX3_18            = "18_energy_x3"
    case superWin_19            = "19_super_win"
    case upgradeBuilding_20     = "20_upgrade_building"
    case building_21            = "21_building"
    case completeBuilding_22    = "22_complete_building"
}

class AudioManager {
    
    static let sharedManager: AudioManager = {
        let sharedInstance = AudioManager()
        return sharedInstance
    }()
    
    private var player: AVAudioPlayer?
    
    func playSound(type: AudioSound = .tapMain_1) {
        guard let url = Bundle.main.url(forResource: type.rawValue, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.soloAmbient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            player.volume = 0.5
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
