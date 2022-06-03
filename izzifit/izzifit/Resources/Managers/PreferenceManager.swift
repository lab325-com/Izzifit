//
//  PreferenceManager.swift
//  Hark
//
//  Created by Andrey S on 06.01.2022.
//

import Foundation

class PreferencesManager : NSObject {
    
    private lazy var jsonDecoder = JSONDecoder()
    private lazy var jsonEncoder = JSONEncoder()
    
    //MARK: - Keys
    static let isFirstRun = "isFirstRun"
    static let tempPorifle = "tempPorifle"
    static let foods =  "foods"
    //static let widgetList = "widgetList"
    static let screensPaywall = "screensPaywall"
    static let afterOnboarding = "afterOnboarding"
    static let preOnboardingRemote = "preOnboardingRemote"
    
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
    
    var afterOnboarding: Bool {
        get {
            return userDefaults.bool(forKey: PreferencesManager.afterOnboarding)
        }
        set {
            userDefaults.set(newValue, forKey: PreferencesManager.afterOnboarding)
            userDefaults.synchronize()
        }
    }
}
