//
//  GameBaseController.swift
//  izzifit
//
//  Created by O l e h on 10.06.2022.
//

import UIKit



class GameBaseController: BaseController {

    private let isArctic: Bool
    
    private lazy var arc = ArcticGameController()
    private lazy var eng = EnglandGameController()
    private var currentScreen: MapName? = PreferencesManager.sharedManager.currentMapName
    
    
    init(isArctic: Bool) {
        self.isArctic = isArctic
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func endLoadConfigNotification(_ notification: Notification) {
    guard currentScreen != PreferencesManager.sharedManager.currentMapName else { return }
         updateController()
    }
    
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
        arc.removeContainer()
        eng.removeContainer()
        switch PreferencesManager.sharedManager.currentMapName {
        case .england_map:  self.addContainer(child: eng, to: self.view)
        case .snow_map: self.addContainer(child: arc, to: self.view)
        case .none: break
        }
    }
}
