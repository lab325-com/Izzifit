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

protocol PurchasePopUpProtocol: AnyObject {
    func purchasePopUpSuccess(controlle: PurchasePopUp)
}

class PurchasePopUp: BaseController {

    var onePopView = PurchasePop(title: "Arctic", purchases: [Purchase(type: .spins, count: 100, price: 0.99),
                                                              Purchase(type: .coins, count: 25000, price: 1.99)])
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var popUp = GamePurchasePopView(title: titlePopUp,
                                                 delegate: self)
    private let titlePopUp: String
    
    private lazy var presenter = SubscribePresenter(view: self)
    
    private let idFirst = "izzifit_energy_100"
    private let idSecond = "izzifit_energy_500"
    
    weak var delegate: PurchasePopUpProtocol?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(titlePopUp: String, delegate: PurchasePopUpProtocol) {
        self.titlePopUp = titlePopUp
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

    override func loadView() {
        self.view =  popUp
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
    func gamePurchasePopBuyFirst(view: GamePurchasePopView) {
        presenter.purchaseProduct(id: idFirst, screen: .energyBuy, place: .energyZero) { [weak self] result, message in
            guard let `self` = self else { return }
            if result {
                self.delegate?.purchasePopUpSuccess(controlle: self)
                self.dismiss(animated: true)
            }
        }
    }
    
    func gamePurchasePopBuySecond(view: GamePurchasePopView) {
        presenter.purchaseProduct(id: idSecond, screen: .energyBuy, place: .energyZero) { [weak self] result, message in
            guard let `self` = self else { return }
            if result {
                self.delegate?.purchasePopUpSuccess(controlle: self)
                self.dismiss(animated: true)
            }
        }
    }
    
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
