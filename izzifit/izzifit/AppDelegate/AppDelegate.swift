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
import FirebaseMessaging
import Siren
import AppsFlyerLib
import FBSDKCoreKit
import AppTrackingTransparency

//----------------------------------------------
// MARK: - Typealias
//----------------------------------------------

typealias RLocalization = R.string.localizable
typealias RImage = R.image
typealias RColor = R.color

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let gcmMessageIDKey = "gcm.message_id"

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /// Appsflyer
        
        AppsFlyerLib.shared().appsFlyerDevKey = "sapALRVCHUnGS6xNLJQPjS"
        AppsFlyerLib.shared().appleAppID = "1609221440"
        AppsFlyerLib.shared().delegate = self

        #if DEBUG
            AppsFlyerLib.shared().isDebug = true
        #else

        #endif
        AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 60)
        
        /// Firebase
        
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        AnalyticsHelper.sendFirebaseEvents(events: .app_open)
        
        /// Facebook
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        AppEvents.shared.activateApp()
        
        if #available(iOS 14, *) {
            if ATTrackingManager.trackingAuthorizationStatus == .authorized {
                Settings.shared.isAdvertiserIDCollectionEnabled = true
                Settings.shared.isAdvertiserTrackingEnabled = true
            } else {
                Settings.shared.isAdvertiserIDCollectionEnabled = false
                Settings.shared.isAdvertiserTrackingEnabled = false
            }
        }
        
        loadConfig()
        checkingPurchase()
      //  forceUpdate()
        
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
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().delegate = self
        application.registerForRemoteNotifications()
        
        
        
        return RootRouter.sharedInstance.application(didFinishLaunchingWithOptions: launchOptions as [UIApplication.LaunchOptionsKey: Any]?, window: window ?? UIWindow(frame: UIScreen.main.bounds))
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppsFlyerLib.shared().start()
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        ApplicationDelegate.shared.application(app,
                                               open: url,
                                               sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                               annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        return true
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
    
    private func loadConfig() {
        let remoteConfig = RemoteConfig.remoteConfig()
        let fetchDuration: TimeInterval = 43200 // 12 hours
        remoteConfig.fetch(withExpirationDuration: fetchDuration) { (result, error) in
            remoteConfig.activate() { (changed, error) in
                DispatchQueue.main.async { [weak self] in
                    if let paywallScreen = RemoteConfigParameters.paywallScreen.value as? PaywallScreenModel {
                        PreferencesManager.sharedManager.screensPaywall = paywallScreen.screens
                    }
                    
                    if let preOnboarding = RemoteConfigParameters.preOnboarding.value as? PreOnboardingModel {
                        PreferencesManager.sharedManager.preOnboardingRemote = preOnboarding.video
                    }
                    
                    if let enegyZero = RemoteConfigParameters.energyZero.value as? ZeroPopUModel {
                        PreferencesManager.sharedManager.enegyZero = enegyZero
                    }
                    
                    if let coinsZero = RemoteConfigParameters.coinsZero.value as? ZeroPopUModel {
                        PreferencesManager.sharedManager.coinsZero = coinsZero
                    }
                    
                    if let localPush = RemoteConfigParameters.localPush.value as? [LocalPushModel] {
                        PreferencesManager.sharedManager.localPushs = localPush
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        NotificationCenter.default.post(name: Constants.Notifications.endRemoteConfigEndNotification,
                                                        object: self,
                                                        userInfo: nil)
                    }
                }
            }
        }
    }
}


//----------------------------------------------
// MARK: - UNUserNotificationCenterDelegate
//----------------------------------------------

extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let userInfo = notification.request.content.userInfo
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        //Messaging.messaging().appDidReceiveMessage(userInfo)
        
        print(userInfo)
        
        // Change this to your preferred presentation option
        if #available(iOS 14.0, *) {
            completionHandler([[.banner, .badge, .sound]])
        } else {
            completionHandler([[.badge, .sound]])
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        var token = ""
        for i in 0..<deviceToken.count {
            token = token + String(format: "%02.2hhx", arguments: [deviceToken[i]])
        }
        print("Device token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint("didFailToRegisterForRemoteNotificationsWithError: \(error)")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID from userNotificationCenter didReceive: \(messageID)")
        }
        
        completionHandler()
    }
    
}

//----------------------------------------------
// MARK: - MessagingDelegate
//----------------------------------------------

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        PreferencesManager.sharedManager.fcmToken = fcmToken
        let deviceToken:[String: String] = ["token": fcmToken ?? ""]
        print("Device token: ", deviceToken) // This token can be used for testing notifications on FCM
    }
}

//----------------------------------------------
// MARK: - AppsFlyerLibDelegate
//----------------------------------------------

extension AppDelegate: AppsFlyerLibDelegate {
    func onConversionDataSuccess(_ conversionInfo: [AnyHashable : Any]) {
        debugPrint("")
    }
    
    func onConversionDataFail(_ error: Error) {
        debugPrint("")
    }
}
