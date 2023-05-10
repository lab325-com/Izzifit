//
//  PreferenceManager.swift
//  Hark
//
//  Created by mob325 on 06.01.2022.
//

import Foundation

enum KeysPreference: String, CaseIterable {
   case  tempPorifle = "tempPorifle"
   case  foods =  "foods"
   case  afterOnboarding = "afterOnboarding"
   case  gameOnboardingDone = "gameOnboardingDone"
   case  drinkWidgetShowed = "drinkWidgetShowed"
   case  drintWaterInfoHidden = "drintWaterInfoHidden"
   case  mealsPlanInfoHidden = "mealsPlanInfoHidden"
   case  stepsInfoHidden = "stepsInfoHidden"
   case  pushOpen = "pushOpen"
}

class PreferencesManager : NSObject {
    
    private lazy var jsonDecoder = JSONDecoder()
    private lazy var jsonEncoder = JSONEncoder()
    
    //MARK: - Keys
    static let isFirstRun = "isFirstRun"
    //static let isStart = "isStart"
    static let tempPorifle = "tempPorifle"
    static let foods =  "foods"
    //static let widgetList = "widgetList"
    static let screensPaywall = "screensPaywall"
    static let afterOnboarding = "afterOnboarding"
    static let preOnboardingRemote = "preOnboardingRemote"
    static let enegyZero = "enegyZero"
    static let coinsZero = "coinsZero"
    static let fcmToken = "fcmToken"
    static let localPushs = "localPushs"
    static let gameOnboardingDone = "gameOnboardingDone"
    static let drinkWidgetShowed = "drinkWidgetShowed"
    static let spinsRolledCounter = "spinsRolledCounter"
    
    static let drintWaterInfoHidden = "drintWaterInfoHidden"
    static let mealsPlanInfoHidden = "mealsPlanInfoHidden"
    static let stepsInfoHidden = "stepsInfoHidden"
    static let pushOpen = "pushOpen"
    
    var userDefaults: UserDefaults
    
    required override init() {
        userDefaults = UserDefaults.standard
    }
    
    static let sharedManager: PreferencesManager = {
        let sharedInstance = PreferencesManager()
        return sharedInstance
    }()
    
    
    /// Set the models of the specified key
    ///
    /// - Parameters:
    ///   - models: The objects models to store in the defaults database
    ///   - key: The keys with which to associate the value.
    @discardableResult
    func set<Model: Codable>(_ models: [Model], forKey key: String) -> Bool {
        do {
            let data = try self.jsonEncoder.encode(models)
            userDefaults.set(data, forKey: key)
            return userDefaults.synchronize()
        }
        catch {
            debugPrint("\(#function) with error: \(error)")
            return false
        }
    }
    
    /// Returns the array of object model associated with the specified key
    ///
    /// - Parameter key: A key in the current user‘s defaults database.
    /// - Returns: The objects models associated with the specified key, or nil if the key does not exist or its value is not a data object.
    func models<Model: Codable>(forKey key: String) -> [Model]? {
        guard let data = userDefaults.data(forKey: key) else { return nil }
        do {
            return try self.jsonDecoder.decode([Model].self, from: data)
        } catch {
            debugPrint("\(#function) with error: \(error)")
            return nil
        }
    }
    
    
    /// Set the model of the specified key
    ///
    /// - Parameters:
    ///   - model: The object model to store in the defaults database
    ///   - key: The key with which to associate the value.
    /// - Returns: true if the data was saved successfully to disk, otherwise false.
    @discardableResult
    func set<Model: Codable>(_ model: Model, forKey key: String) -> Bool {
        do {
            let data = try self.jsonEncoder.encode(model)
            self.userDefaults.set(data, forKey: key)
            return self.userDefaults.synchronize()
        }
        catch {
            debugPrint("\(#function) with error: \(error)")
            return false
        }
    }
    
    /// Returns the object model associated with the specified key
    ///
    /// - Parameter key: A key in the current user‘s defaults database.
    /// - Returns: The object model associated with the specified key, or nil if the key does not exist or its value is not a data object.
    func model<Model: Codable>(forKey key: String) -> Model? {
        guard let data = self.userDefaults.data(forKey: key) else { return nil }
        do {
            return try self.jsonDecoder.decode(Model.self, from: data)
        } catch {
            debugPrint("\(#function) with error: \(error)")
            return nil
        }
    }
    
    //MARK: - Vars
    
    var isFirstRun: Bool {
        get {
            return userDefaults.bool(forKey: PreferencesManager.isFirstRun)
        }
        set {
            userDefaults.set(newValue, forKey: PreferencesManager.isFirstRun)
            userDefaults.synchronize()
        }
    }
    var spinsRolledCounter: Int {
        get {
            return userDefaults.integer(forKey: PreferencesManager.spinsRolledCounter)
        }
        set {
            userDefaults.set(newValue, forKey: PreferencesManager.spinsRolledCounter)
            userDefaults.synchronize()
        }
    }
    
//    var isStart: Bool {
//        get {
//            return userDefaults.bool(forKey: PreferencesManager.isStart)
//        }
//        set {
//            userDefaults.set(newValue, forKey: PreferencesManager.isStart)
//            userDefaults.synchronize()
//        }
//    }
    
    var tempPorifle: TempProfileModel {
        get {
            return self.model(forKey: PreferencesManager.tempPorifle) ?? TempProfileModel(name: nil)
        }
        set {
            self.set(newValue, forKey: PreferencesManager.tempPorifle)
        }
    }
    
    var foods: [FoodGroupModel]? {
        get {
            return self.models(forKey: PreferencesManager.foods)
        }
        set {
            self.set(newValue, forKey: PreferencesManager.foods)
        }
    }
    
//    var widgetList: [WidgetEntityType] {
//        get {
//            return self.models(forKey: PreferencesManager.widgetList) ?? []
//        }
//        set {
//            self.set(newValue, forKey: PreferencesManager.widgetList)
//        }
//    }
    
    var screensPaywall: [ScreensPaywallModel] {
        get {
            return self.models(forKey: PreferencesManager.screensPaywall) ?? []
        }
        set {
            self.set(newValue, forKey: PreferencesManager.screensPaywall)
        }
    }
    
    var preOnboardingRemote: PreVideoOnboardingModel? {
        get {
            return self.model(forKey: PreferencesManager.preOnboardingRemote)
        }
        set {
            self.set(newValue, forKey: PreferencesManager.preOnboardingRemote)
        }
    }
    
    var enegyZero: ZeroPopUModel? {
        get {
            return self.model(forKey: PreferencesManager.enegyZero)
        }
        set {
            self.set(newValue, forKey: PreferencesManager.enegyZero)
        }
    }
    
    var coinsZero: ZeroPopUModel? {
        get {
            return self.model(forKey: PreferencesManager.coinsZero)
        }
        set {
            self.set(newValue, forKey: PreferencesManager.coinsZero)
        }
    }
    
    var afterOnboarding: Bool {
        get {
            return userDefaults.bool(forKey: PreferencesManager.afterOnboarding)
        }
        set {
            userDefaults.set(newValue, forKey: PreferencesManager.afterOnboarding)
            userDefaults.synchronize()
        }
    }
    
    var stepsInfoHidden: Bool {
        get {
            return userDefaults.bool(forKey: PreferencesManager.stepsInfoHidden)
        }
        set {
            userDefaults.set(newValue, forKey: PreferencesManager.stepsInfoHidden)
            userDefaults.synchronize()
        }
    }
    
    var mealsPlanInfoHidden: Bool {
        get {
            return userDefaults.bool(forKey: PreferencesManager.mealsPlanInfoHidden)
        }
        set {
            userDefaults.set(newValue, forKey: PreferencesManager.mealsPlanInfoHidden)
            userDefaults.synchronize()
        }
    }
    
    var drintWaterInfoHidden: Bool {
        get {
            return userDefaults.bool(forKey: PreferencesManager.drintWaterInfoHidden)
        }
        set {
            userDefaults.set(newValue, forKey: PreferencesManager.drintWaterInfoHidden)
            userDefaults.synchronize()
        }
    }
    
    var gameOnboardingDone: Bool {
        get {
            return userDefaults.bool(forKey: PreferencesManager.gameOnboardingDone)
        }
        set {
            userDefaults.set(newValue, forKey: PreferencesManager.gameOnboardingDone)
            userDefaults.synchronize()
        }
    }

    var currentMapName: MapName? {
            get {
                return MapName(rawValue: userDefaults.string(forKey: "currentMapName") ?? "snow_map") ?? nil
            }
            set {
                userDefaults.set(newValue?.rawValue, forKey: "currentMapName")
                userDefaults.synchronize()
            }
        }

    var localPushs: [LocalPushModel] {
        get {
            return self.models(forKey: PreferencesManager.localPushs) ?? []
        }
        set {
            self.set(newValue, forKey: PreferencesManager.localPushs)
        }
    }
    
    var fcmToken: String? {
        get {
            return self.model(forKey: PreferencesManager.fcmToken)
        }
        set {
            self.set(newValue, forKey: PreferencesManager.fcmToken)
        }
    }
    
    var hummerCount: Int {
        get {
            UserDefaults.standard.integer(forKey: "hummerCount")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "hummerCount")
        }
    }
    
    var pushOpen: ParsingEvent? {
        get {
            return ParsingEvent(rawValue: UserDefaults.standard.string(forKey: PreferencesManager.pushOpen) ?? "")
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: PreferencesManager.pushOpen)
            userDefaults.synchronize()
        }
    }
    
    func deleteAcc() {
        for key in KeysPreference.allCases {
            userDefaults.removeObject(forKey: key.rawValue)
        }
        tempPorifle =  TempProfileModel(name: nil)
    }
}
