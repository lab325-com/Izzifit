//
//  PurchasePopUp.swift
//  izzifit
//
//  Created by O l e h on 07.06.2022.
//

import UIKit

class PurchasePopUp: BaseController {
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var popUp = GamePurchasePopView(title: titlePopUp,
                                                 delegate: self)
    
    private let titlePopUp: String
    
    private lazy var presenter = SubscribePresenter(view: self)
    
    private let idFirst = "izzifit_energy_100"
    private let idSecond = "izzifit_energy_500"
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(titlePopUp: String) {
        self.titlePopUp = titlePopUp
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

    override func loadView() {
        self.view = popUp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.retriveNotAutoProduct(id: Set([idFirst, idSecond]))
    }

}

//----------------------------------------------
// MARK: - GamePurchasePopProtocol
//----------------------------------------------

extension PurchasePopUp: GamePurchasePopProtocol {
    func gamePurchasePopClose(view: GamePurchasePopView) {
        dismiss(animated: true)
    }
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension PurchasePopUp: SubscribeOutputProtocol {
    func successRetrive() {
        if let modelFirst = presenter.paymentsInfo.first(where: {$0.product == idFirst}),
           let modelSecond = presenter.paymentsInfo.first(where: {$0.product == idSecond}) {
            popUp.setPrice(first: modelFirst.prettyPrice, second: modelSecond.prettyPrice)
        }
    }
    
    func failure(error: String) {
        
    }
}
