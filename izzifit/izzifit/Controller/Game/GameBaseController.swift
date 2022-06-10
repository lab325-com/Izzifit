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
    private var currentScreen = PreferencesManager.sharedManager.
    
    
    init(isArctic: Bool) {
        self.isArctic = isArctic
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func endLoadConfigNotification(_ notification: Notification) {
        if currentScreen = PreferencesManager.sharedManager { return }
    upDateController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(self.endLoadConfigNotification),
                                                name: Constants.Notifications.endRemoteConfigEndNotification,
                                                       object: nil)


 
        self.view.layer.backgroundColor = UIColor.white.cgColor

        
        
        // Do any additional setup after loading the view.
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func upDateController() {
        
        if PreferencesManager.sharedManager./// {
            self.addContainer(child: arc, to: self.view)
            
        } else {
            self.addContainer(child: eng, to: self.view)
        }
    }
}
