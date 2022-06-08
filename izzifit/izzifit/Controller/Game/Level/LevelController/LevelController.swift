//
//  LevelController.swift
//  izzifit
//
//  Created by O l e h on 08.06.2022.
//

import UIKit

class LevelController: BaseController {

    private var englandView: LevelView!
    
    var cgRects = [CGRect(x: 35, y: 223, width: 144, height: 132),
                   CGRect(x: 227, y: 352, width: 138, height: 119),
                   CGRect(x: 65, y: 491, width: 96, height: 134),
                   CGRect(x: 264, y: 506, width: 101, height: 154),
                   CGRect(x: 134, y: 641, width: 127, height: 137)]
    
    override func loadView() {
        englandView = LevelView(cgRects: cgRects)
        self.view = englandView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigationBar = true
        englandView.drawStates(player: PlayerModel(firstState: .fourth,
                                                   secondState: .fourth,
                                                   thirdState: .fourth,
                                                   fourthState: .fourth,
                                                   fifthState: .fourth),
                               imgStatesArr: englandView.englandLevelImgs)
    }

}
