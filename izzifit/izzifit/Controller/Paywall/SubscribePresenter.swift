//
//  SubscribePresenter.swift
//  izzifit
//
//  Created by Andrey S on 05.04.2022.
//

import Foundation
import Apollo
import UIKit
import SwiftyStoreKit
import StoreKit

struct PaymentsModel {
    let product: String
    let prettyPrice: String
    let period: String
    let number: Int
    let price: Double
    let currencySymbol: String?
    let daysTrial: Int? = nil
}

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol SubscribeOutputProtocol: BaseController {
    func successRetrive()
    func failure(error: String)
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol SubscribePresenterProtocol: AnyObject {
    init(view: SubscribeOutputProtocol)
    func retriveProduct(id: Set<String>)
}

class SubscribePresenter: SubscribePresenterProtocol {
    private weak var view: SubscribeOutputProtocol?
   
    var paymentsInfo = [PaymentsModel]()
    
    required init(view: SubscribeOutputProtocol) {
        self.view = view
    }
    
    func purchase(id: String, purchaseSuccess: @escaping (Bool, String?) -> Void) {
        view?.startLoader()
        
        SwiftyStoreKit.purchaseProduct(id, quantity: 1, atomically: true) { [weak self] result in
            switch result {
            case .success(let product):
                
                //self?.sendPrepay()
                // fetch content from your server, then:
                if product.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
                print("Purchase Success: \(product.productId)")
                
                let receiptData = SwiftyStoreKit.localReceiptData
                if let receiptString = receiptData?.base64EncodedString(options: []) {
                    let mutation = OrderCreateMutation(order: OrderCreateInputRecord(receipt: receiptString), paymentSystem: .paymentSystemNameApple)
                    let _ = Network.shared.mutation(model: OrderCreateModel.self, mutation, controller: self?.view, successHandler: {  _ in

                        purchaseSuccess(true, nil)
//                        let _ = Network.shared.query(model: MeDataModel.self, MeQuery(), controller: self?.view) { [weak self] model in
//                            KeychainService.standard.me = model.me
//                            self?.view?.stopLoading()
//                            purchaseSuccess(true, nil)
//                        } failureHandler: { [weak self] error in
//                            self?.view?.stopLoading()
//                            purchaseSuccess(false, error.localizedDescription)
//                        }

                    }, failureHandler: { [weak self] error in
                        self?.view?.stopLoading()
                        purchaseSuccess(false, error.localizedDescription)
                    })
                } else {
                    purchaseSuccess(true, nil)
                }
                
            case .error(let error):
                self?.view?.stopLoading()
                var errorMessage = ""
                switch error.code {
                case .unknown: errorMessage = "Unknown error. Please contact support"
                case .clientInvalid: errorMessage = "Not allowed to make the payment"
                case .paymentCancelled:
                    //AnalyticsHelper.sendFirebaseEvents(events: .purchase_cancel, params: ["id": id])
                    return
                case .paymentInvalid: errorMessage = "The purchase identifier was invalid"
                case .paymentNotAllowed: errorMessage = "The device is not allowed to make the payment"
                case .storeProductNotAvailable: errorMessage = "The product is not available in the current storefront"
                case .cloudServicePermissionDenied: errorMessage = "Access to cloud service information is not allowed"
                case .cloudServiceNetworkConnectionFailed: errorMessage = "Could not connect to the network"
                case .cloudServiceRevoked: errorMessage = "User has revoked permission to use this cloud service"
                default: errorMessage = (error as NSError).localizedDescription
                }
                
                //AnalyticsHelper.sendFirebaseEvents(events: .purchase_error, params: ["message": errorMessage])
                purchaseSuccess(false, errorMessage)
            case .deferred(purchase: _):
                print("handle deferred state")
            }
        }
    }
    
    func restore(_ restoreCompletion: @escaping (Bool) -> Void) {
        view?.startLoader()
        SwiftyStoreKit.restorePurchases(atomically: true) {[weak self] results in
            
            
            if results.restoreFailedPurchases.count > 0 {
                self?.view?.stopLoading()
                print("Restore Failed: \(results.restoreFailedPurchases)")
                restoreCompletion(false)
            }
            else if results.restoredPurchases.count > 0 {
                for purchase in results.restoredPurchases {
                    // fetch content from your server, then:
                    if purchase.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                    
                }
                let receiptData = SwiftyStoreKit.localReceiptData
                if let receiptString = receiptData?.base64EncodedString(options: []) {
                    let mutation = OrderCreateMutation(order: OrderCreateInputRecord(receipt: receiptString), paymentSystem: .paymentSystemNameApple)
                    let _ = Network.shared.mutation(model: OrderCreateModel.self, mutation, controller: self?.view, successHandler: { _ in
                        
                        restoreCompletion(true)
//                        let _ = Network.shared.query(model: MeDataModel.self, MeQuery(), controller: self?.view) { [weak self] model in
//                            KeychainService.standard.me = model.me
//                            self?.view?.stopLoading()
//                            restoreCompletion(true)
//                        } failureHandler: { [weak self] error in
//                            self?.view?.stopLoading()
//                            restoreCompletion(false)
//                        }

                    }, failureHandler: { [weak self] error in
                        self?.view?.stopLoading()
                        restoreCompletion(false)
                    })
                } else {
                    self?.view?.stopLoading()
                    restoreCompletion(false)
                }
                print("Restore Success: \(results.restoredPurchases)")
               
                
            }
            else {
                self?.view?.stopLoading()
                restoreCompletion(false)
            }
        }
    }
    
    func retriveProduct(id: Set<String>) {
        if paymentsInfo.count == id.count  {
            return
        }
        view?.startLoader()
        SwiftyStoreKit.retrieveProductsInfo(id) { [weak self] results in
            if let invalidProductId = results.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                self?.view?.stopLoading()
                return
            }
            
            for product in results.retrievedProducts {
                if let priceString = product.localizedPrice,
                   let number = product.subscriptionPeriod?.numberOfUnits,
                   let period = self?.getCurrentPeriod(product.subscriptionPeriod?.unit, number: number)?.components(separatedBy: " ").last {
                    
                    let model = PaymentsModel(product: product.productIdentifier, prettyPrice: priceString, period: period, number: number, price: Double(truncating: product.price), currencySymbol: product.priceLocale.currencySymbol)
                    self?.paymentsInfo.append(model)
                } else {
                    debugPrint(">>>>>>>>>>>>>>>>>>>incorrect product!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                }
            }
            
            if self?.paymentsInfo.count == id.count {
                self?.view?.stopLoading()
                self?.view?.successRetrive()
            }
        }
    }
    
    private func getCurrentPeriod(_ product: SKProduct.PeriodUnit?, number: Int) -> String? {
        switch product {
        case .day:
            let formatString : String = NSLocalizedString("day count",
                                                          comment: "count string format to be found in Localized.stringsdict")
            return  String.localizedStringWithFormat(formatString, number)
        case .month:
            let formatString : String = NSLocalizedString("month count",
                                                          comment: "count string format to be found in Localized.stringsdict")
            return  String.localizedStringWithFormat(formatString, number)
        case .week:
            let formatString : String = NSLocalizedString("week count",
                                                          comment: "count string format to be found in Localized.stringsdict")
            return  String.localizedStringWithFormat(formatString, number)
        case .year:
            let formatString : String = NSLocalizedString("year count",
                                                          comment: "count string format to be found in Localized.stringsdict")
            return  String.localizedStringWithFormat(formatString, number)
        case .none:
            let formatString : String = NSLocalizedString("week count",
                                                          comment: "count string format to be found in Localized.stringsdict")
            return String.localizedStringWithFormat(formatString, number)
        @unknown default:
            return "\(number)"
        }
    }
}
