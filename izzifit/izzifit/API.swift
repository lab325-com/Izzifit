// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct AddProductToMealRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - productId
  ///   - amount
  ///   - mealId
  public init(productId: Swift.Optional<String?> = nil, amount: Swift.Optional<Int?> = nil, mealId: Swift.Optional<String?> = nil) {
    graphQLMap = ["productId": productId, "amount": amount, "mealId": mealId]
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

  public var mealId: Swift.Optional<String?> {
    get {
      return graphQLMap["mealId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mealId")
    }
  }
}

public struct LoginRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  ///   - authType
  ///   - token
  ///   - udid
  public init(email: Swift.Optional<String?> = nil, password: Swift.Optional<String?> = nil, authType: Swift.Optional<AuthType?> = nil, token: Swift.Optional<String?> = nil, udid: Swift.Optional<String?> = nil) {
    graphQLMap = ["email": email, "password": password, "authType": authType, "token": token, "udid": udid]
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
}

public enum AuthType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case authTypeFacebook
  case authTypeUdid
  case authTypeApple
  case authTypeEmail
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AUTH_TYPE_FACEBOOK": self = .authTypeFacebook
      case "AUTH_TYPE_UDID": self = .authTypeUdid
      case "AUTH_TYPE_APPLE": self = .authTypeApple
      case "AUTH_TYPE_EMAIL": self = .authTypeEmail
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .authTypeFacebook: return "AUTH_TYPE_FACEBOOK"
      case .authTypeUdid: return "AUTH_TYPE_UDID"
      case .authTypeApple: return "AUTH_TYPE_APPLE"
      case .authTypeEmail: return "AUTH_TYPE_EMAIL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AuthType, rhs: AuthType) -> Bool {
    switch (lhs, rhs) {
      case (.authTypeFacebook, .authTypeFacebook): return true
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
      .authTypeUdid,
      .authTypeApple,
      .authTypeEmail,
    ]
  }
}

public struct ProfileUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - foodGroupId
  ///   - fitnessPreference
  ///   - weightMeasure
  ///   - goal
  ///   - doSport
  ///   - growth
  ///   - age
  ///   - notifications
  ///   - targetWeight
  ///   - growthMeasure
  ///   - reminders
  ///   - targetWeightMeasure
  ///   - darkTheme
  ///   - email
  ///   - gender
  ///   - weight
  public init(name: Swift.Optional<String?> = nil, foodGroupId: Swift.Optional<String?> = nil, fitnessPreference: Swift.Optional<FitnessPreferenceType?> = nil, weightMeasure: Swift.Optional<WeightMeasure?> = nil, goal: Swift.Optional<GoalType?> = nil, doSport: Swift.Optional<DoSportType?> = nil, growth: Swift.Optional<Int?> = nil, age: Swift.Optional<Int?> = nil, notifications: Swift.Optional<Bool?> = nil, targetWeight: Swift.Optional<Double?> = nil, growthMeasure: Swift.Optional<MeasureGrowth?> = nil, reminders: Swift.Optional<Bool?> = nil, targetWeightMeasure: Swift.Optional<WeightMeasure?> = nil, darkTheme: Swift.Optional<Bool?> = nil, email: Swift.Optional<String?> = nil, gender: Swift.Optional<GenderType?> = nil, weight: Swift.Optional<Double?> = nil) {
    graphQLMap = ["name": name, "foodGroupId": foodGroupId, "fitnessPreference": fitnessPreference, "weightMeasure": weightMeasure, "goal": goal, "doSport": doSport, "growth": growth, "age": age, "notifications": notifications, "targetWeight": targetWeight, "growthMeasure": growthMeasure, "reminders": reminders, "targetWeightMeasure": targetWeightMeasure, "darkTheme": darkTheme, "email": email, "gender": gender, "weight": weight]
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var foodGroupId: Swift.Optional<String?> {
    get {
      return graphQLMap["foodGroupId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "foodGroupId")
    }
  }

  public var fitnessPreference: Swift.Optional<FitnessPreferenceType?> {
    get {
      return graphQLMap["fitnessPreference"] as? Swift.Optional<FitnessPreferenceType?> ?? Swift.Optional<FitnessPreferenceType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fitnessPreference")
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

  public var goal: Swift.Optional<GoalType?> {
    get {
      return graphQLMap["goal"] as? Swift.Optional<GoalType?> ?? Swift.Optional<GoalType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "goal")
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

  public var growth: Swift.Optional<Int?> {
    get {
      return graphQLMap["growth"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "growth")
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

  public var notifications: Swift.Optional<Bool?> {
    get {
      return graphQLMap["notifications"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notifications")
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

  public var growthMeasure: Swift.Optional<MeasureGrowth?> {
    get {
      return graphQLMap["growthMeasure"] as? Swift.Optional<MeasureGrowth?> ?? Swift.Optional<MeasureGrowth?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "growthMeasure")
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

  public var targetWeightMeasure: Swift.Optional<WeightMeasure?> {
    get {
      return graphQLMap["targetWeightMeasure"] as? Swift.Optional<WeightMeasure?> ?? Swift.Optional<WeightMeasure?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "targetWeightMeasure")
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

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
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

  public var weight: Swift.Optional<Double?> {
    get {
      return graphQLMap["weight"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight")
    }
  }
}

public enum FitnessPreferenceType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case fitnessPreferenceTypeLight
  case fitnessPreferenceTypeProfessional
  case fitnessPreferenceTypeStrong
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "FITNESS_PREFERENCE_TYPE_LIGHT": self = .fitnessPreferenceTypeLight
      case "FITNESS_PREFERENCE_TYPE_PROFESSIONAL": self = .fitnessPreferenceTypeProfessional
      case "FITNESS_PREFERENCE_TYPE_STRONG": self = .fitnessPreferenceTypeStrong
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .fitnessPreferenceTypeLight: return "FITNESS_PREFERENCE_TYPE_LIGHT"
      case .fitnessPreferenceTypeProfessional: return "FITNESS_PREFERENCE_TYPE_PROFESSIONAL"
      case .fitnessPreferenceTypeStrong: return "FITNESS_PREFERENCE_TYPE_STRONG"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: FitnessPreferenceType, rhs: FitnessPreferenceType) -> Bool {
    switch (lhs, rhs) {
      case (.fitnessPreferenceTypeLight, .fitnessPreferenceTypeLight): return true
      case (.fitnessPreferenceTypeProfessional, .fitnessPreferenceTypeProfessional): return true
      case (.fitnessPreferenceTypeStrong, .fitnessPreferenceTypeStrong): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [FitnessPreferenceType] {
    return [
      .fitnessPreferenceTypeLight,
      .fitnessPreferenceTypeProfessional,
      .fitnessPreferenceTypeStrong,
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

public enum GoalType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case goalTypeMuscle
  case goalTypeFit
  case goalTypeFun
  case goalTypeLoseWeight
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GOAL_TYPE_MUSCLE": self = .goalTypeMuscle
      case "GOAL_TYPE_FIT": self = .goalTypeFit
      case "GOAL_TYPE_FUN": self = .goalTypeFun
      case "GOAL_TYPE_LOSE_WEIGHT": self = .goalTypeLoseWeight
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .goalTypeMuscle: return "GOAL_TYPE_MUSCLE"
      case .goalTypeFit: return "GOAL_TYPE_FIT"
      case .goalTypeFun: return "GOAL_TYPE_FUN"
      case .goalTypeLoseWeight: return "GOAL_TYPE_LOSE_WEIGHT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GoalType, rhs: GoalType) -> Bool {
    switch (lhs, rhs) {
      case (.goalTypeMuscle, .goalTypeMuscle): return true
      case (.goalTypeFit, .goalTypeFit): return true
      case (.goalTypeFun, .goalTypeFun): return true
      case (.goalTypeLoseWeight, .goalTypeLoseWeight): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GoalType] {
    return [
      .goalTypeMuscle,
      .goalTypeFit,
      .goalTypeFun,
      .goalTypeLoseWeight,
    ]
  }
}

public enum DoSportType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case doSportTypeRegular
  case doSportTypeNewbie
  case doSportTypeNot
  case doSportTypeProfessional
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "DO_SPORT_TYPE_REGULAR": self = .doSportTypeRegular
      case "DO_SPORT_TYPE_NEWBIE": self = .doSportTypeNewbie
      case "DO_SPORT_TYPE_NOT": self = .doSportTypeNot
      case "DO_SPORT_TYPE_PROFESSIONAL": self = .doSportTypeProfessional
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .doSportTypeRegular: return "DO_SPORT_TYPE_REGULAR"
      case .doSportTypeNewbie: return "DO_SPORT_TYPE_NEWBIE"
      case .doSportTypeNot: return "DO_SPORT_TYPE_NOT"
      case .doSportTypeProfessional: return "DO_SPORT_TYPE_PROFESSIONAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DoSportType, rhs: DoSportType) -> Bool {
    switch (lhs, rhs) {
      case (.doSportTypeRegular, .doSportTypeRegular): return true
      case (.doSportTypeNewbie, .doSportTypeNewbie): return true
      case (.doSportTypeNot, .doSportTypeNot): return true
      case (.doSportTypeProfessional, .doSportTypeProfessional): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DoSportType] {
    return [
      .doSportTypeRegular,
      .doSportTypeNewbie,
      .doSportTypeNot,
      .doSportTypeProfessional,
    ]
  }
}

public enum MeasureGrowth: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case measureGrowthTypeFt
  case measureGrowthTypeSm
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MEASURE_GROWTH_TYPE_FT": self = .measureGrowthTypeFt
      case "MEASURE_GROWTH_TYPE_SM": self = .measureGrowthTypeSm
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .measureGrowthTypeFt: return "MEASURE_GROWTH_TYPE_FT"
      case .measureGrowthTypeSm: return "MEASURE_GROWTH_TYPE_SM"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MeasureGrowth, rhs: MeasureGrowth) -> Bool {
    switch (lhs, rhs) {
      case (.measureGrowthTypeFt, .measureGrowthTypeFt): return true
      case (.measureGrowthTypeSm, .measureGrowthTypeSm): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MeasureGrowth] {
    return [
      .measureGrowthTypeFt,
      .measureGrowthTypeSm,
    ]
  }
}

public enum GenderType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case genderTypeMan
  case genderTypeWoman
  case genderTypeCommon
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GENDER_TYPE_MAN": self = .genderTypeMan
      case "GENDER_TYPE_WOMAN": self = .genderTypeWoman
      case "GENDER_TYPE_COMMON": self = .genderTypeCommon
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .genderTypeMan: return "GENDER_TYPE_MAN"
      case .genderTypeWoman: return "GENDER_TYPE_WOMAN"
      case .genderTypeCommon: return "GENDER_TYPE_COMMON"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GenderType, rhs: GenderType) -> Bool {
    switch (lhs, rhs) {
      case (.genderTypeMan, .genderTypeMan): return true
      case (.genderTypeWoman, .genderTypeWoman): return true
      case (.genderTypeCommon, .genderTypeCommon): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GenderType] {
    return [
      .genderTypeMan,
      .genderTypeWoman,
      .genderTypeCommon,
    ]
  }
}

public enum WorkoutDifficulty: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case workoutDifficultyTypeLight
  case workoutDifficultyTypeProfessional
  case workoutDifficultyTypeStrong
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "WORKOUT_DIFFICULTY_TYPE_LIGHT": self = .workoutDifficultyTypeLight
      case "WORKOUT_DIFFICULTY_TYPE_PROFESSIONAL": self = .workoutDifficultyTypeProfessional
      case "WORKOUT_DIFFICULTY_TYPE_STRONG": self = .workoutDifficultyTypeStrong
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .workoutDifficultyTypeLight: return "WORKOUT_DIFFICULTY_TYPE_LIGHT"
      case .workoutDifficultyTypeProfessional: return "WORKOUT_DIFFICULTY_TYPE_PROFESSIONAL"
      case .workoutDifficultyTypeStrong: return "WORKOUT_DIFFICULTY_TYPE_STRONG"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: WorkoutDifficulty, rhs: WorkoutDifficulty) -> Bool {
    switch (lhs, rhs) {
      case (.workoutDifficultyTypeLight, .workoutDifficultyTypeLight): return true
      case (.workoutDifficultyTypeProfessional, .workoutDifficultyTypeProfessional): return true
      case (.workoutDifficultyTypeStrong, .workoutDifficultyTypeStrong): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [WorkoutDifficulty] {
    return [
      .workoutDifficultyTypeLight,
      .workoutDifficultyTypeProfessional,
      .workoutDifficultyTypeStrong,
    ]
  }
}

public enum SourceEntityType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case sourceEntityTypeCarbs
  case sourceEntityTypeFats
  case sourceEntityTypeProteins
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "SOURCE_ENTITY_TYPE_CARBS": self = .sourceEntityTypeCarbs
      case "SOURCE_ENTITY_TYPE_FATS": self = .sourceEntityTypeFats
      case "SOURCE_ENTITY_TYPE_PROTEINS": self = .sourceEntityTypeProteins
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .sourceEntityTypeCarbs: return "SOURCE_ENTITY_TYPE_CARBS"
      case .sourceEntityTypeFats: return "SOURCE_ENTITY_TYPE_FATS"
      case .sourceEntityTypeProteins: return "SOURCE_ENTITY_TYPE_PROTEINS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: SourceEntityType, rhs: SourceEntityType) -> Bool {
    switch (lhs, rhs) {
      case (.sourceEntityTypeCarbs, .sourceEntityTypeCarbs): return true
      case (.sourceEntityTypeFats, .sourceEntityTypeFats): return true
      case (.sourceEntityTypeProteins, .sourceEntityTypeProteins): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SourceEntityType] {
    return [
      .sourceEntityTypeCarbs,
      .sourceEntityTypeFats,
      .sourceEntityTypeProteins,
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
  case mealTypeDinner
  case mealTypeLunch
  case mealTypeSnack
  case mealTypeBreakfast
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MEAL_TYPE_DINNER": self = .mealTypeDinner
      case "MEAL_TYPE_LUNCH": self = .mealTypeLunch
      case "MEAL_TYPE_SNACK": self = .mealTypeSnack
      case "MEAL_TYPE_BREAKFAST": self = .mealTypeBreakfast
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .mealTypeDinner: return "MEAL_TYPE_DINNER"
      case .mealTypeLunch: return "MEAL_TYPE_LUNCH"
      case .mealTypeSnack: return "MEAL_TYPE_SNACK"
      case .mealTypeBreakfast: return "MEAL_TYPE_BREAKFAST"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MealType, rhs: MealType) -> Bool {
    switch (lhs, rhs) {
      case (.mealTypeDinner, .mealTypeDinner): return true
      case (.mealTypeLunch, .mealTypeLunch): return true
      case (.mealTypeSnack, .mealTypeSnack): return true
      case (.mealTypeBreakfast, .mealTypeBreakfast): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MealType] {
    return [
      .mealTypeDinner,
      .mealTypeLunch,
      .mealTypeSnack,
      .mealTypeBreakfast,
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
        GraphQLField("login", arguments: ["record": GraphQLVariable("record")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
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
        GraphQLField("passwordForgotRequest", arguments: ["email": GraphQLVariable("email")], type: .nonNull(.object(PasswordForgotRequest.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(passwordForgotRequest: PasswordForgotRequest) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "passwordForgotRequest": passwordForgotRequest.resultMap])
    }

    /// Запрос отсылки письма с кодом восстановления пароля
    public var passwordForgotRequest: PasswordForgotRequest {
      get {
        return PasswordForgotRequest(unsafeResultMap: resultMap["passwordForgotRequest"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "passwordForgotRequest")
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
        GraphQLField("profileUpdate", arguments: ["record": GraphQLVariable("record")], type: .nonNull(.object(ProfileUpdate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profileUpdate: ProfileUpdate) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "profileUpdate": profileUpdate.resultMap])
    }

    /// Резолвер записи данных после анбординга
    public var profileUpdate: ProfileUpdate {
      get {
        return ProfileUpdate(unsafeResultMap: resultMap["profileUpdate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "profileUpdate")
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
          GraphQLField("energy", type: .scalar(Int.self)),
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
          GraphQLField("targetWeight", type: .scalar(Int.self)),
          GraphQLField("FoodGroup", type: .nonNull(.object(FoodGroup.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(age: Int? = nil, coins: Int? = nil, darkTheme: Bool? = nil, doSport: DoSportType? = nil, email: String? = nil, energy: Int? = nil, fitnessPreference: WorkoutDifficulty? = nil, gender: GenderType? = nil, goal: GoalType? = nil, growth: Int? = nil, id: GraphQLID? = nil, name: String? = nil, notifications: Bool? = nil, reminders: Bool? = nil, showOnBoarding: Bool? = nil, weight: Double? = nil, targetWeight: Int? = nil, foodGroup: FoodGroup) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "age": age, "coins": coins, "darkTheme": darkTheme, "doSport": doSport, "email": email, "energy": energy, "fitnessPreference": fitnessPreference, "gender": gender, "goal": goal, "growth": growth, "id": id, "name": name, "notifications": notifications, "reminders": reminders, "showOnBoarding": showOnBoarding, "weight": weight, "targetWeight": targetWeight, "FoodGroup": foodGroup.resultMap])
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

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
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

      public var targetWeight: Int? {
        get {
          return resultMap["targetWeight"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "targetWeight")
        }
      }

      public var foodGroup: FoodGroup {
        get {
          return FoodGroup(unsafeResultMap: resultMap["FoodGroup"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "FoodGroup")
        }
      }

      public struct FoodGroup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FoodGroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Image", type: .object(Image.selections)),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: Image? = nil, id: GraphQLID? = nil, name: String? = nil) {
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
          GraphQLField("Calories", type: .nonNull(.list(.nonNull(.object(Calory.selections))))),
          GraphQLField("target", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(calories: [Calory], target: Int) {
        self.init(unsafeResultMap: ["__typename": "CaloriesWidget", "Calories": calories.map { (value: Calory) -> ResultMap in value.resultMap }, "target": target])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var calories: [Calory] {
        get {
          return (resultMap["Calories"] as! [ResultMap]).map { (value: ResultMap) -> Calory in Calory(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Calory) -> ResultMap in value.resultMap }, forKey: "Calories")
        }
      }

      public var target: Int {
        get {
          return resultMap["target"]! as! Int
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
            GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amount: Int, createdAt: String) {
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

        public var amount: Int {
          get {
            return resultMap["amount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
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
        GraphQLField("drinkWidget", arguments: ["date": GraphQLVariable("date")], type: .nonNull(.object(DrinkWidget.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(drinkWidget: DrinkWidget) {
      self.init(unsafeResultMap: ["__typename": "Query", "drinkWidget": drinkWidget.resultMap])
    }

    /// Получение данных по виджету drink
    public var drinkWidget: DrinkWidget {
      get {
        return DrinkWidget(unsafeResultMap: resultMap["drinkWidget"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "drinkWidget")
      }
    }

    public struct DrinkWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DrinkWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("doneCups", type: .scalar(Int.self)),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("left", type: .scalar(Int.self)),
          GraphQLField("totalCups", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(doneCups: Int? = nil, energy: Int? = nil, energyTotal: Int? = nil, `left`: Int? = nil, totalCups: Int? = nil) {
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
        GraphQLField("foodGroups", type: .nonNull(.list(.nonNull(.object(FoodGroup.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(foodGroups: [FoodGroup]) {
      self.init(unsafeResultMap: ["__typename": "Query", "foodGroups": foodGroups.map { (value: FoodGroup) -> ResultMap in value.resultMap }])
    }

    public var foodGroups: [FoodGroup] {
      get {
        return (resultMap["foodGroups"] as! [ResultMap]).map { (value: ResultMap) -> FoodGroup in FoodGroup(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FoodGroup) -> ResultMap in value.resultMap }, forKey: "foodGroups")
      }
    }

    public struct FoodGroup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FoodGroup"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .object(Image.selections)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image? = nil, id: GraphQLID? = nil, name: String? = nil) {
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
        GraphQLField("me", type: .nonNull(.object(Me.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.resultMap])
    }

    /// me - это структура описывающая профайл текущего пользователя и все его "состояния"
    public var me: Me {
      get {
        return Me(unsafeResultMap: resultMap["me"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "me")
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
          GraphQLField("energy", type: .scalar(Int.self)),
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
          GraphQLField("targetWeight", type: .scalar(Int.self)),
          GraphQLField("FoodGroup", type: .nonNull(.object(FoodGroup.selections))),
          GraphQLField("Avatar", type: .object(Avatar.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(age: Int? = nil, coins: Int? = nil, darkTheme: Bool? = nil, doSport: DoSportType? = nil, email: String? = nil, energy: Int? = nil, fitnessPreference: WorkoutDifficulty? = nil, gender: GenderType? = nil, goal: GoalType? = nil, growth: Int? = nil, id: GraphQLID? = nil, name: String? = nil, notifications: Bool? = nil, reminders: Bool? = nil, showOnBoarding: Bool? = nil, weight: Double? = nil, targetWeight: Int? = nil, foodGroup: FoodGroup, avatar: Avatar? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "age": age, "coins": coins, "darkTheme": darkTheme, "doSport": doSport, "email": email, "energy": energy, "fitnessPreference": fitnessPreference, "gender": gender, "goal": goal, "growth": growth, "id": id, "name": name, "notifications": notifications, "reminders": reminders, "showOnBoarding": showOnBoarding, "weight": weight, "targetWeight": targetWeight, "FoodGroup": foodGroup.resultMap, "Avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
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

      public var energy: Int? {
        get {
          return resultMap["energy"] as? Int
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

      public var targetWeight: Int? {
        get {
          return resultMap["targetWeight"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "targetWeight")
        }
      }

      public var foodGroup: FoodGroup {
        get {
          return FoodGroup(unsafeResultMap: resultMap["FoodGroup"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "FoodGroup")
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

      public struct FoodGroup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FoodGroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Image", type: .object(Image.selections)),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: Image? = nil, id: GraphQLID? = nil, name: String? = nil) {
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
        meals {
          __typename
          eatenAt
          id
          products {
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
          type
        }
        sources {
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
        GraphQLField("mealsWidget", arguments: ["date": GraphQLVariable("date")], type: .nonNull(.object(MealsWidget.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mealsWidget: MealsWidget) {
      self.init(unsafeResultMap: ["__typename": "Query", "mealsWidget": mealsWidget.resultMap])
    }

    /// Получение данных по виджету meals
    public var mealsWidget: MealsWidget {
      get {
        return MealsWidget(unsafeResultMap: resultMap["mealsWidget"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "mealsWidget")
      }
    }

    public struct MealsWidget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MealsWidget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("energyTotal", type: .scalar(Int.self)),
          GraphQLField("meals", type: .list(.object(Meal.selections))),
          GraphQLField("sources", type: .list(.object(Source.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(energy: Int? = nil, energyTotal: Int? = nil, meals: [Meal?]? = nil, sources: [Source?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MealsWidget", "energy": energy, "energyTotal": energyTotal, "meals": meals.flatMap { (value: [Meal?]) -> [ResultMap?] in value.map { (value: Meal?) -> ResultMap? in value.flatMap { (value: Meal) -> ResultMap in value.resultMap } } }, "sources": sources.flatMap { (value: [Source?]) -> [ResultMap?] in value.map { (value: Source?) -> ResultMap? in value.flatMap { (value: Source) -> ResultMap in value.resultMap } } }])
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

      public var meals: [Meal?]? {
        get {
          return (resultMap["meals"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Meal?] in value.map { (value: ResultMap?) -> Meal? in value.flatMap { (value: ResultMap) -> Meal in Meal(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Meal?]) -> [ResultMap?] in value.map { (value: Meal?) -> ResultMap? in value.flatMap { (value: Meal) -> ResultMap in value.resultMap } } }, forKey: "meals")
        }
      }

      public var sources: [Source?]? {
        get {
          return (resultMap["sources"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Source?] in value.map { (value: ResultMap?) -> Source? in value.flatMap { (value: ResultMap) -> Source in Source(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Source?]) -> [ResultMap?] in value.map { (value: Source?) -> ResultMap? in value.flatMap { (value: Source) -> ResultMap in value.resultMap } } }, forKey: "sources")
        }
      }

      public struct Meal: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Meal"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("eatenAt", type: .scalar(String.self)),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("products", type: .list(.object(Product.selections))),
            GraphQLField("type", type: .scalar(MealType.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(eatenAt: String? = nil, id: GraphQLID? = nil, products: [Product?]? = nil, type: MealType? = nil) {
          self.init(unsafeResultMap: ["__typename": "Meal", "eatenAt": eatenAt, "id": id, "products": products.flatMap { (value: [Product?]) -> [ResultMap?] in value.map { (value: Product?) -> ResultMap? in value.flatMap { (value: Product) -> ResultMap in value.resultMap } } }, "type": type])
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
            return (resultMap["products"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Product?] in value.map { (value: ResultMap?) -> Product? in value.flatMap { (value: ResultMap) -> Product in Product(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Product?]) -> [ResultMap?] in value.map { (value: Product?) -> ResultMap? in value.flatMap { (value: Product) -> ResultMap in value.resultMap } } }, forKey: "products")
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
          public static let possibleTypes: [String] = ["Product"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("Image", type: .nonNull(.object(Image.selections))),
              GraphQLField("ProductSources", type: .nonNull(.list(.object(ProductSource.selections)))),
              GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("isToggled", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("measure", type: .nonNull(.scalar(ProductMeasure.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(image: Image, productSources: [ProductSource?], amount: Int, id: GraphQLID, isToggled: Bool, measure: ProductMeasure, name: String) {
            self.init(unsafeResultMap: ["__typename": "Product", "Image": image.resultMap, "ProductSources": productSources.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var image: Image {
            get {
              return Image(unsafeResultMap: resultMap["Image"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "Image")
            }
          }

          public var productSources: [ProductSource?] {
            get {
              return (resultMap["ProductSources"] as! [ResultMap?]).map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, forKey: "ProductSources")
            }
          }

          public var amount: Int {
            get {
              return resultMap["amount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var isToggled: Bool {
            get {
              return resultMap["isToggled"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isToggled")
            }
          }

          public var measure: ProductMeasure {
            get {
              return resultMap["measure"]! as! ProductMeasure
            }
            set {
              resultMap.updateValue(newValue, forKey: "measure")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
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
        GraphQLField("moods", arguments: ["from": GraphQLVariable("from"), "to": GraphQLVariable("to")], type: .nonNull(.list(.nonNull(.object(Mood.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(moods: [Mood]) {
      self.init(unsafeResultMap: ["__typename": "Query", "moods": moods.map { (value: Mood) -> ResultMap in value.resultMap }])
    }

    public var moods: [Mood] {
      get {
        return (resultMap["moods"] as! [ResultMap]).map { (value: ResultMap) -> Mood in Mood(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Mood) -> ResultMap in value.resultMap }, forKey: "moods")
      }
    }

    public struct Mood: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mood"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("mood", type: .nonNull(.scalar(MoodType.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createdAt: String, mood: MoodType) {
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

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var mood: MoodType {
        get {
          return resultMap["mood"]! as! MoodType
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
        GraphQLField("muscles", arguments: ["onlyToggled": GraphQLVariable("onlyToggled")], type: .nonNull(.list(.nonNull(.object(Muscle.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(muscles: [Muscle]) {
      self.init(unsafeResultMap: ["__typename": "Query", "muscles": muscles.map { (value: Muscle) -> ResultMap in value.resultMap }])
    }

    /// Получение состояния виджета указания текущего веса
    /// 
    /// Получение списка всех групп мышц
    public var muscles: [Muscle] {
      get {
        return (resultMap["muscles"] as! [ResultMap]).map { (value: ResultMap) -> Muscle in Muscle(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Muscle) -> ResultMap in value.resultMap }, forKey: "muscles")
      }
    }

    public struct Muscle: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Muscle"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("isToggled", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, isToggled: Bool, name: String) {
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

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool {
        get {
          return resultMap["isToggled"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
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
    query Products($search: String, $foodGroupId: String!, $sourceIds: [Int], $onlyToggled: Boolean) {
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
  public var foodGroupId: String
  public var sourceIds: [Int?]?
  public var onlyToggled: Bool?

  public init(search: String? = nil, foodGroupId: String, sourceIds: [Int?]? = nil, onlyToggled: Bool? = nil) {
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
        GraphQLField("products", arguments: ["search": GraphQLVariable("search"), "foodGroupId": GraphQLVariable("foodGroupId"), "sourceIds": GraphQLVariable("sourceIds"), "onlyToggled": GraphQLVariable("onlyToggled")], type: .nonNull(.list(.nonNull(.object(Product.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: [Product]) {
      self.init(unsafeResultMap: ["__typename": "Query", "products": products.map { (value: Product) -> ResultMap in value.resultMap }])
    }

    public var products: [Product] {
      get {
        return (resultMap["products"] as! [ResultMap]).map { (value: ResultMap) -> Product in Product(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Product) -> ResultMap in value.resultMap }, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .nonNull(.object(Image.selections))),
          GraphQLField("ProductSources", type: .nonNull(.list(.object(ProductSource.selections)))),
          GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("isToggled", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("measure", type: .nonNull(.scalar(ProductMeasure.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image, productSources: [ProductSource?], amount: Int, id: GraphQLID, isToggled: Bool, measure: ProductMeasure, name: String) {
        self.init(unsafeResultMap: ["__typename": "Product", "Image": image.resultMap, "ProductSources": productSources.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image {
        get {
          return Image(unsafeResultMap: resultMap["Image"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "Image")
        }
      }

      public var productSources: [ProductSource?] {
        get {
          return (resultMap["ProductSources"] as! [ResultMap?]).map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, forKey: "ProductSources")
        }
      }

      public var amount: Int {
        get {
          return resultMap["amount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool {
        get {
          return resultMap["isToggled"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var measure: ProductMeasure {
        get {
          return resultMap["measure"]! as! ProductMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
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
        GraphQLField("productsByMeal", arguments: ["mealId": GraphQLVariable("mealId")], type: .nonNull(.list(.nonNull(.object(ProductsByMeal.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(productsByMeal: [ProductsByMeal]) {
      self.init(unsafeResultMap: ["__typename": "Query", "productsByMeal": productsByMeal.map { (value: ProductsByMeal) -> ResultMap in value.resultMap }])
    }

    public var productsByMeal: [ProductsByMeal] {
      get {
        return (resultMap["productsByMeal"] as! [ResultMap]).map { (value: ResultMap) -> ProductsByMeal in ProductsByMeal(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: ProductsByMeal) -> ResultMap in value.resultMap }, forKey: "productsByMeal")
      }
    }

    public struct ProductsByMeal: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .nonNull(.object(Image.selections))),
          GraphQLField("ProductSources", type: .nonNull(.list(.object(ProductSource.selections)))),
          GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("isToggled", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("measure", type: .nonNull(.scalar(ProductMeasure.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image, productSources: [ProductSource?], amount: Int, id: GraphQLID, isToggled: Bool, measure: ProductMeasure, name: String) {
        self.init(unsafeResultMap: ["__typename": "Product", "Image": image.resultMap, "ProductSources": productSources.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image {
        get {
          return Image(unsafeResultMap: resultMap["Image"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "Image")
        }
      }

      public var productSources: [ProductSource?] {
        get {
          return (resultMap["ProductSources"] as! [ResultMap?]).map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, forKey: "ProductSources")
        }
      }

      public var amount: Int {
        get {
          return resultMap["amount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool {
        get {
          return resultMap["isToggled"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var measure: ProductMeasure {
        get {
          return resultMap["measure"]! as! ProductMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
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
        date
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
        GraphQLField("progresses", arguments: ["from": GraphQLVariable("from"), "to": GraphQLVariable("to")], type: .nonNull(.list(.nonNull(.object(Progress.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(progresses: [Progress]) {
      self.init(unsafeResultMap: ["__typename": "Query", "progresses": progresses.map { (value: Progress) -> ResultMap in value.resultMap }])
    }

    public var progresses: [Progress] {
      get {
        return (resultMap["progresses"] as! [ResultMap]).map { (value: ResultMap) -> Progress in Progress(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Progress) -> ResultMap in value.resultMap }, forKey: "progresses")
      }
    }

    public struct Progress: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Progress"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("progress", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(date: String, progress: Int) {
        self.init(unsafeResultMap: ["__typename": "Progress", "date": date, "progress": progress])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var date: String {
        get {
          return resultMap["date"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var progress: Int {
        get {
          return resultMap["progress"]! as! Int
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
        GraphQLField("recentProducts", type: .nonNull(.list(.nonNull(.object(RecentProduct.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recentProducts: [RecentProduct]) {
      self.init(unsafeResultMap: ["__typename": "Query", "recentProducts": recentProducts.map { (value: RecentProduct) -> ResultMap in value.resultMap }])
    }

    public var recentProducts: [RecentProduct] {
      get {
        return (resultMap["recentProducts"] as! [ResultMap]).map { (value: ResultMap) -> RecentProduct in RecentProduct(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: RecentProduct) -> ResultMap in value.resultMap }, forKey: "recentProducts")
      }
    }

    public struct RecentProduct: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .nonNull(.object(Image.selections))),
          GraphQLField("ProductSources", type: .nonNull(.list(.object(ProductSource.selections)))),
          GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("isToggled", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("measure", type: .nonNull(.scalar(ProductMeasure.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image, productSources: [ProductSource?], amount: Int, id: GraphQLID, isToggled: Bool, measure: ProductMeasure, name: String) {
        self.init(unsafeResultMap: ["__typename": "Product", "Image": image.resultMap, "ProductSources": productSources.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image {
        get {
          return Image(unsafeResultMap: resultMap["Image"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "Image")
        }
      }

      public var productSources: [ProductSource?] {
        get {
          return (resultMap["ProductSources"] as! [ResultMap?]).map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, forKey: "ProductSources")
        }
      }

      public var amount: Int {
        get {
          return resultMap["amount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool {
        get {
          return resultMap["isToggled"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var measure: ProductMeasure {
        get {
          return resultMap["measure"]! as! ProductMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
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
        GraphQLField("recommendProducts", arguments: ["mealType": GraphQLVariable("mealType")], type: .nonNull(.list(.nonNull(.object(RecommendProduct.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(recommendProducts: [RecommendProduct]) {
      self.init(unsafeResultMap: ["__typename": "Query", "recommendProducts": recommendProducts.map { (value: RecommendProduct) -> ResultMap in value.resultMap }])
    }

    public var recommendProducts: [RecommendProduct] {
      get {
        return (resultMap["recommendProducts"] as! [ResultMap]).map { (value: ResultMap) -> RecommendProduct in RecommendProduct(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: RecommendProduct) -> ResultMap in value.resultMap }, forKey: "recommendProducts")
      }
    }

    public struct RecommendProduct: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Image", type: .nonNull(.object(Image.selections))),
          GraphQLField("ProductSources", type: .nonNull(.list(.object(ProductSource.selections)))),
          GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("isToggled", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("measure", type: .nonNull(.scalar(ProductMeasure.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image, productSources: [ProductSource?], amount: Int, id: GraphQLID, isToggled: Bool, measure: ProductMeasure, name: String) {
        self.init(unsafeResultMap: ["__typename": "Product", "Image": image.resultMap, "ProductSources": productSources.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, "amount": amount, "id": id, "isToggled": isToggled, "measure": measure, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image {
        get {
          return Image(unsafeResultMap: resultMap["Image"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "Image")
        }
      }

      public var productSources: [ProductSource?] {
        get {
          return (resultMap["ProductSources"] as! [ResultMap?]).map { (value: ResultMap?) -> ProductSource? in value.flatMap { (value: ResultMap) -> ProductSource in ProductSource(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: ProductSource?) -> ResultMap? in value.flatMap { (value: ProductSource) -> ResultMap in value.resultMap } }, forKey: "ProductSources")
        }
      }

      public var amount: Int {
        get {
          return resultMap["amount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var isToggled: Bool {
        get {
          return resultMap["isToggled"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isToggled")
        }
      }

      public var measure: ProductMeasure {
        get {
          return resultMap["measure"]! as! ProductMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
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
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(energy: Int? = nil, energyTotal: Int? = nil, measure: WeightMeasure? = nil, targetWeight: Double? = nil, weight: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "SaveWeightWidget", "energy": energy, "energyTotal": energyTotal, "measure": measure, "targetWeight": targetWeight, "weight": weight])
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
        GraphQLField("sourcesByMeal", arguments: ["mealId": GraphQLVariable("mealId")], type: .nonNull(.list(.nonNull(.object(SourcesByMeal.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sourcesByMeal: [SourcesByMeal]) {
      self.init(unsafeResultMap: ["__typename": "Query", "sourcesByMeal": sourcesByMeal.map { (value: SourcesByMeal) -> ResultMap in value.resultMap }])
    }

    public var sourcesByMeal: [SourcesByMeal] {
      get {
        return (resultMap["sourcesByMeal"] as! [ResultMap]).map { (value: ResultMap) -> SourcesByMeal in SourcesByMeal(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SourcesByMeal) -> ResultMap in value.resultMap }, forKey: "sourcesByMeal")
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

public final class ProgressQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Progress {
      progress {
        __typename
        date
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
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("progress", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(date: String, progress: Int) {
        self.init(unsafeResultMap: ["__typename": "Progress", "date": date, "progress": progress])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var date: String {
        get {
          return resultMap["date"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var progress: Int {
        get {
          return resultMap["progress"]! as! Int
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
    query ToggleMuscleInWorkouts($muscleIds: [String!]!) {
      toggleMuscleInWorkouts(muscleIds: $muscleIds)
    }
    """

  public let operationName: String = "ToggleMuscleInWorkouts"

  public var muscleIds: [String]

  public init(muscleIds: [String]) {
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
          GraphQLField("Weights", type: .nonNull(.list(.nonNull(.object(Weight.selections))))),
          GraphQLField("measure", type: .nonNull(.scalar(WeightMeasure.self))),
          GraphQLField("targetWeight", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(weights: [Weight], measure: WeightMeasure, targetWeight: Double) {
        self.init(unsafeResultMap: ["__typename": "WeightsWidget", "Weights": weights.map { (value: Weight) -> ResultMap in value.resultMap }, "measure": measure, "targetWeight": targetWeight])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var weights: [Weight] {
        get {
          return (resultMap["Weights"] as! [ResultMap]).map { (value: ResultMap) -> Weight in Weight(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Weight) -> ResultMap in value.resultMap }, forKey: "Weights")
        }
      }

      public var measure: WeightMeasure {
        get {
          return resultMap["measure"]! as! WeightMeasure
        }
        set {
          resultMap.updateValue(newValue, forKey: "measure")
        }
      }

      public var targetWeight: Double {
        get {
          return resultMap["targetWeight"]! as! Double
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
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("weight", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(createdAt: String, weight: Double) {
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

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var weight: Double {
          get {
            return resultMap["weight"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "weight")
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
        GraphQLField("workoutTypes", type: .nonNull(.list(.nonNull(.object(WorkoutType.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutTypes: [WorkoutType]) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutTypes": workoutTypes.map { (value: WorkoutType) -> ResultMap in value.resultMap }])
    }

    public var workoutTypes: [WorkoutType] {
      get {
        return (resultMap["workoutTypes"] as! [ResultMap]).map { (value: ResultMap) -> WorkoutType in WorkoutType(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: WorkoutType) -> ResultMap in value.resultMap }, forKey: "workoutTypes")
      }
    }

    public struct WorkoutType: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
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

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}
