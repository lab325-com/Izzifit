// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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
  case authTypeUdid
  case authTypeApple
  case authTypeEmail
  case authTypeFacebook
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AUTH_TYPE_UDID": self = .authTypeUdid
      case "AUTH_TYPE_APPLE": self = .authTypeApple
      case "AUTH_TYPE_EMAIL": self = .authTypeEmail
      case "AUTH_TYPE_FACEBOOK": self = .authTypeFacebook
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .authTypeUdid: return "AUTH_TYPE_UDID"
      case .authTypeApple: return "AUTH_TYPE_APPLE"
      case .authTypeEmail: return "AUTH_TYPE_EMAIL"
      case .authTypeFacebook: return "AUTH_TYPE_FACEBOOK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AuthType, rhs: AuthType) -> Bool {
    switch (lhs, rhs) {
      case (.authTypeUdid, .authTypeUdid): return true
      case (.authTypeApple, .authTypeApple): return true
      case (.authTypeEmail, .authTypeEmail): return true
      case (.authTypeFacebook, .authTypeFacebook): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AuthType] {
    return [
      .authTypeUdid,
      .authTypeApple,
      .authTypeEmail,
      .authTypeFacebook,
    ]
  }
}

public struct ProfileUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - goal
  ///   - gender
  ///   - darkTheme
  ///   - doSport
  ///   - fitnessPreference
  ///   - weightMeasure
  ///   - growth
  ///   - targetWeight
  ///   - foodGroupId
  ///   - reminders
  ///   - targetWeightMeasure
  ///   - growthMeasure
  ///   - notifications
  ///   - age
  ///   - weight
  ///   - email
  ///   - name
  public init(goal: Swift.Optional<GoalType?> = nil, gender: Swift.Optional<GenderType?> = nil, darkTheme: Swift.Optional<Bool?> = nil, doSport: Swift.Optional<DoSportType?> = nil, fitnessPreference: Swift.Optional<FitnessPreferenceType?> = nil, weightMeasure: Swift.Optional<MeasureWeight?> = nil, growth: Swift.Optional<Int?> = nil, targetWeight: Swift.Optional<Double?> = nil, foodGroupId: Swift.Optional<String?> = nil, reminders: Swift.Optional<Bool?> = nil, targetWeightMeasure: Swift.Optional<MeasureWeight?> = nil, growthMeasure: Swift.Optional<MeasureGrowth?> = nil, notifications: Swift.Optional<Bool?> = nil, age: Swift.Optional<Int?> = nil, weight: Swift.Optional<Double?> = nil, email: Swift.Optional<String?> = nil, name: Swift.Optional<String?> = nil) {
    graphQLMap = ["goal": goal, "gender": gender, "darkTheme": darkTheme, "doSport": doSport, "fitnessPreference": fitnessPreference, "weightMeasure": weightMeasure, "growth": growth, "targetWeight": targetWeight, "foodGroupId": foodGroupId, "reminders": reminders, "targetWeightMeasure": targetWeightMeasure, "growthMeasure": growthMeasure, "notifications": notifications, "age": age, "weight": weight, "email": email, "name": name]
  }

  public var goal: Swift.Optional<GoalType?> {
    get {
      return graphQLMap["goal"] as? Swift.Optional<GoalType?> ?? Swift.Optional<GoalType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "goal")
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

  public var darkTheme: Swift.Optional<Bool?> {
    get {
      return graphQLMap["darkTheme"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "darkTheme")
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

  public var fitnessPreference: Swift.Optional<FitnessPreferenceType?> {
    get {
      return graphQLMap["fitnessPreference"] as? Swift.Optional<FitnessPreferenceType?> ?? Swift.Optional<FitnessPreferenceType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fitnessPreference")
    }
  }

  public var weightMeasure: Swift.Optional<MeasureWeight?> {
    get {
      return graphQLMap["weightMeasure"] as? Swift.Optional<MeasureWeight?> ?? Swift.Optional<MeasureWeight?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weightMeasure")
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

  public var targetWeight: Swift.Optional<Double?> {
    get {
      return graphQLMap["targetWeight"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "targetWeight")
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

  public var reminders: Swift.Optional<Bool?> {
    get {
      return graphQLMap["reminders"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "reminders")
    }
  }

  public var targetWeightMeasure: Swift.Optional<MeasureWeight?> {
    get {
      return graphQLMap["targetWeightMeasure"] as? Swift.Optional<MeasureWeight?> ?? Swift.Optional<MeasureWeight?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "targetWeightMeasure")
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

  public var notifications: Swift.Optional<Bool?> {
    get {
      return graphQLMap["notifications"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notifications")
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

  public var weight: Swift.Optional<Double?> {
    get {
      return graphQLMap["weight"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight")
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

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }
}

public enum GoalType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case goalTypeFit
  case goalTypeFun
  case goalTypeLoseWeight
  case goalTypeMuscle
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GOAL_TYPE_FIT": self = .goalTypeFit
      case "GOAL_TYPE_FUN": self = .goalTypeFun
      case "GOAL_TYPE_LOSE_WEIGHT": self = .goalTypeLoseWeight
      case "GOAL_TYPE_MUSCLE": self = .goalTypeMuscle
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .goalTypeFit: return "GOAL_TYPE_FIT"
      case .goalTypeFun: return "GOAL_TYPE_FUN"
      case .goalTypeLoseWeight: return "GOAL_TYPE_LOSE_WEIGHT"
      case .goalTypeMuscle: return "GOAL_TYPE_MUSCLE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GoalType, rhs: GoalType) -> Bool {
    switch (lhs, rhs) {
      case (.goalTypeFit, .goalTypeFit): return true
      case (.goalTypeFun, .goalTypeFun): return true
      case (.goalTypeLoseWeight, .goalTypeLoseWeight): return true
      case (.goalTypeMuscle, .goalTypeMuscle): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GoalType] {
    return [
      .goalTypeFit,
      .goalTypeFun,
      .goalTypeLoseWeight,
      .goalTypeMuscle,
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

public enum DoSportType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case doSportTypeNewbie
  case doSportTypeNot
  case doSportTypeProfessional
  case doSportTypeRegular
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "DO_SPORT_TYPE_NEWBIE": self = .doSportTypeNewbie
      case "DO_SPORT_TYPE_NOT": self = .doSportTypeNot
      case "DO_SPORT_TYPE_PROFESSIONAL": self = .doSportTypeProfessional
      case "DO_SPORT_TYPE_REGULAR": self = .doSportTypeRegular
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .doSportTypeNewbie: return "DO_SPORT_TYPE_NEWBIE"
      case .doSportTypeNot: return "DO_SPORT_TYPE_NOT"
      case .doSportTypeProfessional: return "DO_SPORT_TYPE_PROFESSIONAL"
      case .doSportTypeRegular: return "DO_SPORT_TYPE_REGULAR"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DoSportType, rhs: DoSportType) -> Bool {
    switch (lhs, rhs) {
      case (.doSportTypeNewbie, .doSportTypeNewbie): return true
      case (.doSportTypeNot, .doSportTypeNot): return true
      case (.doSportTypeProfessional, .doSportTypeProfessional): return true
      case (.doSportTypeRegular, .doSportTypeRegular): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DoSportType] {
    return [
      .doSportTypeNewbie,
      .doSportTypeNot,
      .doSportTypeProfessional,
      .doSportTypeRegular,
    ]
  }
}

public enum FitnessPreferenceType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case fitnessPreferenceTypeProfessional
  case fitnessPreferenceTypeStrong
  case fitnessPreferenceTypeLight
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "FITNESS_PREFERENCE_TYPE_PROFESSIONAL": self = .fitnessPreferenceTypeProfessional
      case "FITNESS_PREFERENCE_TYPE_STRONG": self = .fitnessPreferenceTypeStrong
      case "FITNESS_PREFERENCE_TYPE_LIGHT": self = .fitnessPreferenceTypeLight
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .fitnessPreferenceTypeProfessional: return "FITNESS_PREFERENCE_TYPE_PROFESSIONAL"
      case .fitnessPreferenceTypeStrong: return "FITNESS_PREFERENCE_TYPE_STRONG"
      case .fitnessPreferenceTypeLight: return "FITNESS_PREFERENCE_TYPE_LIGHT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: FitnessPreferenceType, rhs: FitnessPreferenceType) -> Bool {
    switch (lhs, rhs) {
      case (.fitnessPreferenceTypeProfessional, .fitnessPreferenceTypeProfessional): return true
      case (.fitnessPreferenceTypeStrong, .fitnessPreferenceTypeStrong): return true
      case (.fitnessPreferenceTypeLight, .fitnessPreferenceTypeLight): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [FitnessPreferenceType] {
    return [
      .fitnessPreferenceTypeProfessional,
      .fitnessPreferenceTypeStrong,
      .fitnessPreferenceTypeLight,
    ]
  }
}

public enum MeasureWeight: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case measureWeightTypeKg
  case measureWeightTypeLb
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MEASURE_WEIGHT_TYPE_KG": self = .measureWeightTypeKg
      case "MEASURE_WEIGHT_TYPE_LB": self = .measureWeightTypeLb
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .measureWeightTypeKg: return "MEASURE_WEIGHT_TYPE_KG"
      case .measureWeightTypeLb: return "MEASURE_WEIGHT_TYPE_LB"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MeasureWeight, rhs: MeasureWeight) -> Bool {
    switch (lhs, rhs) {
      case (.measureWeightTypeKg, .measureWeightTypeKg): return true
      case (.measureWeightTypeLb, .measureWeightTypeLb): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MeasureWeight] {
    return [
      .measureWeightTypeKg,
      .measureWeightTypeLb,
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
        id
        isToggled
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
        self.init(unsafeResultMap: ["__typename": "Product", "id": id, "isToggled": isToggled, "name": name])
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
