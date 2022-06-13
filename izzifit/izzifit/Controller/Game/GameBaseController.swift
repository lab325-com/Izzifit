//
//  GameBaseController.swift
//  izzifit
//
//  Created by O l e h on 10.06.2022.
//

import UIKit



class GameBaseController: BaseController {
    
    var first: UIViewController
    var second: UIViewController
    private var currentScreen: MapName? = PreferencesManager.sharedManager.currentMapName
    
    @objc func endLoadConfigNotification(_ notification: Notification) {
    guard currentScreen != PreferencesManager.sharedManager.currentMapName else { return }
         updateController()
    }
    
    init(firstVC: UIViewController, secondVC: UIViewController) {
        
        self.first = firstVC
        self.second = secondVC
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {  fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateController()
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(self.endLoadConfigNotification),
                                               name: Constants.Notifications.endRemoteConfigEndNotification,
                                               object: nil)
        self.view.layer.backgroundColor = UIColor.white.cgColor
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func updateController() {
        first.removeContainer()
        second.removeContainer()
        switch PreferencesManager.sharedManager.currentMapName {
        case .england_map:  self.addContainer(child: second, to: self.view)
        case .snow_map: self.addContainer(child: first, to: self.view)
        case .none: break
        }
    }
}
