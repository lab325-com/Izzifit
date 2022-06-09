//
//  PurchasePopUp.swift
//  izzifit
//
//  Created by O l e h on 07.06.2022.
//

import UIKit

struct Purchase {
    var type: PurchaseType
    var count: Int
    var price: Double

}


class PurchasePopUp: BaseController {
    var testView = GamePurchasePopView(title: "England",
                                       purchase1Price: 0.99,
                                       purchase2Price: 1.99)
    
    var onePopView = PurchasePop(title: "Arctic", purchases: [Purchase(type: .spins, count: 100, price: 0.99),
                                                              Purchase(type: .coins, count: 25000, price: 1.99)])
    
    override func loadView() {
        self.view = onePopView//testView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
