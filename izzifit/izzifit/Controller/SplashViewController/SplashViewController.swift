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

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if let _ = KeychainService.standard.newAuthToken?.token, KeychainService.standard.me?.showOnBoarding == true {
                RootRouter.sharedInstance.loadOnboarding(toWindow: RootRouter.sharedInstance.window!)
            } else if let _ = KeychainService.standard.newAuthToken?.token {
                RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
            }else {
                RootRouter.sharedInstance.loadStart(toWindow: RootRouter.sharedInstance.window!)
            }
        }
    }
}
