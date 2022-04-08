//
//  AppDelegate.swift
//  izzifit
//
//  Created by Andrey S on 09.02.2022.
//

import UIKit
import Rswift
import SwiftyStoreKit

//----------------------------------------------
// MARK: - Typealias
//----------------------------------------------

typealias RLocalization = R.string.localizable
typealias RImage = R.image
typealias RColor = R.color

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        checkingPurchase()
        
        return RootRouter.sharedInstance.application(didFinishLaunchingWithOptions: launchOptions as [UIApplication.LaunchOptionsKey: Any]?, window: window ?? UIWindow(frame: UIScreen.main.bounds))
    }

    private func checkingPurchase() {
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            if let controller = RootRouter.sharedInstance.topViewController as? BaseController {
                controller.stopLoading()
            }
            
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased:
//                    if let _ = KeychainService.standard.newAuthToken?.token {
//                        let receiptData = SwiftyStoreKit.localReceiptData
//                        if let receiptString = receiptData?.base64EncodedString(options: []) {
//                            let mutation = OrderCreateMutation(receipt: receiptString)
//                            let _ = Network.shared.mutation(model: OrderCreate.self, mutation, controller: nil, successHandler: { model in
//                                let _ = Network.shared.query(model: MeDataModel.self, MeQuery(), controller: nil) { model in
//                                    KeychainService.standard.me = model.me
//                                } failureHandler: { _ in
//                                }
//
//                            }, failureHandler: { _ in
//                                PreferencesManager.sharedManager.isNeedSendReceipts = true
//                            })
//                        }
//                    } else {
//                        PreferencesManager.sharedManager.isNeedSendReceipts = true
//                    }
                    
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                case .restored:
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                case .failed, .purchasing, .deferred:
                    break // do nothing
                default:
                    break
                }
            }
        }
    }
}

