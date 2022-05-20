//
//  AppDelegate.swift
//  izzifit
//
//  Created by Andrey S on 09.02.2022.
//

import UIKit
import Rswift
import SwiftyStoreKit
import Firebase
import Siren
import AppsFlyerLib
import AppTrackingTransparency

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
        FirebaseApp.configure()
        checkingPurchase()
        forceUpdate()
        
        
        /// Appsflyer
        
        AppsFlyerLib.shared().appsFlyerDevKey = "sapALRVCHUnGS6xNLJQPjS"
        AppsFlyerLib.shared().appleAppID = "1609221440"
        
        #if DEBUG
            AppsFlyerLib.shared().isDebug = true
        #else
            
        #endif
        
        
        AnalyticsHelper.sendFirebaseEvents(events: .app_open)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if #available(iOS 14, *) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    switch status {
                    case .authorized:
                        print("authorized")
                        break
                    case .denied:
                        print("denied")
                        break
                    case .notDetermined:
                        print("Not Determined")
                    case .restricted:
                        print("Restricted")
                    @unknown default:
                        print("Unknown")
                    }
                })
            }
        }
        
        return RootRouter.sharedInstance.application(didFinishLaunchingWithOptions: launchOptions as [UIApplication.LaunchOptionsKey: Any]?, window: window ?? UIWindow(frame: UIScreen.main.bounds))
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppsFlyerLib.shared().start()
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if RootRouter.sharedInstance.topViewController?.viewControllerName == "VideoPlayerController" {
            return .allButUpsideDown
        } else {
            return .portrait
        }
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
    
    private func forceUpdate() {
        let siren = Siren.shared
        let rules = Rules(promptFrequency: .immediately, forAlertType: .force)
        siren.rulesManager = RulesManager(globalRules: rules)
        siren.wail(performCheck: .onForeground) { (results) in
            switch results {
            case .success(let updateResults):
                if updateResults.alertAction == .appStore {
                    guard let url = URL(string: "itms-apps://itunes.apple.com/app/id1609221440") else { return }
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

