//
//  FoodController.swift
//  izzifit
//
//  Created by Andrey S on 14.03.2022.
//

import UIKit

class FoodController: BaseController {
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionBack(_ sender: UIButton) {
        actionBack()
    }
}
