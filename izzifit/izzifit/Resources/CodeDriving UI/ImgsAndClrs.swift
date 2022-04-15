//
//  ImgsAndClrs.swift
//  izzifit
//
//  Created by Oleh Study on 15.03.2022.
//

import Foundation
import UIKit

enum Imgs: String {
    case shipStart, shipFirst, shipSecond, shipThird, shipFourth, shipFinish
    case fishStart, fishFirst, fishSecond, fishThird, fishFourth, fishFinish
    case igluStart, igluFirst, igluSecond, igluThird, igluFourth, igluFinish
    case goldStart, goldFirst, goldSecond, goldThird, goldFourth, goldFinish
    case deersStart, deersFirst, deersSecond, deersThird, deersFourth, deersFinish
    case gameTabBarEnergy, gameTabBarMap, gameTabBarPrizes, gameTabBarSpin
}

enum Clrs: String {
    case profileCellBack, textTitleBlack, chartPurple, pinkTarget, grayText, intensivePurple
}


struct SlotImgs {
    static let dollar = UIImage(named: "dollar")
    static let hammer = UIImage(named: "hammer")
    static let lightning = UIImage(named: "lightning")
    static let moneyBag = UIImage(named: "moneyBag")
    static let snowflake = UIImage(named: "snowflake")
}

