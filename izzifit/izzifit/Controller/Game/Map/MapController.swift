//
//  MapController.swift
//  izzifit
//
//  Created by O l e h on 02.06.2022.
//

import UIKit

class MapController: BaseController {

    private var mapView: MapView!

    
    override func loadView() {
        mapView = MapView()
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigationBar = true
    }
}

enum Maps: Int {
    case arctic = 0
    case england = 2
    case france = 4
}
