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
        let x = (428 - UIScreen.main.bounds.size.width) / 2
        if let mapName = PreferencesManager.sharedManager.currentMapName {
            switch mapName {
            case .snow_map:
                mapView = MapView(mapPoint: .arctic)
                mapView.scrollView.setContentOffset(CGPoint(x: x, y: 2625 - UIScreen.main.bounds.height),animated: true)
            case .england_map:
                mapView = MapView(mapPoint: .england)
                mapView.scrollView.setContentOffset(CGPoint(x: x, y: 2625 - (UIScreen.main.bounds.height + 248)),animated: true)
            }
        }
        mapView.scrollView.isUserInteractionEnabled = false
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

