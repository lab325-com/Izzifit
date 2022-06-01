//
//  ImgsAndClrs.swift
//  izzifit
//
//  Created by Oleh Study on 15.03.2022.
//

import Foundation
import UIKit

enum Imgs: String {
    // GameView
    case gameBackTwo, gameBackOne, slotBack, spinBtnNormal, spinBtnSelected, slotHouse, freeHummer, start_logo_ic
    
    case shipStart, shipFirst, shipSecond, shipThird, shipFourth, shipFinish
    case fishStart, fishFirst, fishSecond, fishThird, fishFourth, fishFinish
    case igluStart, igluFirst, igluSecond, igluThird, igluFourth, igluFinish
    case goldStart, goldFirst, goldSecond, goldThird, goldFourth, goldFinish
    case deersStart, deersFirst, deersSecond, deersThird, deersFourth, deersFinish
    case gameTabBarEnergy, gameTabBarMap, gameTabBarBuild, gameTabBarSpin
    
    case popStartState
    case pop1Ship, pop2Ship, pop3Ship, pop4Ship, pop5Ship
    case pop1Fish, pop2Fish, pop3Fish, pop4Fish, pop5Fish
    case pop1Iglu, pop2Iglu, pop3Iglu, pop4Iglu, pop5Iglu
    case pop1Gold, pop2Gold, pop3Gold, pop4Gold, pop5Gold
    case pop1Deers, pop2Deers, pop3Deers, pop4Deers, pop5Deers
}

enum Clrs: String {
    case profileCellBack, textTitleBlack, chartPurple, pinkTarget, grayText, intensivePurple
    case clrStartSpinLbl, clrAwardTitleLbl
}

struct SlotImgs {
    static let dollar = UIImage(named: "dollar")
    static let hammer = UIImage(named: "hammer")
    static let lightning = UIImage(named: "lightning")
    static let moneyBag = UIImage(named: "moneyBag")
    static let snowflake = UIImage(named: "snowflake")
}

struct ScaleImgs {
    static let scale1Selected = UIImage(named: "Selected1Scale")
    static let scale2Selected = UIImage(named: "Selected2Scale")
    static let scale3Selected = UIImage(named: "Selected3Scale")
    static let scale4Selected = UIImage(named: "Selected4Scale")
    static let scale5Selected = UIImage(named: "Selected5Scale")
}
