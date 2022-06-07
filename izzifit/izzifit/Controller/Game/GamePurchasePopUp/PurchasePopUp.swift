//
//  PurchasePopUp.swift
//  izzifit
//
//  Created by O l e h on 07.06.2022.
//

import UIKit

class PurchasePopUp: BaseController {
    var testView = GamePurchasePopView(title: "England",
                                       purchase1Price: 0.99,
                                       purchase2Price: 1.99)
    
    override func loadView() {
        self.view = testView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
