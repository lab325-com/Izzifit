//
//  MapController.swift
//  izzifit
//
//  Created by O l e h on 02.06.2022.
//

import UIKit

class MapController: BaseController, UIScrollViewDelegate {

    private var mapView: MapView!
    
    var currentMapState: MapName = .snow_map

    override func loadView() {
        let x = (428 - UIScreen.main.bounds.size.width) / 2
        if let mapName = PreferencesManager.sharedManager.currentMapName {
            switch mapName {
            case .snow_map:
                mapView = MapView(mapPoint: .arctic)
                mapView.scrollView.setContentOffset(CGPoint(x: x, y: 2125),animated: true)
                mapView.scrollView.isUserInteractionEnabled = false
            case .england_map:
                mapView = MapView(mapPoint: .england)
                mapView.scrollView.setContentOffset(CGPoint(x: x, y: 1490),animated: true) // 1825
                mapView.scrollView.isUserInteractionEnabled = true
            case .france_map:
                mapView = MapView(mapPoint: .france)
                mapView.scrollView.setContentOffset(CGPoint(x: x, y: 1490) ,animated: true)
                mapView.scrollView.isUserInteractionEnabled = true
            }
            currentMapState = mapName
        }
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenNavigationBar = true
        mapView.scrollView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mapView.barBackVw.getCoinsAndEnergy()
        if let mapName = PreferencesManager.sharedManager.currentMapName {
            switch mapName {
            case .snow_map:  mapView.redrawMap(mapPoint: .arctic)
            case .england_map: mapView.redrawMap(mapPoint: .england)
                mapView.scrollView.isUserInteractionEnabled = true
            case .france_map:  mapView.redrawMap(mapPoint: .france)
                mapView.scrollView.isUserInteractionEnabled = true
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = (428 - UIScreen.main.bounds.size.width) / 2
        
        var comparableY = CGFloat()
        var scrollToY = CGFloat()
        if let mapName = PreferencesManager.sharedManager.currentMapName {
            switch mapName {
        case .snow_map: break
        case .england_map: comparableY = 1625
                           scrollToY = 1825
        case .france_map: comparableY = 1425
                          scrollToY = 1490
        }
        }
     
        if scrollView.contentOffset.y <  comparableY  { // 1625
            scrollView.isScrollEnabled = false
            let anim = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
                scrollView.isScrollEnabled = false
                scrollView.setContentOffset(CGPoint(x: x, y: scrollToY ), animated: false) //  1825
                scrollView.isScrollEnabled = true
            }
            anim.startAnimation()
        }
    }
}

enum Maps: Int {
    case arctic = 0
    case england = 2
    case france = 4
}

