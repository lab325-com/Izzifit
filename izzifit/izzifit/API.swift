// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct AddProductToMealRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - mealId
  ///   - productId
  ///   - amount
  public init(mealId: Swift.Optional<String?> = nil, productId: Swift.Optional<String?> = nil, amount: Swift.Optional<Int?> = nil) {
    graphQLMap = ["mealId": mealId, "productId": productId, "amount": amount]
  }

  public var mealId: Swift.Optional<String?> {
    get {
      return graphQLMap["mealId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mealId")
    }
  }

  public var productId: Swift.Optional<String?> {
    get {
      return graphQLMap["productId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productId")
    }
  }

  public var amount: Swift.Optional<Int?> {
    get {
      return graphQLMap["amount"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }
}

public struct LoginRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - token
  ///   - udid
  ///   - email
  ///   - password
  ///   - authType
  public init(token: Swift.Optional<String?> = nil, udid: Swift.Optional<String?> = nil, email: Swift.Optional<String?> = nil, password: Swift.Optional<String?> = nil, authType: Swift.Optional<AuthType?> = nil) {
    graphQLMap = ["token": token, "udid": udid, "email": email, "password": password, "authType": authType]
  }

  public var token: Swift.Optional<String?> {
    get {
      return graphQLMap["token"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }

  public var udid: Swift.Optional<String?> {
    get {
      return graphQLMap["udid"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "udid")
    }
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: Swift.Optional<String?> {
    get {
      return graphQLMap["password"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var authType: Swift.Optional<AuthType?> {
    get {
      return graphQLMap["authType"] as? Swift.Optional<AuthType?> ?? Swift.Optional<AuthType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "authType")
    }
  }
}

public enum AuthType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case authTypeFacebook
  case authTypeGoogle
  case authTypeUdid
  case authTypeApple
  case authTypeEmail
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AUTH_TYPE_FACEBOOK": self = .authTypeFacebook
      case "AUTH_TYPE_GOOGLE": self = .authTypeGoogle
      case "AUTH_TYPE_UDID": self = .authTypeUdid
      case "AUTH_TYPE_APPLE": self = .authTypeApple
      case "AUTH_TYPE_EMAIL": self = .authTypeEmail
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .authTypeFacebook: return "AUTH_TYPE_FACEBOOK"
      case .authTypeGoogle: return "AUTH_TYPE_GOOGLE"
      case .authTypeUdid: return "AUTH_TYPE_UDID"
      case .authTypeApple: return "AUTH_TYPE_APPLE"
      case .authTypeEmail: return "AUTH_TYPE_EMAIL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AuthType, rhs: AuthType) -> Bool {
    switch (lhs, rhs) {
      case (.authTypeFacebook, .authTypeFacebook): return true
      case (.authTypeGoogle, .authTypeGoogle): return true
      case (.authTypeUdid, .authTypeUdid): return true
      case (.authTypeApple, .authTypeApple): return true
      case (.authTypeEmail, .authTypeEmail): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AuthType] {
    return [
      .authTypeFacebook,
      .authTypeGoogle,
      .authTypeUdid,
      .authTypeApple,
      .authTypeEmail,
    ]
  }
}

public struct OrderCreateInputRecord: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - receipt
  public init(receipt: Swift.Optional<String?> = nil) {
    graphQLMap = ["receipt": receipt]
  }

  public var receipt: Swift.Optional<String?> {
    get {
      return graphQLMap["receipt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "receipt")
    }
  }
}

public enum PaymentSystemName: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case paymentSystemNameApple
  case paymentSystemNameGoogle
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "PAYMENT_SYSTEM_NAME_APPLE": self = .paymentSystemNameApple
      case "PAYMENT_SYSTEM_NAME_GOOGLE": self = .paymentSystemNameGoogle
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .paymentSystemNameApple: return "PAYMENT_SYSTEM_NAME_APPLE"
      case .paymentSystemNameGoogle: return "PAYMENT_SYSTEM_NAME_GOOGLE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PaymentSystemName, rhs: PaymentSystemName) -> Bool {
    switch (lhs, rhs) {
      case (.paymentSystemNameApple, .paymentSystemNameApple): return true
      case (.paymentSystemNameGoogle, .paymentSystemNameGoogle): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [PaymentSystemName] {
    return [
      .paymentSystemNameApple,
      .paymentSystemNameGoogle,
    ]
  }
}

public struct OrderProductInputRecord: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - receipt
  public init(receipt: Swift.Optional<String?> = nil) {
    graphQLMap = ["receipt": receipt]
  }

  public var receipt: Swift.Optional<String?> {
    get {
      return graphQLMap["receipt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "receipt")
    }
  }
}

public struct ProfileUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - goal
  ///   - age
  ///   - growth
  ///   - growthMeasure
  ///   - targetWeight
  ///   - email
  ///   - password
  ///   - weight
  ///   - weightMeasure
  ///   - foodGroupId
  ///   - doSport
  ///   - gender
  ///   - fitnessPreference
  ///   - notifications
  ///   - primaryLanguageId
  ///   - reminders
  ///   - darkTheme
  public init(name: Swift.Optional<String?> = nil, goal: Swift.Optional<GoalType?> = nil, age: Swift.Optional<Int?> = nil, growth: Swift.Optional<Int?> = nil, growthMeasure: Swift.Optional<GrowthMeasure?> = nil, targetWeight: Swift.Optional<Double?> = nil, email: Swift.Optional<String?> = nil, password: Swift.Optional<String?> = nil, weight: Swift.Optional<Double?> = nil, weightMeasure: Swift.Optional<WeightMeasure?> = nil, foodGroupId: Swift.Optional<Int?> = nil, doSport: Swift.Optional<DoSportType?> = nil, gender: Swift.Optional<GenderType?> = nil, fitnessPreference: Swift.Optional<WorkoutDifficulty?> = nil, notifications: Swift.Optional<Bool?> = nil, primaryLanguageId: Swift.Optional<Int?> = nil, reminders: Swift.Optional<Bool?> = nil, darkTheme: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["name": name, "goal": goal, "age": age, "growth": growth, "growthMeasure": growthMeasure, "targetWeight": targetWeight, "email": email, "password": password, "weight": weight, "weightMeasure": weightMeasure, "foodGroupId": foodGroupId, "doSport": doSport, "gender": gender, "fitnessPreference": fitnessPreference, "notifications": notifications, "primaryLanguageId": primaryLanguageId, "reminders": reminders, "darkTheme": darkTheme]
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var goal: Swift.Optional<GoalType?> {
    get {
      return graphQLMap["goal"] as? Swift.Optional<GoalType?> ?? Swift.Optional<GoalType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "goal")
    }
  }

  public var age: Swift.Optional<Int?> {
    get {
      return graphQLMap["age"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "age")
    }
  }

  public var growth: Swift.Optional<Int?> {
    get {
      return graphQLMap["growth"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "growth")
    }
  }

  public var growthMeasure: Swift.Optional<GrowthMeasure?> {
    get {
      return graphQLMap["growthMeasure"] as? Swift.Optional<GrowthMeasure?> ?? Swift.Optional<GrowthMeasure?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "growthMeasure")
    }
  }

  public var targetWeight: Swift.Optional<Double?> {
    get {
      return graphQLMap["targetWeight"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "targetWeight")
    }
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: Swift.Optional<String?> {
    get {
      return graphQLMap["password"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var weight: Swift.Optional<Double?> {
    get {
      return graphQLMap["weight"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight")
    }
  }

  public var weightMeasure: Swift.Optional<WeightMeasure?> {
    get {
      return graphQLMap["weightMeasure"] as? Swift.Optional<WeightMeasure?> ?? Swift.Optional<WeightMeasure?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weightMeasure")
    }
  }

  public var foodGroupId: Swift.Optional<Int?> {
    get {
      return graphQLMap["foodGroupId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "foodGroupId")
    }
  }

  public var doSport: Swift.Optional<DoSportType?> {
    get {
      return graphQLMap["doSport"] as? Swift.Optional<DoSportType?> ?? Swift.Optional<DoSportType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "doSport")
    }
  }

  public var gender: Swift.Optional<GenderType?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<GenderType?> ?? Swift.Optional<GenderType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  public var fitnessPreference: Swift.Optional<WorkoutDifficulty?> {
    get {
      return graphQLMap["fitnessPreference"] as? Swift.Optional<WorkoutDifficulty?> ?? Swift.Optional<WorkoutDifficulty?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fitnessPreference")
    }
  }

  public var notifications: Swift.Optional<Bool?> {
    get {
      return graphQLMap["notifications"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notifications")
    }
  }

  public var primaryLanguageId: Swift.Optional<Int?> {
    get {
      return graphQLMap["primaryLanguageId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "primaryLanguageId")
    }
  }

  public var reminders: Swift.Optional<Bool?> {
    get {
      return graphQLMap["reminders"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "reminders")
    }
  }

  public var darkTheme: Swift.Optional<Bool?> {
    get {
      return graphQLMap["darkTheme"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "darkTheme")
    }
  }
}

public enum GoalType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case goalTypeFit
  case goalTypeLoseWeight
  case goalTypeMuscle
  case goalTypeFun
  case goalTypePlay
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GOAL_TYPE_FIT": self = .goalTypeFit
      case "GOAL_TYPE_LOSE_WEIGHT": self = .goalTypeLoseWeight
      case "GOAL_TYPE_MUSCLE": self = .goalTypeMuscle
      case "GOAL_TYPE_FUN": self = .goalTypeFun
      case "GOAL_TYPE_PLAY": self = .goalTypePlay
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .goalTypeFit: return "GOAL_TYPE_FIT"
      case .goalTypeLoseWeight: return "GOAL_TYPE_LOSE_WEIGHT"
      case .goalTypeMuscle: return "GOAL_TYPE_MUSCLE"
      case .goalTypeFun: return "GOAL_TYPE_FUN"
      case .goalTypePlay: return "GOAL_TYPE_PLAY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GoalType, rhs: GoalType) -> Bool {
    switch (lhs, rhs) {
      case (.goalTypeFit, .goalTypeFit): return true
      case (.goalTypeLoseWeight, .goalTypeLoseWeight): return true
      case (.goalTypeMuscle, .goalTypeMuscle): return true
      case (.goalTypeFun, .goalTypeFun): return true
      case (.goalTypePlay, .goalTypePlay): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GoalType] {
    return [
      .goalTypeFit,
      .goalTypeLoseWeight,
      .goalTypeMuscle,
      .goalTypeFun,
      .goalTypePlay,
    ]
  }
}

public enum GrowthMeasure: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case growthMeasureTypeSm
  case growthMeasureTypeFt
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GROWTH_MEASURE_TYPE_SM": self = .growthMeasureTypeSm
      case "GROWTH_MEASURE_TYPE_FT": self = .growthMeasureTypeFt
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .growthMeasureTypeSm: return "GROWTH_MEASURE_TYPE_SM"
      case .growthMeasureTypeFt: return "GROWTH_MEASURE_TYPE_FT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GrowthMeasure, rhs: GrowthMeasure) -> Bool {
    switch (lhs, rhs) {
      case (.growthMeasureTypeSm, .growthMeasureTypeSm): return true
      case (.growthMeasureTypeFt, .growthMeasureTypeFt): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GrowthMeasure] {
    return [
      .growthMeasureTypeSm,
      .growthMeasureTypeFt,
    ]
  }
}

public enum WeightMeasure: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case weightMeasureTypeKg
  case weightMeasureTypeLb
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "WEIGHT_MEASURE_TYPE_KG": self = .weightMeasureTypeKg
      case "WEIGHT_MEASURE_TYPE_LB": self = .weightMeasureTypeLb
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .weightMeasureTypeKg: return "WEIGHT_MEASURE_TYPE_KG"
      case .weightMeasureTypeLb: return "WEIGHT_MEASURE_TYPE_LB"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: WeightMeasure, rhs: WeightMeasure) -> Bool {
    switch (lhs, rhs) {
      case (.weightMeasureTypeKg, .weightMeasureTypeKg): return true
      case (.weightMeasureTypeLb, .weightMeasureTypeLb): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [WeightMeasure] {
    return [
      .weightMeasureTypeKg,
      .weightMeasureTypeLb,
    ]
  }
}

public enum DoSportType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case doSportTypeNewbie
  case doSportTypeRegular
  case doSportTypeProfessional
  case doSportTypeNot
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "DO_SPORT_TYPE_NEWBIE": self = .doSportTypeNewbie
      case "DO_SPORT_TYPE_REGULAR": self = .doSportTypeRegular
      case "DO_SPORT_TYPE_PROFESSIONAL": self = .doSportTypeProfessional
      case "DO_SPORT_TYPE_NOT": self = .doSportTypeNot
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .doSportTypeNewbie: return "DO_SPORT_TYPE_NEWBIE"
      case .doSportTypeRegular: return "DO_SPORT_TYPE_REGULAR"
      case .doSportTypeProfessional: return "DO_SPORT_TYPE_PROFESSIONAL"
      case .doSportTypeNot: return "DO_SPORT_TYPE_NOT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DoSportType, rhs: DoSportType) -> Bool {
    switch (lhs, rhs) {
      case (.doSportTypeNewbie, .doSportTypeNewbie): return true
      case (.doSportTypeRegular, .doSportTypeRegular): return true
      case (.doSportTypeProfessional, .doSportTypeProfessional): return true
      case (.doSportTypeNot, .doSportTypeNot): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DoSportType] {
    return [
      .doSportTypeNewbie,
      .doSportTypeRegular,
      .doSportTypeProfessional,
      .doSportTypeNot,
    ]
  }
}

public enum GenderType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case genderTypeCommon
  case genderTypeMan
  case genderTypeWoman
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GENDER_TYPE_COMMON": self = .genderTypeCommon
      case "GENDER_TYPE_MAN": self = .genderTypeMan
      case "GENDER_TYPE_WOMAN": self = .genderTypeWoman
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .genderTypeCommon: return "GENDER_TYPE_COMMON"
      case .genderTypeMan: return "GENDER_TYPE_MAN"
      case .genderTypeWoman: return "GENDER_TYPE_WOMAN"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GenderType, rhs: GenderType) -> Bool {
    switch (lhs, rhs) {
      case (.genderTypeCommon, .genderTypeCommon): return true
      case (.genderTypeMan, .genderTypeMan): return true
      case (.genderTypeWoman, .genderTypeWoman): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GenderType] {
    return [
      .genderTypeCommon,
      .genderTypeMan,
      .genderTypeWoman,
    ]
  }
}

public enum WorkoutDifficulty: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case workoutDifficultyTypeLight
  case workoutDifficultyTypeStrong
  case workoutDifficultyTypeProfessional
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "WORKOUT_DIFFICULTY_TYPE_LIGHT": self = .workoutDifficultyTypeLight
      case "WORKOUT_DIFFICULTY_TYPE_STRONG": self = .workoutDifficultyTypeStrong
      case "WORKOUT_DIFFICULTY_TYPE_PROFESSIONAL": self = .workoutDifficultyTypeProfessional
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .workoutDifficultyTypeLight: return "WORKOUT_DIFFICULTY_TYPE_LIGHT"
      case .workoutDifficultyTypeStrong: return "WORKOUT_DIFFICULTY_TYPE_STRONG"
      case .workoutDifficultyTypeProfessional: return "WORKOUT_DIFFICULTY_TYPE_PROFESSIONAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: WorkoutDifficulty, rhs: WorkoutDifficulty) -> Bool {
    switch (lhs, rhs) {
      case (.workoutDifficultyTypeLight, .workoutDifficultyTypeLight): return true
      case (.workoutDifficultyTypeStrong, .workoutDifficultyTypeStrong): return true
      case (.workoutDifficultyTypeProfessional, .workoutDifficultyTypeProfessional): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [WorkoutDifficulty] {
    return [
      .workoutDifficultyTypeLight,
      .workoutDifficultyTypeStrong,
      .workoutDifficultyTypeProfessional,
    ]
  }
}

public enum MoodType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case moodTypeGood
  case moodTypeNotBad
  case moodTypeBadly
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MOOD_TYPE_GOOD": self = .moodTypeGood
      case "MOOD_TYPE_NOT_BAD": self = .moodTypeNotBad
      case "MOOD_TYPE_BADLY": self = .moodTypeBadly
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .moodTypeGood: return "MOOD_TYPE_GOOD"
      case .moodTypeNotBad: return "MOOD_TYPE_NOT_BAD"
      case .moodTypeBadly: return "MOOD_TYPE_BADLY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MoodType, rhs: MoodType) -> Bool {
    switch (lhs, rhs) {
      case (.moodTypeGood, .moodTypeGood): return true
      case (.moodTypeNotBad, .moodTypeNotBad): return true
      case (.moodTypeBadly, .moodTypeBadly): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MoodType] {
    return [
      .moodTypeGood,
      .moodTypeNotBad,
      .moodTypeBadly,
    ]
  }
}

public enum SleepQualityType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case sleepQualityTypeGood
  case sleepQualityTypeBad
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "SLEEP_QUALITY_TYPE_GOOD": self = .sleepQualityTypeGood
      case "SLEEP_QUALITY_TYPE_BAD": self = .sleepQualityTypeBad
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .sleepQualityTypeGood: return "SLEEP_QUALITY_TYPE_GOOD"
      case .sleepQualityTypeBad: return "SLEEP_QUALITY_TYPE_BAD"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: SleepQualityType, rhs: SleepQualityType) -> Bool {
    switch (lhs, rhs) {
      case (.sleepQualityTypeGood, .sleepQualityTypeGood): return true
      case (.sleepQualityTypeBad, .sleepQualityTypeBad): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SleepQualityType] {
    return [
      .sleepQualityTypeGood,
      .sleepQualityTypeBad,
    ]
  }
}

public struct UpdateProductInMealRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - mealId
  ///   - productId
  ///   - amount
  public init(mealId: String, productId: String, amount: Int) {
    graphQLMap = ["mealId": mealId, "productId": productId, "amount": amount]
  }

  public var mealId: String {
    get {
      return graphQLMap["mealId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mealId")
    }
  }

  public var productId: String {
    get {
      return graphQLMap["productId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productId")
    }
  }

  public var amount: Int {
    get {
      return graphQLMap["amount"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }
}

public struct WorkoutAttemptUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - feedback
  public init(feedback: WorkoutAttemptFeedbackType) {
    graphQLMap = ["feedback": feedback]
  }

  public var feedback: WorkoutAttemptFeedbackType {
    get {
      return graphQLMap["feedback"] as! WorkoutAttemptFeedbackType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "feedback")
    }
  }
}

public enum WorkoutAttemptFeedbackType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case workoutAttemptFeedbackTypeHard
  case workoutAttemptFeedbackTypeLong
  case workoutAttemptFeedbackTypeWatching
  case workoutAttemptFeedbackTypeOther
  case workoutAttemptFeedbackTypeExcellent
  case workoutAttemptFeedbackTypeCanDoMore
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "WORKOUT_ATTEMPT_FEEDBACK_TYPE_HARD": self = .workoutAttemptFeedbackTypeHard
      case "WORKOUT_ATTEMPT_FEEDBACK_TYPE_LONG": self = .workoutAttemptFeedbackTypeLong
      case "WORKOUT_ATTEMPT_FEEDBACK_TYPE_WATCHING": self = .workoutAttemptFeedbackTypeWatching
      case "WORKOUT_ATTEMPT_FEEDBACK_TYPE_OTHER": self = .workoutAttemptFeedbackTypeOther
      case "WORKOUT_ATTEMPT_FEEDBACK_TYPE_EXCELLENT": self = .workoutAttemptFeedbackTypeExcellent
      case "WORKOUT_ATTEMPT_FEEDBACK_TYPE_CAN_DO_MORE": self = .workoutAttemptFeedbackTypeCanDoMore
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .workoutAttemptFeedbackTypeHard: return "WORKOUT_ATTEMPT_FEEDBACK_TYPE_HARD"
      case .workoutAttemptFeedbackTypeLong: return "WORKOUT_ATTEMPT_FEEDBACK_TYPE_LONG"
      case .workoutAttemptFeedbackTypeWatching: return "WORKOUT_ATTEMPT_FEEDBACK_TYPE_WATCHING"
      case .workoutAttemptFeedbackTypeOther: return "WORKOUT_ATTEMPT_FEEDBACK_TYPE_OTHER"
      case .workoutAttemptFeedbackTypeExcellent: return "WORKOUT_ATTEMPT_FEEDBACK_TYPE_EXCELLENT"
      case .workoutAttemptFeedbackTypeCanDoMore: return "WORKOUT_ATTEMPT_FEEDBACK_TYPE_CAN_DO_MORE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: WorkoutAttemptFeedbackType, rhs: WorkoutAttemptFeedbackType) -> Bool {
    switch (lhs, rhs) {
      case (.workoutAttemptFeedbackTypeHard, .workoutAttemptFeedbackTypeHard): return true
      case (.workoutAttemptFeedbackTypeLong, .workoutAttemptFeedbackTypeLong): return true
      case (.workoutAttemptFeedbackTypeWatching, .workoutAttemptFeedbackTypeWatching): return true
      case (.workoutAttemptFeedbackTypeOther, .workoutAttemptFeedbackTypeOther): return true
      case (.workoutAttemptFeedbackTypeExcellent, .workoutAttemptFeedbackTypeExcellent): return true
      case (.workoutAttemptFeedbackTypeCanDoMore, .workoutAttemptFeedbackTypeCanDoMore): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [WorkoutAttemptFeedbackType] {
    return [
      .workoutAttemptFeedbackTypeHard,
      .workoutAttemptFeedbackTypeLong,
      .workoutAttemptFeedbackTypeWatching,
      .workoutAttemptFeedbackTypeOther,
      .workoutAttemptFeedbackTypeExcellent,
      .workoutAttemptFeedbackTypeCanDoMore,
    ]
  }
}

public enum SpinObjectType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case spinObjectTypeCoin
  case spinObjectTypeManyCoin
  case spinObjectTypeEnergy
  case spinObjectTypeManyEnergy
  case spinObjectTypeBuild
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "SPIN_OBJECT_TYPE_COIN": self = .spinObjectTypeCoin
      case "SPIN_OBJECT_TYPE_MANY_COIN": self = .spinObjectTypeManyCoin
      case "SPIN_OBJECT_TYPE_ENERGY": self = .spinObjectTypeEnergy
      case "SPIN_OBJECT_TYPE_MANY_ENERGY": self = .spinObjectTypeManyEnergy
      case "SPIN_OBJECT_TYPE_BUILD": self = .spinObjectTypeBuild
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .spinObjectTypeCoin: return "SPIN_OBJECT_TYPE_COIN"
      case .spinObjectTypeManyCoin: return "SPIN_OBJECT_TYPE_MANY_COIN"
      case .spinObjectTypeEnergy: return "SPIN_OBJECT_TYPE_ENERGY"
      case .spinObjectTypeManyEnergy: return "SPIN_OBJECT_TYPE_MANY_ENERGY"
      case .spinObjectTypeBuild: return "SPIN_OBJECT_TYPE_BUILD"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: SpinObjectType, rhs: SpinObjectType) -> Bool {
    switch (lhs, rhs) {
      case (.spinObjectTypeCoin, .spinObjectTypeCoin): return true
      case (.spinObjectTypeManyCoin, .spinObjectTypeManyCoin): return true
      case (.spinObjectTypeEnergy, .spinObjectTypeEnergy): return true
      case (.spinObjectTypeManyEnergy, .spinObjectTypeManyEnergy): return true
      case (.spinObjectTypeBuild, .spinObjectTypeBuild): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SpinObjectType] {
    return [
      .spinObjectTypeCoin,
      .spinObjectTypeManyCoin,
      .spinObjectTypeEnergy,
      .spinObjectTypeManyEnergy,
      .spinObjectTypeBuild,
    ]
  }
}

public enum ProductMeasure: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case productMeasureTypeGram
  case productMeasureTypePcs
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "PRODUCT_MEASURE_TYPE_GRAM": self = .productMeasureTypeGram
      case "PRODUCT_MEASURE_TYPE_PCS": self = .productMeasureTypePcs
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .productMeasureTypeGram: return "PRODUCT_MEASURE_TYPE_GRAM"
      case .productMeasureTypePcs: return "PRODUCT_MEASURE_TYPE_PCS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ProductMeasure, rhs: ProductMeasure) -> Bool {
    switch (lhs, rhs) {
      case (.productMeasureTypeGram, .productMeasureTypeGram): return true
      case (.productMeasureTypePcs, .productMeasureTypePcs): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ProductMeasure] {
    return [
      .productMeasureTypeGram,
      .productMeasureTypePcs,
    ]
  }
}

public enum MealType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case mealTypeBreakfast
  case mealTypeLunch
  case mealTypeSnack
  case mealTypeDinner
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MEAL_TYPE_BREAKFAST": self = .mealTypeBreakfast
      case "MEAL_TYPE_LUNCH": self = .mealTypeLunch
      case "MEAL_TYPE_SNACK": self = .mealTypeSnack
      case "MEAL_TYPE_DINNER": self = .mealTypeDinner
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .mealTypeBreakfast: return "MEAL_TYPE_BREAKFAST"
      case .mealTypeLunch: return "MEAL_TYPE_LUNCH"
      case .mealTypeSnack: return "MEAL_TYPE_SNACK"
      case .mealTypeDinner: return "MEAL_TYPE_DINNER"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MealType, rhs: MealType) -> Bool {
    switch (lhs, rhs) {
      case (.mealTypeBreakfast, .mealTypeBreakfast): return true
      case (.mealTypeLunch, .mealTypeLunch): return true
      case (.mealTypeSnack, .mealTypeSnack): return true
      case (.mealTypeDinner, .mealTypeDinner): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MealType] {
    return [
      .mealTypeBreakfast,
      .mealTypeLunch,
      .mealTypeSnack,
      .mealTypeDinner,
    ]
  }
}

public enum SourceEntityType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case sourceEntityTypeProteins
  case sourceEntityTypeFats
  case sourceEntityTypeCarbs
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "SOURCE_ENTITY_TYPE_PROTEINS": self = .sourceEntityTypeProteins
      case "SOURCE_ENTITY_TYPE_FATS": self = .sourceEntityTypeFats
      case "SOURCE_ENTITY_TYPE_CARBS": self = .sourceEntityTypeCarbs
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .sourceEntityTypeProteins: return "SOURCE_ENTITY_TYPE_PROTEINS"
      case .sourceEntityTypeFats: return "SOURCE_ENTITY_TYPE_FATS"
      case .sourceEntityTypeCarbs: return "SOURCE_ENTITY_TYPE_CARBS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: SourceEntityType, rhs: SourceEntityType) -> Bool {
    switch (lhs, rhs) {
      case (.sourceEntityTypeProteins, .sourceEntityTypeProteins): return true
      case (.sourceEntityTypeFats, .sourceEntityTypeFats): return true
      case (.sourceEntityTypeCarbs, .sourceEntityTypeCarbs): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SourceEntityType] {
    return [
      .sourceEntityTypeProteins,
      .sourceEntityTypeFats,
      .sourceEntityTypeCarbs,
    ]
  }
}

public enum SpinObjectRewardType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case spinObjectRewardTypeCoin
  case spinObjectRewardTypeEnergy
  case spinObjectRewardTypeBuild
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "SPIN_OBJECT_REWARD_TYPE_COIN": self = .spinObjectRewardTypeCoin
      case "SPIN_OBJECT_REWARD_TYPE_ENERGY": self = .spinObjectRewardTypeEnergy
      case "SPIN_OBJECT_REWARD_TYPE_BUILD": self = .spinObjectRewardTypeBuild
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .spinObjectRewardTypeCoin: return "SPIN_OBJECT_REWARD_TYPE_COIN"
      case .spinObjectRewardTypeEnergy: return "SPIN_OBJECT_REWARD_TYPE_ENERGY"
      case .spinObjectRewardTypeBuild: return "SPIN_OBJECT_REWARD_TYPE_BUILD"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: SpinObjectRewardType, rhs: SpinObjectRewardType) -> Bool {
    switch (lhs, rhs) {
      case (.spinObjectRewardTypeCoin, .spinObjectRewardTypeCoin): return true
      case (.spinObjectRewardTypeEnergy, .spinObjectRewardTypeEnergy): return true
      case (.spinObjectRewardTypeBuild, .spinObjectRewardTypeBuild): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SpinObjectRewardType] {
    return [
      .spinObjectRewardTypeCoin,
      .spinObjectRewardTypeEnergy,
      .spinObjectRewardTypeBuild,
    ]
  }
}

public enum WidgetEntityType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case widgetEntityTypeActivity
  case widgetEntityTypeWater
  case widgetEntityTypeSleep
  case widgetEntityTypeMood
  case widgetEntityTypeMeals
  case widgetEntityTypeWorkoutMuscles
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "WIDGET_ENTITY_TYPE_ACTIVITY": self = .widgetEntityTypeActivity
      case "WIDGET_ENTITY_TYPE_WATER": self = .widgetEntityTypeWater
      case "WIDGET_ENTITY_TYPE_SLEEP": self = .widgetEntityTypeSleep
      case "WIDGET_ENTITY_TYPE_MOOD": self = .widgetEntityTypeMood
      case "WIDGET_ENTITY_TYPE_MEALS": self = .widgetEntityTypeMeals
      case "WIDGET_ENTITY_TYPE_WORKOUT_MUSCLES": self = .widgetEntityTypeWorkoutMuscles
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .widgetEntityTypeActivity: return "WIDGET_ENTITY_TYPE_ACTIVITY"
      case .widgetEntityTypeWater: return "WIDGET_ENTITY_TYPE_WATER"
      case .widgetEntityTypeSleep: return "WIDGET_ENTITY_TYPE_SLEEP"
      case .widgetEntityTypeMood: return "WIDGET_ENTITY_TYPE_MOOD"
      case .widgetEntityTypeMeals: return "WIDGET_ENTITY_TYPE_MEALS"
      case .widgetEntityTypeWorkoutMuscles: return "WIDGET_ENTITY_TYPE_WORKOUT_MUSCLES"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: WidgetEntityType, rhs: WidgetEntityType) -> Bool {
    switch (lhs, rhs) {
      case (.widgetEntityTypeActivity, .widgetEntityTypeActivity): return true
      case (.widgetEntityTypeWater, .widgetEntityTypeWater): return true
      case (.widgetEntityTypeSleep, .widgetEntityTypeSleep): return true
      case (.widgetEntityTypeMood, .widgetEntityTypeMood): return true
      case (.widgetEntityTypeMeals, .widgetEntityTypeMeals): return true
      case (.widgetEntityTypeWorkoutMuscles, .widgetEntityTypeWorkoutMuscles): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [WidgetEntityType] {
    return [
      .widgetEntityTypeActivity,
      .widgetEntityTypeWater,
      .widgetEntityTypeSleep,
      .widgetEntityTypeMood,
      .widgetEntityTypeMeals,
      .widgetEntityTypeWorkoutMuscles,
    ]
  }
}

public final class AddProductToMealMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddProductToMeal($record: AddProductToMealRecordInput!) {
      addProductToMeal(record: $record)
    }
    """

  public let operationName: String = "AddProductToMeal"

  public var record: AddProductToMealRecordInput

  public init(record: AddProductToMealRecordInput) {
    self.record = record
  }

  public var variables: GraphQLMap? {
    return ["record": record]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addProductToMeal", arguments: ["record": GraphQLVariable("record")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addProductToMeal: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addProductToMeal": addProductToMeal])
    }

    public var addProductToMeal: Bool? {
      get {
        return resultMap["addProductToMeal"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "addProductToMeal")
      }
    }
  }
}

public final class AskQuestionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AskQuestion($email: String!, $question: String!) {
      askQuestion(email: $email, question: $question)
    }
    """

  public let operationName: String = "AskQuestion"

  public var email: String
  public var question: String

  public init(email: String, question: String) {
    self.email = email
    self.question = question
  }

  public var variables: GraphQLMap? {
    return ["email": email, "question": question]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("askQuestion", arguments: ["email": GraphQLVariable("email"), "question": GraphQLVariable("question")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(askQuestion: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "askQuestion": askQuestion])
    }

    public var askQuestion: Bool? {
      get {
        return resultMap["askQuestion"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "askQuestion")
      }
    }
  }
}

public final class DoExerciseMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DoExercise($exerciseId: String!, $attemptId: String!) {
      doExercise(exerciseId: $exerciseId, attemptId: $attemptId)
    }
    """

  public let operationName: String = "DoExercise"

  public var exerciseId: String
  public var attemptId: String

  public init(exerciseId: String, attemptId: String) {
    self.exerciseId = exerciseId
    self.attemptId = attemptId
  }

  public var variables: GraphQLMap? {
    return ["exerciseId": exerciseId, "attemptId": attemptId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("doExercise", arguments: ["exerciseId": GraphQLVariable("exerciseId"), "attemptId": GraphQLVariable("attemptId")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(doExercise: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "doExercise": doExercise])
    }

    public var doExercise: Bool? {
      get {
        return resultMap["doExercise"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "doExercise")
      }
    }
  }
}

public final class DrinkWaterMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DrinkWater($cupsCount: Int!) {
      drinkWater(cupsCount: $cupsCount)
    }
    """

  public let operationName: String = "DrinkWater"

  public var cupsCount: Int

  public init(cupsCount: Int) {
    self.cupsCount = cupsCount
  }

  public var variables: GraphQLMap? {
    return ["cupsCount": cupsCount]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("drinkWater", arguments: ["cupsCount": GraphQLVariable("cupsCount")], type: .scalar(Double.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(drinkWater: Double? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "drinkWater": drinkWater])
    }

    public var drinkWater: Double? {
      get {
        return resultMap["drinkWater"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "drinkWater")
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($record: LoginRecordInput!) {
      login(record: $record) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "Login"

  public var record: LoginRecordInput

  public init(record: LoginRecordInput) {
    self.record = record
  }

  public var variables: GraphQLMap? {
    return ["record": record]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["record": GraphQLVariable("record")], type: .object(Login.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Token"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Token", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class OrderCreateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation OrderCreate($order: OrderCreateInputRecord!, $paymentSystem: PaymentSystemName!) {
      orderCreate(order: $order, paymentSystem: $paymentSystem)
    }
    """

  public let operationName: String = "OrderCreate"

  public var order: OrderCreateInputRecord
  public var paymentSystem: PaymentSystemName

  public init(order: OrderCreateInputRecord, paymentSystem: PaymentSystemName) {
    self.order = order
    self.paymentSystem = paymentSystem
  }

  public var variables: GraphQLMap? {
    return ["order": order, "paymentSystem": paymentSystem]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("orderCreate", arguments: ["order": GraphQLVariable("order"), "paymentSystem": GraphQLVariable("paymentSystem")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(orderCreate: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "orderCreate": orderCreate])
    }

    public var orderCreate: Bool? {
      get {
        return resultMap["orderCreate"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "orderCreate")
      }
    }
  }
}

public final class OrderProductMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation OrderProduct($order: OrderProductInputRecord!, $paymentSystem: PaymentSystemName!) {
      orderProduct(order: $order, paymentSystem: $paymentSystem)
    }
    """

  public let operationName: String = "OrderProduct"

  public var order: OrderProductInputRecord
  public var paymentSystem: PaymentSystemName

  public init(order: OrderProductInputRecord, paymentSystem: PaymentSystemName) {
    self.order = order
    self.paymentSystem = paymentSystem
  }

  public var variables: GraphQLMap? {
    return ["order": order, "paymentSystem": paymentSystem]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("orderProduct", arguments: ["order": GraphQLVariable("order"), "paymentSystem": GraphQLVariable("paymentSystem")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(orderProduct: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "orderProduct": orderProduct])
    }

    public var orderProduct: Bool? {
      get {
        return resultMap["orderProduct"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "orderProduct")
      }
    }
  }
}

public final class PasswordForgotRequestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation PasswordForgotRequest($email: String!) {
      passwordForgotRequest(email: $email) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "PasswordForgotRequest"

  public var email: String

  public init(email: String) {
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("passwordForgotRequest", arguments: ["email": GraphQLVariable("email")], type: .object(PasswordForgotRequest.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(passwordForgotRequest: PasswordForgotRequest? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "passwordForgotRequest": passwordForgotRequest.flatMap { (value: PasswordForgotRequest) -> ResultMap in value.resultMap }])
    }

    public var passwordForgotRequest: PasswordForgotRequest? {
      get {
        return (resultMap["passwordForgotRequest"] as? ResultMap).flatMap { PasswordForgotRequest(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "passwordForgotRequest")
      }
    }

    public struct PasswordForgotRequest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Token"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Token", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class ProfileDeleteMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ProfileDelete {
      profileDelete
    }
    """

  public let operationName: String = "ProfileDelete"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("profileDelete", type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profileDelete: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "profileDelete": profileDelete])
    }

    public var profileDelete: Bool? {
      get {
        return resultMap["profileDelete"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "profileDelete")
      }
    }
  }
}

public final class ProfileUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ProfileUpdate($record: ProfileUpdateInput!) {
      profileUpdate(record: $record) {
        __typename
        age
        coins
        darkTheme
        doSport
        email
        weightMeasure
        energy
        fitnessPreference
        gender
        goal
        growth
        id
        name
        notifications
        reminders
        showOnBoarding
        weight
        targetWeight
        FoodGroup {
          __typename
          Image {
            __typename
            id
            urlIosFull
            urlIosPrev
          }
          id
          name
        }
        Avatar {
          __typename
          id
          url
        }
        Subscription {
          __typename
          id
          Plan {
            __typename
            externalId
          }
          expiresAt
        }
      }
    }
    """

  public let operationName: String = "ProfileUpdate"

  public var record: ProfileUpdateInput

  public init(record: ProfileUpdateInput) {
    self.record = record
  }

  public var variables: GraphQLMap? {
    return ["record": record]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("profileUpdate", arguments: ["record": GraphQLVariable("record")], type: .object(ProfileUpdate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profileUpdate: ProfileUpdate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "profileUpdate": profileUpdate.flatMap { (value: ProfileUpdate) -> ResultMap in value.resultMap }])
    }

    public var profileUpdate: ProfileUpdate? {
      get {
        return (resultMap["profileUpdate"] as? ResultMap).flatMap { ProfileUpdate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "profileUpdate")
      }
    }

    public struct ProfileUpdate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MeModel"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("age", type: .scalar(Int.self)),
          GraphQLField("coins", type: .scalar(Int.self)),
          GraphQLField("darkTheme", type: .scalar(Bool.self)),
          GraphQLField("doSport", type: .scalar(DoSportType.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("weightMeasure", type: .scalar(WeightMeasure.self)),
          GraphQLField("energy", type: .scalar(Double.self)),
          GraphQLField("fitnessPreference", type: .scalar(WorkoutDifficulty.self)),
          GraphQLField("gender", type: .scalar(GenderType.self)),
          GraphQLField("goal", type: .scalar(GoalType.self)),
          GraphQLField("growth", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("notifications", type: .scalar(Bool.self)),
          GraphQLField("reminders", type: .scalar(Bool.self)),
          GraphQLField("showOnBoarding", type: .scalar(Bool.self)),
          GraphQLField("weight", type: .scalar(Double.self)),
          GraphQLField("targetWeight", type: .scalar(Double.self)),
          GraphQLField("FoodGroup", type: .object(FoodGroup.selections)),
          GraphQLField("Avatar", type: .object(Avatar.selections)),
          GraphQLField("Subscription", type: .object(Subscription.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(age: Int? = nil, coins: Int? = nil, darkTheme: Bool? = nil, doSport: DoSportType? = nil, email: String? = nil, weightMeasure: WeightMeasure? = nil, energy: Double? = nil, fitnessPreference: WorkoutDifficulty? = nil, gender: GenderType? = nil, goal: GoalType? = nil, growth: Int? = nil, id: GraphQLID? = nil, name: String? = nil, notifications: Bool? = nil, reminders: Bool? = nil, showOnBoarding: Bool? = nil, weight: Double? = nil, targetWeight: Double? = nil, foodGroup: FoodGroup? = nil, avatar: Avatar? = nil, subscription: Subscription? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "age": age, "coins": coins, "darkTheme": darkTheme, "doSport": doSport, "email": email, "weightMeasure": weightMeasure, "energy": energy, "fitnessPreference": fitnessPreference, "gender": gender, "goal": goal, "growth": growth, "id": id, "name": name, "notifications": notifications, "reminders": reminders, "showOnBoarding": showOnBoarding, "weight": weight, "targetWeight": targetWeight, "FoodGroup": foodGroup.flatMap { (value: FoodGroup) -> ResultMap in value.resultMap }, "Avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "Subscription": subscription.flatMap { (value: Subscription) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var age: Int? {
        get {
          return resultMap["age"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "age")
        }
      }

      public var coins: Int? {
        get {
          return resultMap["coins"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "coins")
        }
      }

      public var darkTheme: Bool? {
        get {
          return resultMap["darkTheme"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "darkTheme")
        }
      }

      public var doSport: DoSportType? {
        get {
          return resultMap["doSport"] as? DoSportType
        }
        set {
          resultMap.updateValue(newValue, forKey: "doSport")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var weightMeasure: WeightMeasure? {
        get {
          return resultMap["weightMeasure"] as? WeightMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "weightMeasure")
        }
      }

      public var energy: Double? {
        get {
          return resultMap["energy"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var fitnessPreference: WorkoutDifficulty? {
        get {
          return resultMap["fitnessPreference"] as? WorkoutDifficulty
        }
        set {
          resultMap.updateValue(newValue, forKey: "fitnessPreference")
        }
      }

      public var gender: GenderType? {
        get {
          return resultMap["gender"] as? GenderType
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var goal: GoalType? {
        get {
          return resultMap["goal"] as? GoalType
        }
        set {
          resultMap.updateValue(newValue, forKey: "goal")
        }
      }

      public var growth: Int? {
        get {
          return resultMap["growth"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "growth")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var notifications: Bool? {
        get {
          return resultMap["notifications"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "notifications")
        }
      }

      public var reminders: Bool? {
        get {
          return resultMap["reminders"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "reminders")
        }
      }

      public var showOnBoarding: Bool? {
        get {
          return resultMap["showOnBoarding"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "showOnBoarding")
        }
      }

      public var weight: Double? {
        get {
          return resultMap["weight"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }

      public var targetWeight: Double? {
        get {
          return resultMap["targetWeight"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "targetWeight")
        }
      }

      public var foodGroup: FoodGroup? {
        get {
          return (resultMap["FoodGroup"] as? ResultMap).flatMap { FoodGroup(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "FoodGroup")
        }
      }

      public var avatar: Avatar? {
        get {
          return (resultMap["Avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Avatar")
        }
      }

      public var subscription: Subscription? {
        get {
          return (resultMap["Subscription"] as? ResultMap).flatMap { Subscription(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Subscription")
        }
      }

      public struct FoodGroup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FoodGroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Image", type: .object(Image.selections)),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: Image? = nil, id: Int? = nil, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FoodGroup", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var image: Image? {
          get {
            return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "Image")
          }
        }

        public var id: Int? {
          get {
            return resultMap["id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Image"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("urlIosFull", type: .scalar(String.self)),
              GraphQLField("urlIosPrev", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var urlIosFull: String? {
            get {
              return resultMap["urlIosFull"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "urlIosFull")
            }
          }

          public var urlIosPrev: String? {
            get {
              return resultMap["urlIosPrev"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "urlIosPrev")
            }
          }
        }
      }

      public struct Avatar: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Avatar"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("url", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, url: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Avatar", "id": id, "url": url])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var url: String? {
          get {
            return resultMap["url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Subscription"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("Plan", type: .object(Plan.selections)),
            GraphQLField("expiresAt", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, plan: Plan? = nil, expiresAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Subscription", "id": id, "Plan": plan.flatMap { (value: Plan) -> ResultMap in value.resultMap }, "expiresAt": expiresAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var plan: Plan? {
          get {
            return (resultMap["Plan"] as? ResultMap).flatMap { Plan(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "Plan")
          }
        }

        public var expiresAt: String? {
          get {
            return resultMap["expiresAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "expiresAt")
          }
        }

        public struct Plan: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Plan"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("externalId", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(externalId: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Plan", "externalId": externalId])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var externalId: String? {
            get {
              return resultMap["externalId"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "externalId")
            }
          }
        }
      }
    }
  }
}

public final class RemoveProductFromMealMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RemoveProductFromMeal($productId: String!, $mealId: String!) {
      removeProductFromMeal(productId: $productId, mealId: $mealId)
    }
    """

  public let operationName: String = "RemoveProductFromMeal"

  public var productId: String
  public var mealId: String

  public init(productId: String, mealId: String) {
    self.productId = productId
    self.mealId = mealId
  }

  public var variables: GraphQLMap? {
    return ["productId": productId, "mealId": mealId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeProductFromMeal", arguments: ["productId": GraphQLVariable("productId"), "mealId": GraphQLVariable("mealId")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeProductFromMeal: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeProductFromMeal": removeProductFromMeal])
    }

    public var removeProductFromMeal: Bool? {
      get {
        return resultMap["removeProductFromMeal"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "removeProductFromMeal")
      }
    }
  }
}

public final class SaveMoodMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SaveMood($mood: MoodType!) {
      saveMood(mood: $mood)
    }
    """

  public let operationName: String = "SaveMood"

  public var mood: MoodType

  public init(mood: MoodType) {
    self.mood = mood
  }

  public var variables: GraphQLMap? {
    return ["mood": mood]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("saveMood", arguments: ["mood": GraphQLVariable("mood")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveMood: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "saveMood": saveMood])
    }

    public var saveMood: Bool? {
      get {
        return resultMap["saveMood"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "saveMood")
      }
    }
  }
}

public final class SaveSleepQualityMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SaveSleepQuality($quality: SleepQualityType!) {
      saveSleepQuality(quality: $quality)
    }
    """

  public let operationName: String = "SaveSleepQuality"

  public var quality: SleepQualityType

  public init(quality: SleepQualityType) {
    self.quality = quality
  }

  public var variables: GraphQLMap? {
    return ["quality": quality]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("saveSleepQuality", arguments: ["quality": GraphQLVariable("quality")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveSleepQuality: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "saveSleepQuality": saveSleepQuality])
    }

    public var saveSleepQuality: Bool? {
      get {
        return resultMap["saveSleepQuality"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "saveSleepQuality")
      }
    }
  }
}

public final class StartWorkoutMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation StartWorkout($workoutId: String!) {
      startWorkout(workoutId: $workoutId)
    }
    """

  public let operationName: String = "StartWorkout"

  public var workoutId: String

  public init(workoutId: String) {
    self.workoutId = workoutId
  }

  public var variables: GraphQLMap? {
    return ["workoutId": workoutId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("startWorkout", arguments: ["workoutId": GraphQLVariable("workoutId")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(startWorkout: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "startWorkout": startWorkout])
    }

    public var startWorkout: String? {
      get {
        return resultMap["startWorkout"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "startWorkout")
      }
    }
  }
}

public final class UpdateProductInMealMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateProductInMeal($record: UpdateProductInMealRecordInput!) {
      updateProductInMeal(record: $record)
    }
    """

  public let operationName: String = "UpdateProductInMeal"

  public var record: UpdateProductInMealRecordInput

  public init(record: UpdateProductInMealRecordInput) {
    self.record = record
  }

  public var variables: GraphQLMap? {
    return ["record": record]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateProductInMeal", arguments: ["record": GraphQLVariable("record")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateProductInMeal: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateProductInMeal": updateProductInMeal])
    }

    public var updateProductInMeal: Bool? {
      get {
        return resultMap["updateProductInMeal"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "updateProductInMeal")
      }
    }
  }
}

public final class UpgradeBuildingMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpgradeBuilding($buildingId: String!) {
      upgradeBuilding(buildingId: $buildingId)
    }
    """

  public let operationName: String = "UpgradeBuilding"

  public var buildingId: String

  public init(buildingId: String) {
    self.buildingId = buildingId
  }

  public var variables: GraphQLMap? {
    return ["buildingId": buildingId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("upgradeBuilding", arguments: ["buildingId": GraphQLVariable("buildingId")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(upgradeBuilding: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "upgradeBuilding": upgradeBuilding])
    }

    public var upgradeBuilding: Bool? {
      get {
        return resultMap["upgradeBuilding"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "upgradeBuilding")
      }
    }
  }
}

public final class WorkoutAttemptUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation WorkoutAttemptUpdate($attemptId: String!, $record: WorkoutAttemptUpdateInput!) {
      workoutAttemptUpdate(attemptId: $attemptId, record: $record)
    }
    """

  public let operationName: String = "WorkoutAttemptUpdate"

  public var attemptId: String
  public var record: WorkoutAttemptUpdateInput

  public init(attemptId: String, record: WorkoutAttemptUpdateInput) {
    self.attemptId = attemptId
    self.record = record
  }

  public var variables: GraphQLMap? {
    return ["attemptId": attemptId, "record": record]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutAttemptUpdate", arguments: ["attemptId": GraphQLVariable("attemptId"), "record": GraphQLVariable("record")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutAttemptUpdate: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "workoutAttemptUpdate": workoutAttemptUpdate])
    }

    public var workoutAttemptUpdate: Bool? {
      get {
        return resultMap["workoutAttemptUpdate"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "workoutAttemptUpdate")
      }
    }
  }
}

public final class AvailableGoalsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AvailableGoals {
      availableGoals
    }
    """

  public let operationName: String = "AvailableGoals"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("availableGoals", type: .list(.scalar(GoalType.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(availableGoals: [GoalType?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "availableGoals": availableGoals])
    }

    public var availableGoals: [GoalType?]? {
      get {
        return resultMap["availableGoals"] as? [GoalType?]
      }
      set {
        resultMap.updateValue(newValue, forKey: "availableGoals")
      }
    }
  }
}

public final class CaloriesWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CaloriesWidget($from: Date, $to: Date) {
      caloriesWidget(from: $from, to: $to) {
        __typename
        Calories {
          __typename
          amount
          createdAt
        }
        target
      }
    }
    """

  public let operationName: String = "CaloriesWidget"

  public var from: String?
  public var to: String?

  public init(from: String? = nil, to: String? = nil) {
    self.from = from
    self.to = to
  }

  public var variables: GraphQLMap? {
    return ["from": from, "to": to]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("caloriesWidget", arguments: ["from": GraphQLVariable("from"), "to": GraphQLVariable("to")], type: .object(CaloriesWidget.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(caloriesWidget: CaloriesWidget? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "caloriesWidget": caloriesWidget.flatMap { (value: CaloriesWidget) -> ResultMap in value.resultMap }])
    }

    public var caloriesWidget: CaloriesWidget? {
      get {
        return (resultMap["caloriesWidget"] as? ResultMap).flatMap { CaloriesWidget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "caloriesWidget")
      }
    }

    public struct CaloriesWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CaloriesWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Calories", type: .list(.object(Calory.selections))),
          GraphQLField("target", type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(calories: [Calory?]? = nil, target: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "CaloriesWidget", "Calories": calories.flatMap { (value: [Calory?]) -> [ResultMap?] in value.map { (value: Calory?) -> ResultMap? in value.flatMap { (value: Calory) -> ResultMap in value.resultMap } } }, "target": target])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var calories: [Calory?]? {
        get {
          return (resultMap["Calories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Calory?] in value.map { (value: ResultMap?) -> Calory? in value.flatMap { (value: ResultMap) -> Calory in Calory(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Calory?]) -> [ResultMap?] in value.map { (value: Calory?) -> ResultMap? in value.flatMap { (value: Calory) -> ResultMap in value.resultMap } } }, forKey: "Calories")
        }
      }

      public var target: Double? {
        get {
          return resultMap["target"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "target")
        }
      }

      public struct Calory: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Calories"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .scalar(Double.self)),
            GraphQLField("createdAt", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amount: Double? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Calories", "amount": amount, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var amount: Double? {
          get {
            return resultMap["amount"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class ChooseWorkoutWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ChooseWorkoutWidget($date: Date) {
      chooseWorkoutWidget(date: $date) {
        __typename
        Image {
          __typename
          id
          urlIosFull
          urlIosPrev
        }
        duration {
          __typename
          hours
          minutes
          seconds
        }
        energy
        energyTotal
        id
        isAvailable
        isFinished
        title
        totalExercises
        totalFinishedExercises
      }
    }
    """

  public let operationName: String = "ChooseWorkoutWidget"

  public var date: String?

  public init(date: String? = nil) {
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("chooseWorkoutWidget", arguments: ["date": GraphQLVariable("date")], type: .list(.object(ChooseWorkoutWidget.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(chooseWorkoutWidget: [ChooseWorkoutWidget?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "chooseWorkoutWidget": chooseWorkoutWidget.flatMap { (value: [ChooseWorkoutWidget?]) -> [ResultMap?] in value.map { (value: ChooseWorkoutWidget?) -> ResultMap? in value.flatMap { (value: ChooseWorkoutWidget) -> ResultMap in value.resultMap } } }])
    }

    public var chooseWorkoutWidget: [ChooseWorkoutWidget?]? {
      get {
        return (resultMap["chooseWorkoutWidget"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ChooseWorkoutWidget?] in value.map { (value: ResultMap?) -> ChooseWorkoutWidget? in value.flatMap { (value: ResultMap) -> ChooseWorkoutWidget in ChooseWorkoutWidget(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [ChooseWorkoutWidget?]) -> [ResultMap?] in value.map { (value: ChooseWorkoutWidget?) -> ResultMap? in value.flatMap { (value: ChooseWorkoutWidget) -> ResultMap in value.resultMap } } }, forKey: "chooseWorkoutWidget")
      }
    }

    public struct ChooseWorkoutWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutShort"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("duration", type: .object(Duration.selections)),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("isAvailable", type: .scalar(Bool.self)),
          GraphQLField("isFinished", type: .scalar(Bool.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("totalExercises", type: .scalar(Int.self)),
          GraphQLField("totalFinishedExercises", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, duration: Duration? = nil, energy: Int? = nil, energyTotal: Int? = nil, id: GraphQLID? = nil, isAvailable: Bool? = nil, isFinished: Bool? = nil, title: String? = nil, totalExercises: Int? = nil, totalFinishedExercises: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "WorkoutShort", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "duration": duration.flatMap { (value: Duration) -> ResultMap in value.resultMap }, "energy": energy, "energyTotal": energyTotal, "id": id, "isAvailable": isAvailable, "isFinished": isFinished, "title": title, "totalExercises": totalExercises, "totalFinishedExercises": totalFinishedExercises])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var duration: Duration? {
        get {
          return (resultMap["duration"] as? ResultMap).flatMap { Duration(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "duration")
        }
      }

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isAvailable: Bool? {
        get {
          return resultMap["isAvailable"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAvailable")
        }
      }

      public var isFinished: Bool? {
        get {
          return resultMap["isFinished"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var totalExercises: Int? {
        get {
          return resultMap["totalExercises"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalExercises")
        }
      }

      public var totalFinishedExercises: Int? {
        get {
          return resultMap["totalFinishedExercises"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalFinishedExercises")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
            GraphQLField("urlIosPrev", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }

        public var urlIosPrev: String? {
          get {
            return resultMap["urlIosPrev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosPrev")
          }
        }
      }

      public struct Duration: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["IntervalRepresentation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hours", type: .scalar(Int.self)),
            GraphQLField("minutes", type: .scalar(Int.self)),
            GraphQLField("seconds", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hours: Int? = nil, minutes: Int? = nil, seconds: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "IntervalRepresentation", "hours": hours, "minutes": minutes, "seconds": seconds])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hours: Int? {
          get {
            return resultMap["hours"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "hours")
          }
        }

        public var minutes: Int? {
          get {
            return resultMap["minutes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "minutes")
          }
        }

        public var seconds: Int? {
          get {
            return resultMap["seconds"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "seconds")
          }
        }
      }
    }
  }
}

public final class DrinkWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query DrinkWidget($date: Date!) {
      drinkWidget(date: $date) {
        __typename
        doneCups
        energy
        energyTotal
        left
        totalCups
      }
    }
    """

  public let operationName: String = "DrinkWidget"

  public var date: String

  public init(date: String) {
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("drinkWidget", arguments: ["date": GraphQLVariable("date")], type: .object(DrinkWidget.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(drinkWidget: DrinkWidget? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "drinkWidget": drinkWidget.flatMap { (value: DrinkWidget) -> ResultMap in value.resultMap }])
    }

    public var drinkWidget: DrinkWidget? {
      get {
        return (resultMap["drinkWidget"] as? ResultMap).flatMap { DrinkWidget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "drinkWidget")
      }
    }

    public struct DrinkWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DrinkWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("doneCups", type: .scalar(Int.self)),
          GraphQLField("energy", type: .scalar(Double.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("left", type: .scalar(Int.self)),
          GraphQLField("totalCups", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(doneCups: Int? = nil, energy: Double? = nil, energyTotal: Int? = nil, `left`: Int? = nil, totalCups: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "DrinkWidget", "doneCups": doneCups, "energy": energy, "energyTotal": energyTotal, "left": `left`, "totalCups": totalCups])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var doneCups: Int? {
        get {
          return resultMap["doneCups"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "doneCups")
        }
      }

      public var energy: Double? {
        get {
          return resultMap["energy"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var `left`: Int? {
        get {
          return resultMap["left"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "left")
        }
      }

      public var totalCups: Int? {
        get {
          return resultMap["totalCups"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCups")
        }
      }
    }
  }
}

public final class FoodGroupsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FoodGroups {
      foodGroups {
        __typename
        Image {
          __typename
          id
          urlIosFull
          urlIosPrev
        }
        id
        name
      }
    }
    """

  public let operationName: String = "FoodGroups"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("foodGroups", type: .list(.object(FoodGroup.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(foodGroups: [FoodGroup?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "foodGroups": foodGroups.flatMap { (value: [FoodGroup?]) -> [ResultMap?] in value.map { (value: FoodGroup?) -> ResultMap? in value.flatMap { (value: FoodGroup) -> ResultMap in value.resultMap } } }])
    }

    public var foodGroups: [FoodGroup?]? {
      get {
        return (resultMap["foodGroups"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FoodGroup?] in value.map { (value: ResultMap?) -> FoodGroup? in value.flatMap { (value: ResultMap) -> FoodGroup in FoodGroup(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FoodGroup?]) -> [ResultMap?] in value.map { (value: FoodGroup?) -> ResultMap? in value.flatMap { (value: FoodGroup) -> ResultMap in value.resultMap } } }, forKey: "foodGroups")
      }
    }

    public struct FoodGroup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FoodGroup"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("id", type: .scalar(Int.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, id: Int? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "FoodGroup", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var id: Int? {
        get {
          return resultMap["id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
            GraphQLField("urlIosPrev", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }

        public var urlIosPrev: String? {
          get {
            return resultMap["urlIosPrev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosPrev")
          }
        }
      }
    }
  }
}

public final class MapQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Map($mapId: String) {
      map(mapId: $mapId) {
        __typename
        id
        name
        Buildings {
          __typename
          id
          name
          maxLevel
          level
        }
        Spins {
          __typename
          id
          spinObjectIds
        }
        SpinObjects {
          __typename
          id
          type
          Image {
            __typename
            urlIosFull
          }
        }
        freeBuildingsCount
      }
    }
    """

  public let operationName: String = "Map"

  public var mapId: String?

  public init(mapId: String? = nil) {
    self.mapId = mapId
  }

  public var variables: GraphQLMap? {
    return ["mapId": mapId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("map", arguments: ["mapId": GraphQLVariable("mapId")], type: .object(Map.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(map: Map? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "map": map.flatMap { (value: Map) -> ResultMap in value.resultMap }])
    }

    public var map: Map? {
      get {
        return (resultMap["map"] as? ResultMap).flatMap { Map(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "map")
      }
    }

    public struct Map: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Map"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("Buildings", type: .list(.object(Building.selections))),
          GraphQLField("Spins", type: .list(.object(Spin.selections))),
          GraphQLField("SpinObjects", type: .list(.object(SpinObject.selections))),
          GraphQLField("freeBuildingsCount", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, buildings: [Building?]? = nil, spins: [Spin?]? = nil, spinObjects: [SpinObject?]? = nil, freeBuildingsCount: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Map", "id": id, "name": name, "Buildings": buildings.flatMap { (value: [Building?]) -> [ResultMap?] in value.map { (value: Building?) -> ResultMap? in value.flatMap { (value: Building) -> ResultMap in value.resultMap } } }, "Spins": spins.flatMap { (value: [Spin?]) -> [ResultMap?] in value.map { (value: Spin?) -> ResultMap? in value.flatMap { (value: Spin) -> ResultMap in value.resultMap } } }, "SpinObjects": spinObjects.flatMap { (value: [SpinObject?]) -> [ResultMap?] in value.map { (value: SpinObject?) -> ResultMap? in value.flatMap { (value: SpinObject) -> ResultMap in value.resultMap } } }, "freeBuildingsCount": freeBuildingsCount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var buildings: [Building?]? {
        get {
          return (resultMap["Buildings"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Building?] in value.map { (value: ResultMap?) -> Building? in value.flatMap { (value: ResultMap) -> Building in Building(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Building?]) -> [ResultMap?] in value.map { (value: Building?) -> ResultMap? in value.flatMap { (value: Building) -> ResultMap in value.resultMap } } }, forKey: "Buildings")
        }
      }

      public var spins: [Spin?]? {
        get {
          return (resultMap["Spins"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Spin?] in value.map { (value: ResultMap?) -> Spin? in value.flatMap { (value: ResultMap) -> Spin in Spin(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Spin?]) -> [ResultMap?] in value.map { (value: Spin?) -> ResultMap? in value.flatMap { (value: Spin) -> ResultMap in value.resultMap } } }, forKey: "Spins")
        }
      }

      public var spinObjects: [SpinObject?]? {
        get {
          return (resultMap["SpinObjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SpinObject?] in value.map { (value: ResultMap?) -> SpinObject? in value.flatMap { (value: ResultMap) -> SpinObject in SpinObject(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SpinObject?]) -> [ResultMap?] in value.map { (value: SpinObject?) -> ResultMap? in value.flatMap { (value: SpinObject) -> ResultMap in value.resultMap } } }, forKey: "SpinObjects")
        }
      }

      public var freeBuildingsCount: Int? {
        get {
          return resultMap["freeBuildingsCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "freeBuildingsCount")
        }
      }

      public struct Building: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Building"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("maxLevel", type: .scalar(Int.self)),
            GraphQLField("level", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, maxLevel: Int? = nil, level: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Building", "id": id, "name": name, "maxLevel": maxLevel, "level": level])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var maxLevel: Int? {
          get {
            return resultMap["maxLevel"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "maxLevel")
          }
        }

        public var level: Int? {
          get {
            return resultMap["level"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "level")
          }
        }
      }

      public struct Spin: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Spin"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("spinObjectIds", type: .list(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, spinObjectIds: [Int?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Spin", "id": id, "spinObjectIds": spinObjectIds])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var spinObjectIds: [Int?]? {
          get {
            return resultMap["spinObjectIds"] as? [Int?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "spinObjectIds")
          }
        }
      }

      public struct SpinObject: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SpinObject"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("type", type: .scalar(SpinObjectType.self)),
            GraphQLField("Image", type: .object(Image.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, type: SpinObjectType? = nil, image: Image? = nil) {
          self.init(unsafeResultMap: ["__typename": "SpinObject", "id": id, "type": type, "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var type: SpinObjectType? {
          get {
            return resultMap["type"] as? SpinObjectType
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var image: Image? {
          get {
            return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "Image")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Image"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("urlIosFull", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(urlIosFull: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Image", "urlIosFull": urlIosFull])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var urlIosFull: String? {
            get {
              return resultMap["urlIosFull"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "urlIosFull")
            }
          }
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Me {
      me {
        __typename
        age
        coins
        darkTheme
        doSport
        email
        weightMeasure
        energy
        fitnessPreference
        gender
        goal
        growth
        id
        name
        notifications
        reminders
        showOnBoarding
        weight
        targetWeight
        FoodGroup {
          __typename
          Image {
            __typename
            id
            urlIosFull
            urlIosPrev
          }
          id
          name
        }
        Avatar {
          __typename
          id
          url
        }
        Subscription {
          __typename
          id
          Plan {
            __typename
            externalId
          }
          expiresAt
        }
      }
    }
    """

  public let operationName: String = "Me"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .object(Me.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MeModel"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("age", type: .scalar(Int.self)),
          GraphQLField("coins", type: .scalar(Int.self)),
          GraphQLField("darkTheme", type: .scalar(Bool.self)),
          GraphQLField("doSport", type: .scalar(DoSportType.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("weightMeasure", type: .scalar(WeightMeasure.self)),
          GraphQLField("energy", type: .scalar(Double.self)),
          GraphQLField("fitnessPreference", type: .scalar(WorkoutDifficulty.self)),
          GraphQLField("gender", type: .scalar(GenderType.self)),
          GraphQLField("goal", type: .scalar(GoalType.self)),
          GraphQLField("growth", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("notifications", type: .scalar(Bool.self)),
          GraphQLField("reminders", type: .scalar(Bool.self)),
          GraphQLField("showOnBoarding", type: .scalar(Bool.self)),
          GraphQLField("weight", type: .scalar(Double.self)),
          GraphQLField("targetWeight", type: .scalar(Double.self)),
          GraphQLField("FoodGroup", type: .object(FoodGroup.selections)),
          GraphQLField("Avatar", type: .object(Avatar.selections)),
          GraphQLField("Subscription", type: .object(Subscription.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(age: Int? = nil, coins: Int? = nil, darkTheme: Bool? = nil, doSport: DoSportType? = nil, email: String? = nil, weightMeasure: WeightMeasure? = nil, energy: Double? = nil, fitnessPreference: WorkoutDifficulty? = nil, gender: GenderType? = nil, goal: GoalType? = nil, growth: Int? = nil, id: GraphQLID? = nil, name: String? = nil, notifications: Bool? = nil, reminders: Bool? = nil, showOnBoarding: Bool? = nil, weight: Double? = nil, targetWeight: Double? = nil, foodGroup: FoodGroup? = nil, avatar: Avatar? = nil, subscription: Subscription? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "age": age, "coins": coins, "darkTheme": darkTheme, "doSport": doSport, "email": email, "weightMeasure": weightMeasure, "energy": energy, "fitnessPreference": fitnessPreference, "gender": gender, "goal": goal, "growth": growth, "id": id, "name": name, "notifications": notifications, "reminders": reminders, "showOnBoarding": showOnBoarding, "weight": weight, "targetWeight": targetWeight, "FoodGroup": foodGroup.flatMap { (value: FoodGroup) -> ResultMap in value.resultMap }, "Avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "Subscription": subscription.flatMap { (value: Subscription) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var age: Int? {
        get {
          return resultMap["age"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "age")
        }
      }

      public var coins: Int? {
        get {
          return resultMap["coins"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "coins")
        }
      }

      public var darkTheme: Bool? {
        get {
          return resultMap["darkTheme"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "darkTheme")
        }
      }

      public var doSport: DoSportType? {
        get {
          return resultMap["doSport"] as? DoSportType
        }
        set {
          resultMap.updateValue(newValue, forKey: "doSport")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var weightMeasure: WeightMeasure? {
        get {
          return resultMap["weightMeasure"] as? WeightMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "weightMeasure")
        }
      }

      public var energy: Double? {
        get {
          return resultMap["energy"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var fitnessPreference: WorkoutDifficulty? {
        get {
          return resultMap["fitnessPreference"] as? WorkoutDifficulty
        }
        set {
          resultMap.updateValue(newValue, forKey: "fitnessPreference")
        }
      }

      public var gender: GenderType? {
        get {
          return resultMap["gender"] as? GenderType
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var goal: GoalType? {
        get {
          return resultMap["goal"] as? GoalType
        }
        set {
          resultMap.updateValue(newValue, forKey: "goal")
        }
      }

      public var growth: Int? {
        get {
          return resultMap["growth"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "growth")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var notifications: Bool? {
        get {
          return resultMap["notifications"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "notifications")
        }
      }

      public var reminders: Bool? {
        get {
          return resultMap["reminders"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "reminders")
        }
      }

      public var showOnBoarding: Bool? {
        get {
          return resultMap["showOnBoarding"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "showOnBoarding")
        }
      }

      public var weight: Double? {
        get {
          return resultMap["weight"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }

      public var targetWeight: Double? {
        get {
          return resultMap["targetWeight"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "targetWeight")
        }
      }

      public var foodGroup: FoodGroup? {
        get {
          return (resultMap["FoodGroup"] as? ResultMap).flatMap { FoodGroup(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "FoodGroup")
        }
      }

      public var avatar: Avatar? {
        get {
          return (resultMap["Avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Avatar")
        }
      }

      public var subscription: Subscription? {
        get {
          return (resultMap["Subscription"] as? ResultMap).flatMap { Subscription(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Subscription")
        }
      }

      public struct FoodGroup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FoodGroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Image", type: .object(Image.selections)),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: Image? = nil, id: Int? = nil, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FoodGroup", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var image: Image? {
          get {
            return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "Image")
          }
        }

        public var id: Int? {
          get {
            return resultMap["id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Image"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("urlIosFull", type: .scalar(String.self)),
              GraphQLField("urlIosPrev", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var urlIosFull: String? {
            get {
              return resultMap["urlIosFull"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "urlIosFull")
            }
          }

          public var urlIosPrev: String? {
            get {
              return resultMap["urlIosPrev"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "urlIosPrev")
            }
          }
        }
      }

      public struct Avatar: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Avatar"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("url", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, url: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Avatar", "id": id, "url": url])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var url: String? {
          get {
            return resultMap["url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Subscription"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("Plan", type: .object(Plan.selections)),
            GraphQLField("expiresAt", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, plan: Plan? = nil, expiresAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Subscription", "id": id, "Plan": plan.flatMap { (value: Plan) -> ResultMap in value.resultMap }, "expiresAt": expiresAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var plan: Plan? {
          get {
            return (resultMap["Plan"] as? ResultMap).flatMap { Plan(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "Plan")
          }
        }

        public var expiresAt: String? {
          get {
            return resultMap["expiresAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "expiresAt")
          }
        }

        public struct Plan: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Plan"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("externalId", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(externalId: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Plan", "externalId": externalId])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var externalId: String? {
            get {
              return resultMap["externalId"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "externalId")
            }
          }
        }
      }
    }
  }
}

public final class MealsWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MealsWidget($date: Date!) {
      mealsWidget(date: $date) {
        __typename
        energy
        energyTotal
        Meals {
          __typename
          eatenAt
          id
          Products {
            __typename
            Image {
              __typename
              id
              urlIosFull
              urlIosPrev
            }
            amount
            id
            measure
            name
          }
          type
        }
        Sources {
          __typename
          donePercents
          left
          name
          needed
        }
      }
    }
    """

  public let operationName: String = "MealsWidget"

  public var date: String

  public init(date: String) {
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("mealsWidget", arguments: ["date": GraphQLVariable("date")], type: .object(MealsWidget.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mealsWidget: MealsWidget? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "mealsWidget": mealsWidget.flatMap { (value: MealsWidget) -> ResultMap in value.resultMap }])
    }

    public var mealsWidget: MealsWidget? {
      get {
        return (resultMap["mealsWidget"] as? ResultMap).flatMap { MealsWidget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "mealsWidget")
      }
    }

    public struct MealsWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MealsWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("energy", type: .scalar(Double.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("Meals", type: .list(.object(Meal.selections))),
          GraphQLField("Sources", type: .list(.object(Source.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(energy: Double? = nil, energyTotal: Int? = nil, meals: [Meal?]? = nil, sources: [Source?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MealsWidget", "energy": energy, "energyTotal": energyTotal, "Meals": meals.flatMap { (value: [Meal?]) -> [ResultMap?] in value.map { (value: Meal?) -> ResultMap? in value.flatMap { (value: Meal) -> ResultMap in value.resultMap } } }, "Sources": sources.flatMap { (value: [Source?]) -> [ResultMap?] in value.map { (value: Source?) -> ResultMap? in value.flatMap { (value: Source) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var energy: Double? {
        get {
          return resultMap["energy"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var meals: [Meal?]? {
        get {
          return (resultMap["Meals"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Meal?] in value.map { (value: ResultMap?) -> Meal? in value.flatMap { (value: ResultMap) -> Meal in Meal(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Meal?]) -> [ResultMap?] in value.map { (value: Meal?) -> ResultMap? in value.flatMap { (value: Meal) -> ResultMap in value.resultMap } } }, forKey: "Meals")
        }
      }

      public var sources: [Source?]? {
        get {
          return (resultMap["Sources"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Source?] in value.map { (value: ResultMap?) -> Source? in value.flatMap { (value: ResultMap) -> Source in Source(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Source?]) -> [ResultMap?] in value.map { (value: Source?) -> ResultMap? in value.flatMap { (value: Source) -> ResultMap in value.resultMap } } }, forKey: "Sources")
        }
      }

      public struct Meal: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Meal"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("eatenAt", type: .scalar(String.self)),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("Products", type: .list(.object(Product.selections))),
            GraphQLField("type", type: .scalar(MealType.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(eatenAt: String? = nil, id: GraphQLID? = nil, products: [Product?]? = nil, type: MealType? = nil) {
          self.init(unsafeResultMap: ["__typename": "Meal", "eatenAt": eatenAt, "id": id, "Products": products.flatMap { (value: [Product?]) -> [ResultMap?] in value.map { (value: Product?) -> ResultMap? in value.flatMap { (value: Product) -> ResultMap in value.resultMap } } }, "type": type])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var eatenAt: String? {
          get {
            return resultMap["eatenAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "eatenAt")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var products: [Product?]? {
          get {
            return (resultMap["Products"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Product?] in value.map { (value: ResultMap?) -> Product? in value.flatMap { (value: ResultMap) -> Product in Product(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Product?]) -> [ResultMap?] in value.map { (value: Product?) -> ResultMap? in value.flatMap { (value: Product) -> ResultMap in value.resultMap } } }, forKey: "Products")
          }
        }

        public var type: MealType? {
          get {
            return resultMap["type"] as? MealType
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public struct Product: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MealProduct"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("Image", type: .object(Image.selections)),
              GraphQLField("amount", type: .scalar(Int.self)),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("measure", type: .scalar(ProductMeasure.self)),
              GraphQLField("name", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(image: Image? = nil, amount: Int? = nil, id: GraphQLID? = nil, measure: ProductMeasure? = nil, name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MealProduct", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "amount": amount, "id": id, "measure": measure, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var image: Image? {
            get {
              return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "Image")
            }
          }

          public var amount: Int? {
            get {
              return resultMap["amount"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }

          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var measure: ProductMeasure? {
            get {
              return resultMap["measure"] as? ProductMeasure
            }
            set {
              resultMap.updateValue(newValue, forKey: "measure")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public struct Image: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Image"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(GraphQLID.self)),
                GraphQLField("urlIosFull", type: .scalar(String.self)),
                GraphQLField("urlIosPrev", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID? {
              get {
                return resultMap["id"] as? GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var urlIosFull: String? {
              get {
                return resultMap["urlIosFull"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "urlIosFull")
              }
            }

            public var urlIosPrev: String? {
              get {
                return resultMap["urlIosPrev"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "urlIosPrev")
              }
            }
          }
        }
      }

      public struct Source: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Source"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("donePercents", type: .scalar(Int.self)),
            GraphQLField("left", type: .scalar(Int.self)),
            GraphQLField("name", type: .scalar(SourceEntityType.self)),
            GraphQLField("needed", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(donePercents: Int? = nil, `left`: Int? = nil, name: SourceEntityType? = nil, needed: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Source", "donePercents": donePercents, "left": `left`, "name": name, "needed": needed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var donePercents: Int? {
          get {
            return resultMap["donePercents"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "donePercents")
          }
        }

        public var `left`: Int? {
          get {
            return resultMap["left"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "left")
          }
        }

        public var name: SourceEntityType? {
          get {
            return resultMap["name"] as? SourceEntityType
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var needed: Int? {
          get {
            return resultMap["needed"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "needed")
          }
        }
      }
    }
  }
}

public final class MoodsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Moods($from: Date!, $to: Date!) {
      moods(from: $from, to: $to) {
        __typename
        createdAt
        mood
      }
    }
    """

  public let operationName: String = "Moods"

  public var from: String
  public var to: String

  public init(from: String, to: String) {
    self.from = from
    self.to = to
  }

  public var variables: GraphQLMap? {
    return ["from": from, "to": to]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("moods", arguments: ["from": GraphQLVariable("from"), "to": GraphQLVariable("to")], type: .list(.object(Mood.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(moods: [Mood?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "moods": moods.flatMap { (value: [Mood?]) -> [ResultMap?] in value.map { (value: Mood?) -> ResultMap? in value.flatMap { (value: Mood) -> ResultMap in value.resultMap } } }])
    }

    public var moods: [Mood?]? {
      get {
        return (resultMap["moods"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Mood?] in value.map { (value: ResultMap?) -> Mood? in value.flatMap { (value: ResultMap) -> Mood in Mood(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Mood?]) -> [ResultMap?] in value.map { (value: Mood?) -> ResultMap? in value.flatMap { (value: Mood) -> ResultMap in value.resultMap } } }, forKey: "moods")
      }
    }

    public struct Mood: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mood"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("mood", type: .scalar(MoodType.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createdAt: String? = nil, mood: MoodType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mood", "createdAt": createdAt, "mood": mood])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var mood: MoodType? {
        get {
          return resultMap["mood"] as? MoodType
        }
        set {
          resultMap.updateValue(newValue, forKey: "mood")
        }
      }
    }
  }
}

public final class MoodWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MoodWidget($date: Date!) {
      moodWidget(date: $date) {
        __typename
        energy
        energyTotal
        mood
      }
    }
    """

  public let operationName: String = "MoodWidget"

  public var date: String

  public init(date: String) {
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("moodWidget", arguments: ["date": GraphQLVariable("date")], type: .object(MoodWidget.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(moodWidget: MoodWidget? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "moodWidget": moodWidget.flatMap { (value: MoodWidget) -> ResultMap in value.resultMap }])
    }

    public var moodWidget: MoodWidget? {
      get {
        return (resultMap["moodWidget"] as? ResultMap).flatMap { MoodWidget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "moodWidget")
      }
    }

    public struct MoodWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MoodWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("mood", type: .scalar(MoodType.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(energy: Int? = nil, energyTotal: Int? = nil, mood: MoodType? = nil) {
        self.init(unsafeResultMap: ["__typename": "MoodWidget", "energy": energy, "energyTotal": energyTotal, "mood": mood])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var mood: MoodType? {
        get {
          return resultMap["mood"] as? MoodType
        }
        set {
          resultMap.updateValue(newValue, forKey: "mood")
        }
      }
    }
  }
}

public final class MusclesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Muscles($onlyToggled: Boolean) {
      muscles(onlyToggled: $onlyToggled) {
        __typename
        id
        isToggled
        name
      }
    }
    """

  public let operationName: String = "Muscles"

  public var onlyToggled: Bool?

  public init(onlyToggled: Bool? = nil) {
    self.onlyToggled = onlyToggled
  }

  public var variables: GraphQLMap? {
    return ["onlyToggled": onlyToggled]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("muscles", arguments: ["onlyToggled": GraphQLVariable("onlyToggled")], type: .list(.object(Muscle.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(muscles: [Muscle?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "muscles": muscles.flatMap { (value: [Muscle?]) -> [ResultMap?] in value.map { (value: Muscle?) -> ResultMap? in value.flatMap { (value: Muscle) -> ResultMap in value.resultMap } } }])
    }

    public var muscles: [Muscle?]? {
      get {
        return (resultMap["muscles"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Muscle?] in value.map { (value: ResultMap?) -> Muscle? in value.flatMap { (value: ResultMap) -> Muscle in Muscle(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Muscle?]) -> [ResultMap?] in value.map { (value: Muscle?) -> ResultMap? in value.flatMap { (value: Muscle) -> ResultMap in value.resultMap } } }, forKey: "muscles")
      }
    }

    public struct Muscle: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Muscle"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(Int.self)),
          GraphQLField("isToggled", type: .scalar(Bool.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int? = nil, isToggled: Bool? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Muscle", "id": id, "isToggled": isToggled, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int? {
        get {
          return resultMap["id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool? {
        get {
          return resultMap["isToggled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class ProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Products($search: String, $foodGroupId: Int, $sourceIds: [Int], $onlyToggled: Boolean) {
      products(
        search: $search
        foodGroupId: $foodGroupId
        sourceIds: $sourceIds
        onlyToggled: $onlyToggled
      ) {
        __typename
        Image {
          __typename
          id
          urlIosFull
          urlIosPrev
        }
        ProductSources {
          __typename
          amount
          name
        }
        amount
        id
        isToggled
        measure
        name
      }
    }
    """

  public let operationName: String = "Products"

  public var search: String?
  public var foodGroupId: Int?
  public var sourceIds: [Int?]?
  public var onlyToggled: Bool?

  public init(search: String? = nil, foodGroupId: Int? = nil, sourceIds: [Int?]? = nil, onlyToggled: Bool? = nil) {
    self.search = search
    self.foodGroupId = foodGroupId
    self.sourceIds = sourceIds
    self.onlyToggled = onlyToggled
  }

  public var variables: GraphQLMap? {
    return ["search": search, "foodGroupId": foodGroupId, "sourceIds": sourceIds, "onlyToggled": onlyToggled]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("products", arguments: ["search": GraphQLVariable("search"), "foodGroupId": GraphQLVariable("foodGroupId"), "sourceIds": GraphQLVariable("sourceIds"), "onlyToggled": GraphQLVariable("onlyToggled")], type: .list(.object(Product.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: [Product?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "products": products.flatMap { (value: [Product?]) -> [ResultMap?] in value.map { (value: Product?) -> ResultMap? in value.flatMap { (value: Product) -> ResultMap in value.resultMap } } }])
    }

    public var products: [Product?]? {
      get {
        return (resultMap["products"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Product?] in value.map { (value: ResultMap?) -> Product? in value.flatMap { (value: ResultMap) -> Product in Product(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Product?]) -> [ResultMap?] in value.map { (value: Product?) -> ResultMap? in value.flatMap { (value: Product) -> ResultMap in value.resultMap } } }, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("ProductSources", type: .list(.object(ProductSource.selections))),
          GraphQLField("amount", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("isToggled", type: .scalar(Bool.self)),
          GraphQLField("measure", type: .scalar(ProductMeasure.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, productSources: [ProductSource?]? = nil, amount: Int? = nil, id: GraphQLID? = nil, isToggled: Bool? = nil, measure: ProductMeasure? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Product", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "ProductSources": productSources.flatMap { (value: [ProductSource?]) -> [ResultMap?] in value.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var productSources: [ProductSource?]? {
        get {
          return (resultMap["ProductSources"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProductSource?] in value.map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ProductSource?]) -> [ResultMap?] in value.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } } }, forKey: "ProductSources")
        }
      }

      public var amount: Int? {
        get {
          return resultMap["amount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool? {
        get {
          return resultMap["isToggled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var measure: ProductMeasure? {
        get {
          return resultMap["measure"] as? ProductMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
            GraphQLField("urlIosPrev", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }

        public var urlIosPrev: String? {
          get {
            return resultMap["urlIosPrev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosPrev")
          }
        }
      }

      public struct ProductSource: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductSource"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .scalar(Int.self)),
            GraphQLField("name", type: .scalar(SourceEntityType.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amount: Int? = nil, name: SourceEntityType? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductSource", "amount": amount, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var amount: Int? {
          get {
            return resultMap["amount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var name: SourceEntityType? {
          get {
            return resultMap["name"] as? SourceEntityType
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class ProductsByMealQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ProductsByMeal($mealId: String!) {
      productsByMeal(mealId: $mealId) {
        __typename
        Image {
          __typename
          id
          urlIosFull
          urlIosPrev
        }
        ProductSources {
          __typename
          amount
          name
        }
        amount
        id
        isToggled
        measure
        name
      }
    }
    """

  public let operationName: String = "ProductsByMeal"

  public var mealId: String

  public init(mealId: String) {
    self.mealId = mealId
  }

  public var variables: GraphQLMap? {
    return ["mealId": mealId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("productsByMeal", arguments: ["mealId": GraphQLVariable("mealId")], type: .list(.object(ProductsByMeal.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(productsByMeal: [ProductsByMeal?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "productsByMeal": productsByMeal.flatMap { (value: [ProductsByMeal?]) -> [ResultMap?] in value.map { (value: ProductsByMeal?) -> ResultMap? in value.flatMap { (value: ProductsByMeal) -> ResultMap in value.resultMap } } }])
    }

    public var productsByMeal: [ProductsByMeal?]? {
      get {
        return (resultMap["productsByMeal"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProductsByMeal?] in value.map { (value: ResultMap?) -> ProductsByMeal? in value.flatMap { (value: ResultMap) -> ProductsByMeal in ProductsByMeal(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [ProductsByMeal?]) -> [ResultMap?] in value.map { (value: ProductsByMeal?) -> ResultMap? in value.flatMap { (value: ProductsByMeal) -> ResultMap in value.resultMap } } }, forKey: "productsByMeal")
      }
    }

    public struct ProductsByMeal: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("ProductSources", type: .list(.object(ProductSource.selections))),
          GraphQLField("amount", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("isToggled", type: .scalar(Bool.self)),
          GraphQLField("measure", type: .scalar(ProductMeasure.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, productSources: [ProductSource?]? = nil, amount: Int? = nil, id: GraphQLID? = nil, isToggled: Bool? = nil, measure: ProductMeasure? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Product", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "ProductSources": productSources.flatMap { (value: [ProductSource?]) -> [ResultMap?] in value.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var productSources: [ProductSource?]? {
        get {
          return (resultMap["ProductSources"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProductSource?] in value.map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ProductSource?]) -> [ResultMap?] in value.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } } }, forKey: "ProductSources")
        }
      }

      public var amount: Int? {
        get {
          return resultMap["amount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool? {
        get {
          return resultMap["isToggled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var measure: ProductMeasure? {
        get {
          return resultMap["measure"] as? ProductMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
            GraphQLField("urlIosPrev", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }

        public var urlIosPrev: String? {
          get {
            return resultMap["urlIosPrev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosPrev")
          }
        }
      }

      public struct ProductSource: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductSource"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .scalar(Int.self)),
            GraphQLField("name", type: .scalar(SourceEntityType.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amount: Int? = nil, name: SourceEntityType? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductSource", "amount": amount, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var amount: Int? {
          get {
            return resultMap["amount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var name: SourceEntityType? {
          get {
            return resultMap["name"] as? SourceEntityType
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class ProgressesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Progresses($from: Date!, $to: Date!) {
      progresses(from: $from, to: $to) {
        __typename
        createdAt
        progress
      }
    }
    """

  public let operationName: String = "Progresses"

  public var from: String
  public var to: String

  public init(from: String, to: String) {
    self.from = from
    self.to = to
  }

  public var variables: GraphQLMap? {
    return ["from": from, "to": to]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("progresses", arguments: ["from": GraphQLVariable("from"), "to": GraphQLVariable("to")], type: .list(.object(Progress.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(progresses: [Progress?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "progresses": progresses.flatMap { (value: [Progress?]) -> [ResultMap?] in value.map { (value: Progress?) -> ResultMap? in value.flatMap { (value: Progress) -> ResultMap in value.resultMap } } }])
    }

    public var progresses: [Progress?]? {
      get {
        return (resultMap["progresses"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Progress?] in value.map { (value: ResultMap?) -> Progress? in value.flatMap { (value: ResultMap) -> Progress in Progress(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Progress?]) -> [ResultMap?] in value.map { (value: Progress?) -> ResultMap? in value.flatMap { (value: Progress) -> ResultMap in value.resultMap } } }, forKey: "progresses")
      }
    }

    public struct Progress: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Progress"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("progress", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createdAt: String? = nil, progress: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Progress", "createdAt": createdAt, "progress": progress])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var progress: Int? {
        get {
          return resultMap["progress"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "progress")
        }
      }
    }
  }
}

public final class RankQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Rank {
      rank {
        __typename
        countryPosition
        globalPosition
        level
        rank
      }
    }
    """

  public let operationName: String = "Rank"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("rank", type: .object(Rank.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rank: Rank? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "rank": rank.flatMap { (value: Rank) -> ResultMap in value.resultMap }])
    }

    public var rank: Rank? {
      get {
        return (resultMap["rank"] as? ResultMap).flatMap { Rank(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "rank")
      }
    }

    public struct Rank: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Rank"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("countryPosition", type: .scalar(Int.self)),
          GraphQLField("globalPosition", type: .scalar(Int.self)),
          GraphQLField("level", type: .scalar(Int.self)),
          GraphQLField("rank", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(countryPosition: Int? = nil, globalPosition: Int? = nil, level: Int? = nil, rank: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Rank", "countryPosition": countryPosition, "globalPosition": globalPosition, "level": level, "rank": rank])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var countryPosition: Int? {
        get {
          return resultMap["countryPosition"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "countryPosition")
        }
      }

      public var globalPosition: Int? {
        get {
          return resultMap["globalPosition"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "globalPosition")
        }
      }

      public var level: Int? {
        get {
          return resultMap["level"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "level")
        }
      }

      public var rank: Int? {
        get {
          return resultMap["rank"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "rank")
        }
      }
    }
  }
}

public final class RecentProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query RecentProducts {
      recentProducts {
        __typename
        Image {
          __typename
          id
          urlIosFull
          urlIosPrev
        }
        ProductSources {
          __typename
          amount
          name
        }
        amount
        id
        isToggled
        measure
        name
      }
    }
    """

  public let operationName: String = "RecentProducts"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("recentProducts", type: .list(.object(RecentProduct.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recentProducts: [RecentProduct?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "recentProducts": recentProducts.flatMap { (value: [RecentProduct?]) -> [ResultMap?] in value.map { (value: RecentProduct?) -> ResultMap? in value.flatMap { (value: RecentProduct) -> ResultMap in value.resultMap } } }])
    }

    public var recentProducts: [RecentProduct?]? {
      get {
        return (resultMap["recentProducts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RecentProduct?] in value.map { (value: ResultMap?) -> RecentProduct? in value.flatMap { (value: ResultMap) -> RecentProduct in RecentProduct(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RecentProduct?]) -> [ResultMap?] in value.map { (value: RecentProduct?) -> ResultMap? in value.flatMap { (value: RecentProduct) -> ResultMap in value.resultMap } } }, forKey: "recentProducts")
      }
    }

    public struct RecentProduct: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("ProductSources", type: .list(.object(ProductSource.selections))),
          GraphQLField("amount", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("isToggled", type: .scalar(Bool.self)),
          GraphQLField("measure", type: .scalar(ProductMeasure.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, productSources: [ProductSource?]? = nil, amount: Int? = nil, id: GraphQLID? = nil, isToggled: Bool? = nil, measure: ProductMeasure? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Product", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "ProductSources": productSources.flatMap { (value: [ProductSource?]) -> [ResultMap?] in value.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var productSources: [ProductSource?]? {
        get {
          return (resultMap["ProductSources"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProductSource?] in value.map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ProductSource?]) -> [ResultMap?] in value.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } } }, forKey: "ProductSources")
        }
      }

      public var amount: Int? {
        get {
          return resultMap["amount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool? {
        get {
          return resultMap["isToggled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var measure: ProductMeasure? {
        get {
          return resultMap["measure"] as? ProductMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
            GraphQLField("urlIosPrev", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }

        public var urlIosPrev: String? {
          get {
            return resultMap["urlIosPrev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosPrev")
          }
        }
      }

      public struct ProductSource: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductSource"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .scalar(Int.self)),
            GraphQLField("name", type: .scalar(SourceEntityType.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amount: Int? = nil, name: SourceEntityType? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductSource", "amount": amount, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var amount: Int? {
          get {
            return resultMap["amount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var name: SourceEntityType? {
          get {
            return resultMap["name"] as? SourceEntityType
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class RecommendProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query RecommendProducts($mealType: MealType!) {
      recommendProducts(mealType: $mealType) {
        __typename
        Image {
          __typename
          id
          urlIosFull
          urlIosPrev
        }
        ProductSources {
          __typename
          amount
          name
        }
        amount
        id
        isToggled
        measure
        name
      }
    }
    """

  public let operationName: String = "RecommendProducts"

  public var mealType: MealType

  public init(mealType: MealType) {
    self.mealType = mealType
  }

  public var variables: GraphQLMap? {
    return ["mealType": mealType]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("recommendProducts", arguments: ["mealType": GraphQLVariable("mealType")], type: .list(.object(RecommendProduct.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recommendProducts: [RecommendProduct?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "recommendProducts": recommendProducts.flatMap { (value: [RecommendProduct?]) -> [ResultMap?] in value.map { (value: RecommendProduct?) -> ResultMap? in value.flatMap { (value: RecommendProduct) -> ResultMap in value.resultMap } } }])
    }

    public var recommendProducts: [RecommendProduct?]? {
      get {
        return (resultMap["recommendProducts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RecommendProduct?] in value.map { (value: ResultMap?) -> RecommendProduct? in value.flatMap { (value: ResultMap) -> RecommendProduct in RecommendProduct(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RecommendProduct?]) -> [ResultMap?] in value.map { (value: RecommendProduct?) -> ResultMap? in value.flatMap { (value: RecommendProduct) -> ResultMap in value.resultMap } } }, forKey: "recommendProducts")
      }
    }

    public struct RecommendProduct: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("ProductSources", type: .list(.object(ProductSource.selections))),
          GraphQLField("amount", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("isToggled", type: .scalar(Bool.self)),
          GraphQLField("measure", type: .scalar(ProductMeasure.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, productSources: [ProductSource?]? = nil, amount: Int? = nil, id: GraphQLID? = nil, isToggled: Bool? = nil, measure: ProductMeasure? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Product", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "ProductSources": productSources.flatMap { (value: [ProductSource?]) -> [ResultMap?] in value.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var productSources: [ProductSource?]? {
        get {
          return (resultMap["ProductSources"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProductSource?] in value.map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ProductSource?]) -> [ResultMap?] in value.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } } }, forKey: "ProductSources")
        }
      }

      public var amount: Int? {
        get {
          return resultMap["amount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool? {
        get {
          return resultMap["isToggled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var measure: ProductMeasure? {
        get {
          return resultMap["measure"] as? ProductMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
            GraphQLField("urlIosPrev", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }

        public var urlIosPrev: String? {
          get {
            return resultMap["urlIosPrev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosPrev")
          }
        }
      }

      public struct ProductSource: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductSource"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .scalar(Int.self)),
            GraphQLField("name", type: .scalar(SourceEntityType.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amount: Int? = nil, name: SourceEntityType? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductSource", "amount": amount, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var amount: Int? {
          get {
            return resultMap["amount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var name: SourceEntityType? {
          get {
            return resultMap["name"] as? SourceEntityType
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class RecommendWorkoutsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query RecommendWorkouts {
      recommendWorkouts {
        __typename
        Image {
          __typename
          id
          urlIosFull
        }
        duration {
          __typename
          hours
          minutes
          seconds
        }
        energy
        energyTotal
        id
        isAvailable
        isFinished
        title
        totalExercises
        totalFinishedExercises
      }
    }
    """

  public let operationName: String = "RecommendWorkouts"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("recommendWorkouts", type: .list(.object(RecommendWorkout.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recommendWorkouts: [RecommendWorkout?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "recommendWorkouts": recommendWorkouts.flatMap { (value: [RecommendWorkout?]) -> [ResultMap?] in value.map { (value: RecommendWorkout?) -> ResultMap? in value.flatMap { (value: RecommendWorkout) -> ResultMap in value.resultMap } } }])
    }

    public var recommendWorkouts: [RecommendWorkout?]? {
      get {
        return (resultMap["recommendWorkouts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RecommendWorkout?] in value.map { (value: ResultMap?) -> RecommendWorkout? in value.flatMap { (value: ResultMap) -> RecommendWorkout in RecommendWorkout(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RecommendWorkout?]) -> [ResultMap?] in value.map { (value: RecommendWorkout?) -> ResultMap? in value.flatMap { (value: RecommendWorkout) -> ResultMap in value.resultMap } } }, forKey: "recommendWorkouts")
      }
    }

    public struct RecommendWorkout: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Workout"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("duration", type: .object(Duration.selections)),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("isAvailable", type: .scalar(Bool.self)),
          GraphQLField("isFinished", type: .scalar(Bool.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("totalExercises", type: .scalar(Int.self)),
          GraphQLField("totalFinishedExercises", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, duration: Duration? = nil, energy: Int? = nil, energyTotal: Int? = nil, id: GraphQLID? = nil, isAvailable: Bool? = nil, isFinished: Bool? = nil, title: String? = nil, totalExercises: Int? = nil, totalFinishedExercises: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Workout", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "duration": duration.flatMap { (value: Duration) -> ResultMap in value.resultMap }, "energy": energy, "energyTotal": energyTotal, "id": id, "isAvailable": isAvailable, "isFinished": isFinished, "title": title, "totalExercises": totalExercises, "totalFinishedExercises": totalFinishedExercises])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var duration: Duration? {
        get {
          return (resultMap["duration"] as? ResultMap).flatMap { Duration(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "duration")
        }
      }

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isAvailable: Bool? {
        get {
          return resultMap["isAvailable"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAvailable")
        }
      }

      public var isFinished: Bool? {
        get {
          return resultMap["isFinished"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var totalExercises: Int? {
        get {
          return resultMap["totalExercises"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalExercises")
        }
      }

      public var totalFinishedExercises: Int? {
        get {
          return resultMap["totalFinishedExercises"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalFinishedExercises")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }
      }

      public struct Duration: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["IntervalRepresentation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hours", type: .scalar(Int.self)),
            GraphQLField("minutes", type: .scalar(Int.self)),
            GraphQLField("seconds", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hours: Int? = nil, minutes: Int? = nil, seconds: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "IntervalRepresentation", "hours": hours, "minutes": minutes, "seconds": seconds])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hours: Int? {
          get {
            return resultMap["hours"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "hours")
          }
        }

        public var minutes: Int? {
          get {
            return resultMap["minutes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "minutes")
          }
        }

        public var seconds: Int? {
          get {
            return resultMap["seconds"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "seconds")
          }
        }
      }
    }
  }
}

public final class SaveWeightWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SaveWeightWidget {
      saveWeightWidget {
        __typename
        energy
        energyTotal
        measure
        targetWeight
        weight
        createdAt
      }
    }
    """

  public let operationName: String = "SaveWeightWidget"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("saveWeightWidget", type: .object(SaveWeightWidget.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveWeightWidget: SaveWeightWidget? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "saveWeightWidget": saveWeightWidget.flatMap { (value: SaveWeightWidget) -> ResultMap in value.resultMap }])
    }

    public var saveWeightWidget: SaveWeightWidget? {
      get {
        return (resultMap["saveWeightWidget"] as? ResultMap).flatMap { SaveWeightWidget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "saveWeightWidget")
      }
    }

    public struct SaveWeightWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SaveWeightWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("measure", type: .scalar(WeightMeasure.self)),
          GraphQLField("targetWeight", type: .scalar(Double.self)),
          GraphQLField("weight", type: .scalar(Double.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(energy: Int? = nil, energyTotal: Int? = nil, measure: WeightMeasure? = nil, targetWeight: Double? = nil, weight: Double? = nil, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "SaveWeightWidget", "energy": energy, "energyTotal": energyTotal, "measure": measure, "targetWeight": targetWeight, "weight": weight, "createdAt": createdAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var measure: WeightMeasure? {
        get {
          return resultMap["measure"] as? WeightMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var targetWeight: Double? {
        get {
          return resultMap["targetWeight"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "targetWeight")
        }
      }

      public var weight: Double? {
        get {
          return resultMap["weight"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }
    }
  }
}

public final class SleepWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SleepWidget($date: Date!) {
      sleepWidget(date: $date) {
        __typename
        energy
        energyTotal
        quality
      }
    }
    """

  public let operationName: String = "SleepWidget"

  public var date: String

  public init(date: String) {
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sleepWidget", arguments: ["date": GraphQLVariable("date")], type: .object(SleepWidget.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sleepWidget: SleepWidget? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sleepWidget": sleepWidget.flatMap { (value: SleepWidget) -> ResultMap in value.resultMap }])
    }

    public var sleepWidget: SleepWidget? {
      get {
        return (resultMap["sleepWidget"] as? ResultMap).flatMap { SleepWidget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "sleepWidget")
      }
    }

    public struct SleepWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SleepWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("quality", type: .scalar(SleepQualityType.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(energy: Int? = nil, energyTotal: Int? = nil, quality: SleepQualityType? = nil) {
        self.init(unsafeResultMap: ["__typename": "SleepWidget", "energy": energy, "energyTotal": energyTotal, "quality": quality])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var quality: SleepQualityType? {
        get {
          return resultMap["quality"] as? SleepQualityType
        }
        set {
          resultMap.updateValue(newValue, forKey: "quality")
        }
      }
    }
  }
}

public final class SourcesByMealQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SourcesByMeal($mealId: String!) {
      sourcesByMeal(mealId: $mealId) {
        __typename
        eaten
        name
        needed
        id
      }
    }
    """

  public let operationName: String = "SourcesByMeal"

  public var mealId: String

  public init(mealId: String) {
    self.mealId = mealId
  }

  public var variables: GraphQLMap? {
    return ["mealId": mealId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sourcesByMeal", arguments: ["mealId": GraphQLVariable("mealId")], type: .list(.object(SourcesByMeal.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sourcesByMeal: [SourcesByMeal?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sourcesByMeal": sourcesByMeal.flatMap { (value: [SourcesByMeal?]) -> [ResultMap?] in value.map { (value: SourcesByMeal?) -> ResultMap? in value.flatMap { (value: SourcesByMeal) -> ResultMap in value.resultMap } } }])
    }

    public var sourcesByMeal: [SourcesByMeal?]? {
      get {
        return (resultMap["sourcesByMeal"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SourcesByMeal?] in value.map { (value: ResultMap?) -> SourcesByMeal? in value.flatMap { (value: ResultMap) -> SourcesByMeal in SourcesByMeal(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SourcesByMeal?]) -> [ResultMap?] in value.map { (value: SourcesByMeal?) -> ResultMap? in value.flatMap { (value: SourcesByMeal) -> ResultMap in value.resultMap } } }, forKey: "sourcesByMeal")
      }
    }

    public struct SourcesByMeal: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SourceByMeal"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("eaten", type: .scalar(Int.self)),
          GraphQLField("name", type: .scalar(SourceEntityType.self)),
          GraphQLField("needed", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(eaten: Int? = nil, name: SourceEntityType? = nil, needed: Int? = nil, id: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "SourceByMeal", "eaten": eaten, "name": name, "needed": needed, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var eaten: Int? {
        get {
          return resultMap["eaten"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "eaten")
        }
      }

      public var name: SourceEntityType? {
        get {
          return resultMap["name"] as? SourceEntityType
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var needed: Int? {
        get {
          return resultMap["needed"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "needed")
        }
      }

      public var id: Int? {
        get {
          return resultMap["id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class SpinQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Spin($spinId: String) {
      spin(spinId: $spinId) {
        __typename
        type
        amount
      }
    }
    """

  public let operationName: String = "Spin"

  public var spinId: String?

  public init(spinId: String? = nil) {
    self.spinId = spinId
  }

  public var variables: GraphQLMap? {
    return ["spinId": spinId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("spin", arguments: ["spinId": GraphQLVariable("spinId")], type: .list(.object(Spin.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(spin: [Spin?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "spin": spin.flatMap { (value: [Spin?]) -> [ResultMap?] in value.map { (value: Spin?) -> ResultMap? in value.flatMap { (value: Spin) -> ResultMap in value.resultMap } } }])
    }

    public var spin: [Spin?]? {
      get {
        return (resultMap["spin"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Spin?] in value.map { (value: ResultMap?) -> Spin? in value.flatMap { (value: ResultMap) -> Spin in Spin(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Spin?]) -> [ResultMap?] in value.map { (value: Spin?) -> ResultMap? in value.flatMap { (value: Spin) -> ResultMap in value.resultMap } } }, forKey: "spin")
      }
    }

    public struct Spin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SpinReward"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .scalar(SpinObjectRewardType.self)),
          GraphQLField("amount", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(type: SpinObjectRewardType? = nil, amount: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "SpinReward", "type": type, "amount": amount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var type: SpinObjectRewardType? {
        get {
          return resultMap["type"] as? SpinObjectRewardType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var amount: Int? {
        get {
          return resultMap["amount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }
    }
  }
}

public final class ProgressQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Progress {
      progress {
        __typename
        createdAt
        progress
      }
    }
    """

  public let operationName: String = "Progress"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("progress", type: .object(Progress.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(progress: Progress? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "progress": progress.flatMap { (value: Progress) -> ResultMap in value.resultMap }])
    }

    public var progress: Progress? {
      get {
        return (resultMap["progress"] as? ResultMap).flatMap { Progress(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "progress")
      }
    }

    public struct Progress: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Progress"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("progress", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createdAt: String? = nil, progress: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Progress", "createdAt": createdAt, "progress": progress])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var progress: Int? {
        get {
          return resultMap["progress"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "progress")
        }
      }
    }
  }
}

public final class ToggleMuscleInWorkoutsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ToggleMuscleInWorkouts($muscleIds: [Int!]!) {
      toggleMuscleInWorkouts(muscleIds: $muscleIds)
    }
    """

  public let operationName: String = "ToggleMuscleInWorkouts"

  public var muscleIds: [Int]

  public init(muscleIds: [Int]) {
    self.muscleIds = muscleIds
  }

  public var variables: GraphQLMap? {
    return ["muscleIds": muscleIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("toggleMuscleInWorkouts", arguments: ["muscleIds": GraphQLVariable("muscleIds")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toggleMuscleInWorkouts: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "toggleMuscleInWorkouts": toggleMuscleInWorkouts])
    }

    public var toggleMuscleInWorkouts: Bool? {
      get {
        return resultMap["toggleMuscleInWorkouts"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "toggleMuscleInWorkouts")
      }
    }
  }
}

public final class ToggleProductInRationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ToggleProductInRation($productIds: [String!]!) {
      toggleProductInRation(productIds: $productIds)
    }
    """

  public let operationName: String = "ToggleProductInRation"

  public var productIds: [String]

  public init(productIds: [String]) {
    self.productIds = productIds
  }

  public var variables: GraphQLMap? {
    return ["productIds": productIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("toggleProductInRation", arguments: ["productIds": GraphQLVariable("productIds")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toggleProductInRation: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "toggleProductInRation": toggleProductInRation])
    }

    public var toggleProductInRation: Bool? {
      get {
        return resultMap["toggleProductInRation"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "toggleProductInRation")
      }
    }
  }
}

public final class WeightsWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WeightsWidget($from: Date, $to: Date) {
      weightsWidget(from: $from, to: $to) {
        __typename
        Weights {
          __typename
          createdAt
          weight
        }
        measure
        targetWeight
      }
    }
    """

  public let operationName: String = "WeightsWidget"

  public var from: String?
  public var to: String?

  public init(from: String? = nil, to: String? = nil) {
    self.from = from
    self.to = to
  }

  public var variables: GraphQLMap? {
    return ["from": from, "to": to]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("weightsWidget", arguments: ["from": GraphQLVariable("from"), "to": GraphQLVariable("to")], type: .object(WeightsWidget.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(weightsWidget: WeightsWidget? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "weightsWidget": weightsWidget.flatMap { (value: WeightsWidget) -> ResultMap in value.resultMap }])
    }

    public var weightsWidget: WeightsWidget? {
      get {
        return (resultMap["weightsWidget"] as? ResultMap).flatMap { WeightsWidget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "weightsWidget")
      }
    }

    public struct WeightsWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WeightsWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weights", type: .list(.object(Weight.selections))),
          GraphQLField("measure", type: .scalar(WeightMeasure.self)),
          GraphQLField("targetWeight", type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(weights: [Weight?]? = nil, measure: WeightMeasure? = nil, targetWeight: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "WeightsWidget", "Weights": weights.flatMap { (value: [Weight?]) -> [ResultMap?] in value.map { (value: Weight?) -> ResultMap? in value.flatMap { (value: Weight) -> ResultMap in value.resultMap } } }, "measure": measure, "targetWeight": targetWeight])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var weights: [Weight?]? {
        get {
          return (resultMap["Weights"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Weight?] in value.map { (value: ResultMap?) -> Weight? in value.flatMap { (value: ResultMap) -> Weight in Weight(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Weight?]) -> [ResultMap?] in value.map { (value: Weight?) -> ResultMap? in value.flatMap { (value: Weight) -> ResultMap in value.resultMap } } }, forKey: "Weights")
        }
      }

      public var measure: WeightMeasure? {
        get {
          return resultMap["measure"] as? WeightMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var targetWeight: Double? {
        get {
          return resultMap["targetWeight"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "targetWeight")
        }
      }

      public struct Weight: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Weight"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("weight", type: .scalar(Double.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(createdAt: String? = nil, weight: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Weight", "createdAt": createdAt, "weight": weight])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var weight: Double? {
          get {
            return resultMap["weight"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "weight")
          }
        }
      }
    }
  }
}

public final class WidgetListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WidgetList {
      widgetList
    }
    """

  public let operationName: String = "WidgetList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("widgetList", type: .list(.scalar(WidgetEntityType.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(widgetList: [WidgetEntityType?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "widgetList": widgetList])
    }

    public var widgetList: [WidgetEntityType?]? {
      get {
        return resultMap["widgetList"] as? [WidgetEntityType?]
      }
      set {
        resultMap.updateValue(newValue, forKey: "widgetList")
      }
    }
  }
}

public final class WorkoutByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutById($id: String!) {
      workoutById(id: $id) {
        __typename
        ExerciseGroups {
          __typename
          Exercises {
            __typename
            Image {
              __typename
              id
              urlIosFull
            }
            Video {
              __typename
              id
              url
            }
            description
            duration {
              __typename
              hours
              minutes
              seconds
            }
            id
            isFinished
            isRest
            title
            rapes
          }
          id
          title
        }
        Image {
          __typename
          id
          urlIosFull
        }
        Muscles {
          __typename
          id
          isToggled
          name
        }
        description
        duration {
          __typename
          hours
          minutes
          seconds
        }
        energy
        energyTotal
        id
        isAvailable
        isFinished
        kCal
        title
        totalExercises
        totalFinishedExercises
      }
    }
    """

  public let operationName: String = "WorkoutById"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutById", arguments: ["id": GraphQLVariable("id")], type: .object(WorkoutById.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutById: WorkoutById? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutById": workoutById.flatMap { (value: WorkoutById) -> ResultMap in value.resultMap }])
    }

    public var workoutById: WorkoutById? {
      get {
        return (resultMap["workoutById"] as? ResultMap).flatMap { WorkoutById(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "workoutById")
      }
    }

    public struct WorkoutById: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Workout"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ExerciseGroups", type: .list(.object(ExerciseGroup.selections))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("Muscles", type: .list(.object(Muscle.selections))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("duration", type: .object(Duration.selections)),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("isAvailable", type: .scalar(Bool.self)),
          GraphQLField("isFinished", type: .scalar(Bool.self)),
          GraphQLField("kCal", type: .scalar(Int.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("totalExercises", type: .scalar(Int.self)),
          GraphQLField("totalFinishedExercises", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(exerciseGroups: [ExerciseGroup?]? = nil, image: Image? = nil, muscles: [Muscle?]? = nil, description: String? = nil, duration: Duration? = nil, energy: Int? = nil, energyTotal: Int? = nil, id: GraphQLID? = nil, isAvailable: Bool? = nil, isFinished: Bool? = nil, kCal: Int? = nil, title: String? = nil, totalExercises: Int? = nil, totalFinishedExercises: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Workout", "ExerciseGroups": exerciseGroups.flatMap { (value: [ExerciseGroup?]) -> [ResultMap?] in value.map { (value: ExerciseGroup?) -> ResultMap? in value.flatMap { (value: ExerciseGroup) -> ResultMap in value.resultMap } } }, "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "Muscles": muscles.flatMap { (value: [Muscle?]) -> [ResultMap?] in value.map { (value: Muscle?) -> ResultMap? in value.flatMap { (value: Muscle) -> ResultMap in value.resultMap } } }, "description": description, "duration": duration.flatMap { (value: Duration) -> ResultMap in value.resultMap }, "energy": energy, "energyTotal": energyTotal, "id": id, "isAvailable": isAvailable, "isFinished": isFinished, "kCal": kCal, "title": title, "totalExercises": totalExercises, "totalFinishedExercises": totalFinishedExercises])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var exerciseGroups: [ExerciseGroup?]? {
        get {
          return (resultMap["ExerciseGroups"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ExerciseGroup?] in value.map { (value: ResultMap?) -> ExerciseGroup? in value.flatMap { (value: ResultMap) -> ExerciseGroup in ExerciseGroup(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ExerciseGroup?]) -> [ResultMap?] in value.map { (value: ExerciseGroup?) -> ResultMap? in value.flatMap { (value: ExerciseGroup) -> ResultMap in value.resultMap } } }, forKey: "ExerciseGroups")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var muscles: [Muscle?]? {
        get {
          return (resultMap["Muscles"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Muscle?] in value.map { (value: ResultMap?) -> Muscle? in value.flatMap { (value: ResultMap) -> Muscle in Muscle(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Muscle?]) -> [ResultMap?] in value.map { (value: Muscle?) -> ResultMap? in value.flatMap { (value: Muscle) -> ResultMap in value.resultMap } } }, forKey: "Muscles")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var duration: Duration? {
        get {
          return (resultMap["duration"] as? ResultMap).flatMap { Duration(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "duration")
        }
      }

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isAvailable: Bool? {
        get {
          return resultMap["isAvailable"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAvailable")
        }
      }

      public var isFinished: Bool? {
        get {
          return resultMap["isFinished"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var kCal: Int? {
        get {
          return resultMap["kCal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "kCal")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var totalExercises: Int? {
        get {
          return resultMap["totalExercises"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalExercises")
        }
      }

      public var totalFinishedExercises: Int? {
        get {
          return resultMap["totalFinishedExercises"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalFinishedExercises")
        }
      }

      public struct ExerciseGroup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ExerciseGroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Exercises", type: .list(.object(Exercise.selections))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("title", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(exercises: [Exercise?]? = nil, id: GraphQLID? = nil, title: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "ExerciseGroup", "Exercises": exercises.flatMap { (value: [Exercise?]) -> [ResultMap?] in value.map { (value: Exercise?) -> ResultMap? in value.flatMap { (value: Exercise) -> ResultMap in value.resultMap } } }, "id": id, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var exercises: [Exercise?]? {
          get {
            return (resultMap["Exercises"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Exercise?] in value.map { (value: ResultMap?) -> Exercise? in value.flatMap { (value: ResultMap) -> Exercise in Exercise(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Exercise?]) -> [ResultMap?] in value.map { (value: Exercise?) -> ResultMap? in value.flatMap { (value: Exercise) -> ResultMap in value.resultMap } } }, forKey: "Exercises")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public struct Exercise: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Exercise"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("Image", type: .object(Image.selections)),
              GraphQLField("Video", type: .object(Video.selections)),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("duration", type: .object(Duration.selections)),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("isFinished", type: .scalar(Bool.self)),
              GraphQLField("isRest", type: .scalar(Bool.self)),
              GraphQLField("title", type: .scalar(String.self)),
              GraphQLField("rapes", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(image: Image? = nil, video: Video? = nil, description: String? = nil, duration: Duration? = nil, id: GraphQLID? = nil, isFinished: Bool? = nil, isRest: Bool? = nil, title: String? = nil, rapes: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Exercise", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "Video": video.flatMap { (value: Video) -> ResultMap in value.resultMap }, "description": description, "duration": duration.flatMap { (value: Duration) -> ResultMap in value.resultMap }, "id": id, "isFinished": isFinished, "isRest": isRest, "title": title, "rapes": rapes])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var image: Image? {
            get {
              return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "Image")
            }
          }

          public var video: Video? {
            get {
              return (resultMap["Video"] as? ResultMap).flatMap { Video(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "Video")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public var duration: Duration? {
            get {
              return (resultMap["duration"] as? ResultMap).flatMap { Duration(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "duration")
            }
          }

          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var isFinished: Bool? {
            get {
              return resultMap["isFinished"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isFinished")
            }
          }

          public var isRest: Bool? {
            get {
              return resultMap["isRest"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isRest")
            }
          }

          public var title: String? {
            get {
              return resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var rapes: Int? {
            get {
              return resultMap["rapes"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "rapes")
            }
          }

          public struct Image: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Image"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(GraphQLID.self)),
                GraphQLField("urlIosFull", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID? = nil, urlIosFull: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID? {
              get {
                return resultMap["id"] as? GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var urlIosFull: String? {
              get {
                return resultMap["urlIosFull"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "urlIosFull")
              }
            }
          }

          public struct Video: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Video"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(GraphQLID.self)),
                GraphQLField("url", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID? = nil, url: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Video", "id": id, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID? {
              get {
                return resultMap["id"] as? GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var url: String? {
              get {
                return resultMap["url"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }

          public struct Duration: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["IntervalRepresentation"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("hours", type: .scalar(Int.self)),
                GraphQLField("minutes", type: .scalar(Int.self)),
                GraphQLField("seconds", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(hours: Int? = nil, minutes: Int? = nil, seconds: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "IntervalRepresentation", "hours": hours, "minutes": minutes, "seconds": seconds])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var hours: Int? {
              get {
                return resultMap["hours"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "hours")
              }
            }

            public var minutes: Int? {
              get {
                return resultMap["minutes"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "minutes")
              }
            }

            public var seconds: Int? {
              get {
                return resultMap["seconds"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "seconds")
              }
            }
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }
      }

      public struct Muscle: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Muscle"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("isToggled", type: .scalar(Bool.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, isToggled: Bool? = nil, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Muscle", "id": id, "isToggled": isToggled, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int? {
          get {
            return resultMap["id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var isToggled: Bool? {
          get {
            return resultMap["isToggled"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isToggled")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Duration: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["IntervalRepresentation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hours", type: .scalar(Int.self)),
            GraphQLField("minutes", type: .scalar(Int.self)),
            GraphQLField("seconds", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hours: Int? = nil, minutes: Int? = nil, seconds: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "IntervalRepresentation", "hours": hours, "minutes": minutes, "seconds": seconds])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hours: Int? {
          get {
            return resultMap["hours"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "hours")
          }
        }

        public var minutes: Int? {
          get {
            return resultMap["minutes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "minutes")
          }
        }

        public var seconds: Int? {
          get {
            return resultMap["seconds"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "seconds")
          }
        }
      }
    }
  }
}

public final class WorkoutsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Workouts($workoutTypeIds: [Int], $difficulty: WorkoutDifficulty, $muscleIds: [String], $durationFrom: Int, $durationTo: Int) {
      workouts(
        workoutTypeIds: $workoutTypeIds
        difficulty: $difficulty
        muscleIds: $muscleIds
        durationFrom: $durationFrom
        durationTo: $durationTo
      ) {
        __typename
        Pagination {
          __typename
          nextPageExists
          previousPageExists
          total
          totalPages
        }
        Workouts {
          __typename
          Image {
            __typename
            id
            urlIosFull
          }
          duration {
            __typename
            hours
            minutes
            seconds
          }
          energy
          energyTotal
          id
          isAvailable
          isFinished
          title
          totalExercises
          totalFinishedExercises
        }
      }
    }
    """

  public let operationName: String = "Workouts"

  public var workoutTypeIds: [Int?]?
  public var difficulty: WorkoutDifficulty?
  public var muscleIds: [String?]?
  public var durationFrom: Int?
  public var durationTo: Int?

  public init(workoutTypeIds: [Int?]? = nil, difficulty: WorkoutDifficulty? = nil, muscleIds: [String?]? = nil, durationFrom: Int? = nil, durationTo: Int? = nil) {
    self.workoutTypeIds = workoutTypeIds
    self.difficulty = difficulty
    self.muscleIds = muscleIds
    self.durationFrom = durationFrom
    self.durationTo = durationTo
  }

  public var variables: GraphQLMap? {
    return ["workoutTypeIds": workoutTypeIds, "difficulty": difficulty, "muscleIds": muscleIds, "durationFrom": durationFrom, "durationTo": durationTo]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workouts", arguments: ["workoutTypeIds": GraphQLVariable("workoutTypeIds"), "difficulty": GraphQLVariable("difficulty"), "muscleIds": GraphQLVariable("muscleIds"), "durationFrom": GraphQLVariable("durationFrom"), "durationTo": GraphQLVariable("durationTo")], type: .object(Workout.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workouts: Workout? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "workouts": workouts.flatMap { (value: Workout) -> ResultMap in value.resultMap }])
    }

    public var workouts: Workout? {
      get {
        return (resultMap["workouts"] as? ResultMap).flatMap { Workout(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "workouts")
      }
    }

    public struct Workout: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutsResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Pagination", type: .object(Pagination.selections)),
          GraphQLField("Workouts", type: .list(.object(Workout.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pagination: Pagination? = nil, workouts: [Workout?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "WorkoutsResponse", "Pagination": pagination.flatMap { (value: Pagination) -> ResultMap in value.resultMap }, "Workouts": workouts.flatMap { (value: [Workout?]) -> [ResultMap?] in value.map { (value: Workout?) -> ResultMap? in value.flatMap { (value: Workout) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pagination: Pagination? {
        get {
          return (resultMap["Pagination"] as? ResultMap).flatMap { Pagination(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Pagination")
        }
      }

      public var workouts: [Workout?]? {
        get {
          return (resultMap["Workouts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Workout?] in value.map { (value: ResultMap?) -> Workout? in value.flatMap { (value: ResultMap) -> Workout in Workout(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Workout?]) -> [ResultMap?] in value.map { (value: Workout?) -> ResultMap? in value.flatMap { (value: Workout) -> ResultMap in value.resultMap } } }, forKey: "Workouts")
        }
      }

      public struct Pagination: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Pagination"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextPageExists", type: .scalar(Bool.self)),
            GraphQLField("previousPageExists", type: .scalar(Bool.self)),
            GraphQLField("total", type: .scalar(Int.self)),
            GraphQLField("totalPages", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nextPageExists: Bool? = nil, previousPageExists: Bool? = nil, total: Int? = nil, totalPages: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pagination", "nextPageExists": nextPageExists, "previousPageExists": previousPageExists, "total": total, "totalPages": totalPages])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextPageExists: Bool? {
          get {
            return resultMap["nextPageExists"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPageExists")
          }
        }

        public var previousPageExists: Bool? {
          get {
            return resultMap["previousPageExists"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "previousPageExists")
          }
        }

        public var total: Int? {
          get {
            return resultMap["total"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "total")
          }
        }

        public var totalPages: Int? {
          get {
            return resultMap["totalPages"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalPages")
          }
        }
      }

      public struct Workout: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WorkoutShort"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Image", type: .object(Image.selections)),
            GraphQLField("duration", type: .object(Duration.selections)),
            GraphQLField("energy", type: .scalar(Int.self)),
            GraphQLField("energyTotal", type: .scalar(Int.self)),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("isAvailable", type: .scalar(Bool.self)),
            GraphQLField("isFinished", type: .scalar(Bool.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("totalExercises", type: .scalar(Int.self)),
            GraphQLField("totalFinishedExercises", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: Image? = nil, duration: Duration? = nil, energy: Int? = nil, energyTotal: Int? = nil, id: GraphQLID? = nil, isAvailable: Bool? = nil, isFinished: Bool? = nil, title: String? = nil, totalExercises: Int? = nil, totalFinishedExercises: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "WorkoutShort", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "duration": duration.flatMap { (value: Duration) -> ResultMap in value.resultMap }, "energy": energy, "energyTotal": energyTotal, "id": id, "isAvailable": isAvailable, "isFinished": isFinished, "title": title, "totalExercises": totalExercises, "totalFinishedExercises": totalFinishedExercises])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var image: Image? {
          get {
            return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "Image")
          }
        }

        public var duration: Duration? {
          get {
            return (resultMap["duration"] as? ResultMap).flatMap { Duration(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "duration")
          }
        }

        public var energy: Int? {
          get {
            return resultMap["energy"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "energy")
          }
        }

        public var energyTotal: Int? {
          get {
            return resultMap["energyTotal"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "energyTotal")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var isAvailable: Bool? {
          get {
            return resultMap["isAvailable"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isAvailable")
          }
        }

        public var isFinished: Bool? {
          get {
            return resultMap["isFinished"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isFinished")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var totalExercises: Int? {
          get {
            return resultMap["totalExercises"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalExercises")
          }
        }

        public var totalFinishedExercises: Int? {
          get {
            return resultMap["totalFinishedExercises"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalFinishedExercises")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Image"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("urlIosFull", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, urlIosFull: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var urlIosFull: String? {
            get {
              return resultMap["urlIosFull"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "urlIosFull")
            }
          }
        }

        public struct Duration: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["IntervalRepresentation"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("hours", type: .scalar(Int.self)),
              GraphQLField("minutes", type: .scalar(Int.self)),
              GraphQLField("seconds", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(hours: Int? = nil, minutes: Int? = nil, seconds: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "IntervalRepresentation", "hours": hours, "minutes": minutes, "seconds": seconds])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var hours: Int? {
            get {
              return resultMap["hours"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "hours")
            }
          }

          public var minutes: Int? {
            get {
              return resultMap["minutes"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "minutes")
            }
          }

          public var seconds: Int? {
            get {
              return resultMap["seconds"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "seconds")
            }
          }
        }
      }
    }
  }
}

public final class WorkoutsWidgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutsWidget($date: Date) {
      workoutsWidget(date: $date) {
        __typename
        Image {
          __typename
          id
          urlIosFull
          urlIosPrev
        }
        duration {
          __typename
          hours
          minutes
          seconds
        }
        energy
        energyTotal
        id
        isAvailable
        isFinished
        title
        totalExercises
        totalFinishedExercises
      }
    }
    """

  public let operationName: String = "WorkoutsWidget"

  public var date: String?

  public init(date: String? = nil) {
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutsWidget", arguments: ["date": GraphQLVariable("date")], type: .list(.object(WorkoutsWidget.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutsWidget: [WorkoutsWidget?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutsWidget": workoutsWidget.flatMap { (value: [WorkoutsWidget?]) -> [ResultMap?] in value.map { (value: WorkoutsWidget?) -> ResultMap? in value.flatMap { (value: WorkoutsWidget) -> ResultMap in value.resultMap } } }])
    }

    public var workoutsWidget: [WorkoutsWidget?]? {
      get {
        return (resultMap["workoutsWidget"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [WorkoutsWidget?] in value.map { (value: ResultMap?) -> WorkoutsWidget? in value.flatMap { (value: ResultMap) -> WorkoutsWidget in WorkoutsWidget(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [WorkoutsWidget?]) -> [ResultMap?] in value.map { (value: WorkoutsWidget?) -> ResultMap? in value.flatMap { (value: WorkoutsWidget) -> ResultMap in value.resultMap } } }, forKey: "workoutsWidget")
      }
    }

    public struct WorkoutsWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutShort"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("duration", type: .object(Duration.selections)),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("isAvailable", type: .scalar(Bool.self)),
          GraphQLField("isFinished", type: .scalar(Bool.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("totalExercises", type: .scalar(Int.self)),
          GraphQLField("totalFinishedExercises", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, duration: Duration? = nil, energy: Int? = nil, energyTotal: Int? = nil, id: GraphQLID? = nil, isAvailable: Bool? = nil, isFinished: Bool? = nil, title: String? = nil, totalExercises: Int? = nil, totalFinishedExercises: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "WorkoutShort", "Image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "duration": duration.flatMap { (value: Duration) -> ResultMap in value.resultMap }, "energy": energy, "energyTotal": energyTotal, "id": id, "isAvailable": isAvailable, "isFinished": isFinished, "title": title, "totalExercises": totalExercises, "totalFinishedExercises": totalFinishedExercises])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image? {
        get {
          return (resultMap["Image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Image")
        }
      }

      public var duration: Duration? {
        get {
          return (resultMap["duration"] as? ResultMap).flatMap { Duration(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "duration")
        }
      }

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energy")
        }
      }

      public var energyTotal: Int? {
        get {
          return resultMap["energyTotal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "energyTotal")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isAvailable: Bool? {
        get {
          return resultMap["isAvailable"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAvailable")
        }
      }

      public var isFinished: Bool? {
        get {
          return resultMap["isFinished"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var totalExercises: Int? {
        get {
          return resultMap["totalExercises"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalExercises")
        }
      }

      public var totalFinishedExercises: Int? {
        get {
          return resultMap["totalFinishedExercises"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalFinishedExercises")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("urlIosFull", type: .scalar(String.self)),
            GraphQLField("urlIosPrev", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, urlIosFull: String? = nil, urlIosPrev: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "urlIosFull": urlIosFull, "urlIosPrev": urlIosPrev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var urlIosFull: String? {
          get {
            return resultMap["urlIosFull"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosFull")
          }
        }

        public var urlIosPrev: String? {
          get {
            return resultMap["urlIosPrev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "urlIosPrev")
          }
        }
      }

      public struct Duration: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["IntervalRepresentation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hours", type: .scalar(Int.self)),
            GraphQLField("minutes", type: .scalar(Int.self)),
            GraphQLField("seconds", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hours: Int? = nil, minutes: Int? = nil, seconds: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "IntervalRepresentation", "hours": hours, "minutes": minutes, "seconds": seconds])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hours: Int? {
          get {
            return resultMap["hours"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "hours")
          }
        }

        public var minutes: Int? {
          get {
            return resultMap["minutes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "minutes")
          }
        }

        public var seconds: Int? {
          get {
            return resultMap["seconds"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "seconds")
          }
        }
      }
    }
  }
}

public final class WorkoutTypesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutTypes {
      workoutTypes {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "WorkoutTypes"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutTypes", type: .list(.object(WorkoutType.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutTypes: [WorkoutType?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutTypes": workoutTypes.flatMap { (value: [WorkoutType?]) -> [ResultMap?] in value.map { (value: WorkoutType?) -> ResultMap? in value.flatMap { (value: WorkoutType) -> ResultMap in value.resultMap } } }])
    }

    public var workoutTypes: [WorkoutType?]? {
      get {
        return (resultMap["workoutTypes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [WorkoutType?] in value.map { (value: ResultMap?) -> WorkoutType? in value.flatMap { (value: ResultMap) -> WorkoutType in WorkoutType(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [WorkoutType?]) -> [ResultMap?] in value.map { (value: WorkoutType?) -> ResultMap? in value.flatMap { (value: WorkoutType) -> ResultMap in value.resultMap } } }, forKey: "workoutTypes")
      }
    }

    public struct WorkoutType: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(Int.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "WorkoutType", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int? {
        get {
          return resultMap["id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}
