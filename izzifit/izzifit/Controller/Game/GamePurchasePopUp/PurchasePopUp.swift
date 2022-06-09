//
//  PurchasePopUp.swift
//  izzifit
//
//  Created by O l e h on 07.06.2022.
//

import UIKit

struct Purchase {
    var type: PurchaseType
    var price: Double
    var count: Int
}


class PurchasePopUp: BaseController {
    var testView = GamePurchasePopView(title: "England",
                                       purchase1Price: 0.99,
                                       purchase2Price: 1.99)
    
    var onePopView = PurchasePop(title: "Arctic",
                                 popType: .threePurchases,
                                 purchaseTypes: [.spins, .spins, .coins],
                                 prices: [0.99, 2.99, 2.99],
                                 counts: [100,500, 50000])
    
    override func loadView() {
        self.view = onePopView//testView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
