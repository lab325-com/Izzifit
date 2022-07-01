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
    func purchasePopUpSuccess(controller: PurchasePopUp)
    func purchasePopUpClose(controller: PurchasePopUp)
    func purchasePopUpSpin(controller: PurchasePopUp)
}


enum InAppPurchaseType: String, Codable {
    case izzifit_energy_100
    case izzifit_energy_250
    case izzifit_energy_500
    
    case izzifit_gold_10000
    case izzifit_gold_25000
    case izzifit_gold_50000
    
    var count: Int {
        switch self {
        case .izzifit_energy_100:
            return 100
        case .izzifit_energy_250:
            return 250
        case .izzifit_energy_500:
            return 500
        case .izzifit_gold_10000:
            return 10000
        case .izzifit_gold_25000:
            return 25000
        case .izzifit_gold_50000:
            return 50000
        }
    }
    
    var type: PurchaseType {
        switch self {
        case .izzifit_energy_100, .izzifit_energy_250, .izzifit_energy_500:
            return .spins
        case .izzifit_gold_10000, .izzifit_gold_25000, .izzifit_gold_50000:
            return .coins
        }
    }
}


class PurchasePopUp: BaseController {
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var popUp = PurchasePop(title: titlePopUp, purchases: purchaseModel, delegate: self)

    private let titlePopUp: String
    
    private lazy var presenter = SubscribePresenter(view: self)
    
    private let idProducts: [InAppPurchaseType]
    private var purchaseModel: [Purchase] = []
    
    weak var delegate: PurchasePopUpProtocol?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(idProducts: [InAppPurchaseType], titlePopUp: String, delegate: PurchasePopUpProtocol) {
        self.titlePopUp = titlePopUp
        self.delegate = delegate
        self.idProducts = idProducts
        
        for id in idProducts {
            self.purchaseModel.append(Purchase(type: id.type, count: id.count, price: 0.99))
        }
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
        presenter.retriveNotAutoProduct(id: Set(idProducts.compactMap({$0.rawValue})))
    }
}

//----------------------------------------------
// MARK: - GamePurchasePopProtocol
//----------------------------------------------

extension PurchasePopUp: GamePurchasePopProtocol {
    
    func gamePurchaseSpin(view: PurchasePop) {
        delegate?.purchasePopUpSpin(controller: self)
        dismiss(animated: false)
    }
    
    func gamePurchasePopBuy(view: PurchasePop, tag: Int) {
        presenter.purchaseProduct(id: idProducts[safe: tag]?.rawValue ?? "", screen: .energyBuy, place: .energyZero) { [weak self] result, message in
            guard let `self` = self else { return }
            if result {
                self.delegate?.purchasePopUpSuccess(controller: self)
                self.dismiss(animated: true)
            }
        }
    }

    func gamePurchasePopClose(view: PurchasePop) {
        delegate?.purchasePopUpClose(controller: self)
        dismiss(animated: true)
    }
}

//----------------------------------------------
// MARK: - SubscribeOutputProtocol
//----------------------------------------------

extension PurchasePopUp: SubscribeOutputProtocol {
    func successRetrive() {
        var prices: [String] = []
        if let model = presenter.paymentsInfo.first(where: {$0.product == idProducts[safe: 0]?.rawValue ?? ""}) {
            prices.append(model.prettyPrice)
        }
        
        if let model = presenter.paymentsInfo.first(where: {$0.product == idProducts[safe: 1]?.rawValue ?? ""}) {
            prices.append(model.prettyPrice)
        }
        
        if let model = presenter.paymentsInfo.first(where: {$0.product == idProducts[safe: 2]?.rawValue ?? ""}) {
            prices.append(model.prettyPrice)
        }
        
        popUp.setPrice(prices: prices)
    }
    
    func failure(error: String) {
        
    }
}
