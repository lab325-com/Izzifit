//
//  LevelStates.swift
//  izzifit
//
//  Created by O l e h on 11.04.2022.
//

import Foundation


enum LevelStates {
    case start, first, second, third, fourth, finish
}

struct PlayerModel {
    var shipState: LevelStates
    var fishState: LevelStates
    var igluState: LevelStates
    var goldState: LevelStates
    var deerState: LevelStates
}
