//
//  SplashViewController.swift
//  izzifit
//
//  Created by Andrey S on 09.02.2022.
//

import UIKit

class SplashViewController: BaseController {

    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector:#selector(self.endLoadConfigNotification),
                                               name: Constants.Notifications.endRemoteConfigEndNotification,
                                               object: nil)
    }
    
    @objc func endLoadConfigNotification(_ notification: Notification) {
        NotificationCenter.default.removeObserver(self)
        if let _ = KeychainService.standard.newAuthToken?.token, KeychainService.standard.me?.showOnBoarding == true {
            RootRouter.sharedInstance.loadOnboarding(toWindow: RootRouter.sharedInstance.window!)
        } else if let _ = KeychainService.standard.newAuthToken?.token {
            RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
        }else {
            RootRouter.sharedInstance.loadStart(toWindow: RootRouter.sharedInstance.window!)
        }
    }
}
