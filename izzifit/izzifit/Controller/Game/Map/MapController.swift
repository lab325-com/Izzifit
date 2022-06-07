//
//  MapController.swift
//  izzifit
//
//  Created by O l e h on 02.06.2022.
//

import UIKit

class MapController: BaseController {

    private var mapView: MapView!
 
    private var englandView: LevelView!
    
    override func loadView() {
        hiddenNavigationBar = true
        englandView = LevelView(points: [CGPoint]())
        self.view = englandView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}

enum Maps: Int {
    case arctic = 0
    case england = 2
    case france = 4
}
