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
        if let mapName = PreferencesManager.sharedManager.currentMapName {
            switch mapName {
            case .snow_map:
                mapView = MapView(mapPoint: .arctic )
            case .england_map:
                mapView = MapView(mapPoint: .england )
            }
        }
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
