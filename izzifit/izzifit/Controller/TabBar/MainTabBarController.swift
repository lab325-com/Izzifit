//
//  MainTabBarController.swift
//  izzifit
//
//  Created by Andrey S on 18.02.2022.
//

import UIKit

class MainTabBarController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionLogOut(_ sender: UIButton) {
        RootRouter.sharedInstance.logout()
    }
}
