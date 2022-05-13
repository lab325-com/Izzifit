//
//  LevelStates.swift
//  izzifit
//
//  Created by O l e h on 11.04.2022.
//

import Foundation


enum LevelStates: Int {
    case start = 1000
    case first = 2000
    case second = 3000
    case third = 4000
    case fourth = 5000
    case finish
}

struct PlayerModel {
    var shipState: LevelStates
    var fishState: LevelStates
    var igluState: LevelStates
    var goldState: LevelStates
    var deerState: LevelStates
}
