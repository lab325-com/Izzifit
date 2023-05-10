//
//  PurchasePopUp.swift
//  izzifit
//
//  Created by mob325 on 07.06.2022.
//

import UIKit

struct Purchase {
    var type: PurchaseType
    var count: Int
    var price: Double
}

protocol PurchasePopUpProtocol: AnyObject {
    func purchasePopUpSuccess(controller: PurchasePopUp)
    func purchasePopUpClose(controller:   PurchasePopUp)
    func purchasePopUpSpin(controller:    PurchasePopUp)
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
    
    init(idProducts: [InAppPurchaseType], delegate: PurchasePopUpProtocol) {
        
        switch PreferencesManager.sharedManager.currentMapName {
        case .snow_map:    self.titlePopUp =   "Arctic"
        case .england_map: self.titlePopUp = "England"
        case .france_map:  self.titlePopUp =  "France"
        case .none:        self.titlePopUp =   "Arctic"
        }
        
        self.delegate =    delegate
        self.idProducts = idProducts
        
        for id in idProducts {
            self.purchaseModel.append(Purchase(type: id.type, count: id.count, price: 0.99))
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

 //   override func loadView() { self.view =  popUp }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.retriveNotAutoProduct(id: Set(idProducts.compactMap({$0.rawValue})))
        AnalyticsHelper.sendFirebaseEvents(events: .pay_inapp_open, params: [ "idProduct" : idProducts])
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        self.view.addGestureRecognizer(tap)
        
        view.ui.genericlLayout(object: popUp,
                               parentView: view,
                               topC: 0,
                               bottomC: 0,
                               leadingC: 0,
                               trailingC: 0)
    }
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        AnalyticsHelper.sendFirebaseEvents(events: .pay_inapp_close, params: [ "idProduct" : idProducts])
        delegate?.purchasePopUpClose(controller: self)
        dismiss(animated: true)
    }
}

//----------------------------------------------
// MARK: - GamePurchasePopProtocol
//----------------------------------------------

extension PurchasePopUp: GamePurchasePopProtocol {
    
    func gamePurchaseSpin(view: PurchasePop) {
        AnalyticsHelper.sendFirebaseEvents(events: .pay_inapp_close, params: [ "idProduct" : idProducts])
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
        AnalyticsHelper.sendFirebaseEvents(events: .pay_inapp_close, params: [ "idProduct" : idProducts])
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
    
    func failure(error: String) { }
}
