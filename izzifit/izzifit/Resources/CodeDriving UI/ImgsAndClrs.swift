//
//  ImgsAndClrs.swift
//  izzifit
//
//  Created by Oleh Study on 15.03.2022.
//

import Foundation
import UIKit

enum Imgs: String {
    //LevelView - England
    case level_england_back
    
    
    //GamePurchasePopUp
    case greenBuyBtn, backBtn, yellowPointer, buildPopUpBack, doubleLightning
    
    // GameView
    case gameBackTwo, gameBackOne, slotBack, spinBtnNormal, spinBtnSelected, slotHouse, freeHummer, start_logo_ic
    
    // MapView
    case mapViewBack
    case mapPoint_Arctic_act,mapPoint_Arctic_pass
    case mapPoint_England_act, mapPoint_England_pass
    case mapPoint_France_act, mapPoint_France_pass
    case map_1pathAct, map_1pathPass
    case map_2pathAct, map_2pathPass
    case map_3pathAct, map_3pathPass
    case map_4pathAct, map_4pathPass
    
    
    
    
    // England GameView
    case england_gameBack, england_uponBack, england_slotBack, england_slotHouse, england_freeHummer
    
    // Arctic LevelStates
    case shipStart, shipFirst, shipSecond, shipThird, shipFourth, shipFinish
    case fishStart, fishFirst, fishSecond, fishThird, fishFourth, fishFinish
    case igluStart, igluFirst, igluSecond, igluThird, igluFourth, igluFinish
    case goldStart, goldFirst, goldSecond, goldThird, goldFourth, goldFinish
    case deersStart, deersFirst, deersSecond, deersThird, deersFourth, deersFinish
    
    // England LevelStates
    
    case eng_shipStart, eng_shipFirst, eng_shipSecond, eng_shipThird, eng_shipFourth, eng_shipFinish
    case eng_bridgeStart, eng_bridgeFirst, eng_bridgeSecond, eng_bridgeThird, eng_bridgeFourth, eng_bridgeFinish
    case eng_phoneStart, eng_phoneFirst, eng_phoneSecond, eng_phoneThird, eng_phoneFourth, eng_phoneFinish
    case eng_bigBenStart, eng_bigBenFirst, eng_bigBenSecond, eng_bigBenThird, eng_bigBenFourth, eng_bigBenFinish
    case eng_busStart, eng_busFirst, eng_busSecond, eng_busThird, eng_busFourth, eng_busFinish
    
    case gameTabBarEnergy, gameTabBarMap, gameTabBarBuild, gameTabBarSpin
    
    case popStartState
    case pop1Ship, pop2Ship, pop3Ship, pop4Ship, pop5Ship
    case pop1Fish, pop2Fish, pop3Fish, pop4Fish, pop5Fish
    case pop1Iglu, pop2Iglu, pop3Iglu, pop4Iglu, pop5Iglu
    case pop1Gold, pop2Gold, pop3Gold, pop4Gold, pop5Gold
    case pop1Deers, pop2Deers, pop3Deers, pop4Deers, pop5Deers
    
    case eng_popStart,eng_1shipPop, eng_2shipPop, eng_3shipPop, eng_4shipPop, eng_5shipPop
    case eng_1bridgePop, eng_2bridgePop, eng_3bridgePop, eng_4bridgePop, eng_5bridgePop
    case eng_1phonePop, eng_2phonePop, eng_3phonePop, eng_4phonePop, eng_5phonePop
    case eng_1bigBenPop, eng_2bigBenPop, eng_3bigBenPop, eng_4bigBenPop, eng_5bigBenPop
    case eng_1busPop, eng_2busPop, eng_3busPop, eng_4busPop, eng_5busPop
    
    case onePurchaseBack, twoPurchaseBack, threePurchaseBack
    
    case purchaseCoin1, purchaseCoin2, purchaseCoin3
    case purchaseLightning1, purchaseLightning2, purchaseLightning3
}

enum Clrs: String {
    case profileCellBack, textTitleBlack, chartPurple, pinkTarget, grayText, intensivePurple
    case clrStartSpinLbl, clrAwardTitleLbl
    case clrMainMapBack
    case clrDashLinePopUp
}

struct SlotImgs {
    static let dollar = UIImage(named: "dollar")
    static let hammer = UIImage(named: "hammer")
    static let lightning = UIImage(named: "lightning")
    static let moneyBag = UIImage(named: "moneyBag")
    static let snowflake = UIImage(named: "snowflake")
}

struct UK_SlotImgs {
    static let pound = UIImage(named: "en_pound")
    static let flag = UIImage(named: "en_flag")
    static let moneyBag = UIImage(named: "en_moneyBag")
    static let hammer = UIImage(named: "en_hammer")
    static let lightning = UIImage(named: "en_lightning")
}

struct ScaleImgs {
    static let scale1Unselected = UIImage(named: "Unselected1Scale")
    static let scale2Unselected = UIImage(named: "Unselected2Scale")
    static let scale3Unselected = UIImage(named: "Unselected3Scale")
    static let scale4Unselected = UIImage(named: "Unselected4Scale")
    static let scale5Unselected = UIImage(named: "Unselected5Scale")
    
    static let scale1Selected = UIImage(named: "Selected1Scale")
    static let scale2Selected = UIImage(named: "Selected2Scale")
    static let scale3Selected = UIImage(named: "Selected3Scale")
    static let scale4Selected = UIImage(named: "Selected4Scale")
    static let scale5Selected = UIImage(named: "Selected5Scale")
}
