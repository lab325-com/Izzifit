// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct LoginRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - udid
  ///   - email
  ///   - password
  ///   - authType
  ///   - token
  public init(udid: Swift.Optional<String?> = nil, email: Swift.Optional<String?> = nil, password: Swift.Optional<String?> = nil, authType: Swift.Optional<AuthType?> = nil, token: Swift.Optional<String?> = nil) {
    graphQLMap = ["udid": udid, "email": email, "password": password, "authType": authType, "token": token]
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

  public var token: Swift.Optional<String?> {
    get {
      return graphQLMap["token"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }
}

public enum AuthType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case authTypeApple
  case authTypeEmail
  case authTypeFacebook
  case authTypeUdid
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AUTH_TYPE_APPLE": self = .authTypeApple
      case "AUTH_TYPE_EMAIL": self = .authTypeEmail
      case "AUTH_TYPE_FACEBOOK": self = .authTypeFacebook
      case "AUTH_TYPE_UDID": self = .authTypeUdid
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .authTypeApple: return "AUTH_TYPE_APPLE"
      case .authTypeEmail: return "AUTH_TYPE_EMAIL"
      case .authTypeFacebook: return "AUTH_TYPE_FACEBOOK"
      case .authTypeUdid: return "AUTH_TYPE_UDID"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AuthType, rhs: AuthType) -> Bool {
    switch (lhs, rhs) {
      case (.authTypeApple, .authTypeApple): return true
      case (.authTypeEmail, .authTypeEmail): return true
      case (.authTypeFacebook, .authTypeFacebook): return true
      case (.authTypeUdid, .authTypeUdid): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AuthType] {
    return [
      .authTypeApple,
      .authTypeEmail,
      .authTypeFacebook,
      .authTypeUdid,
    ]
  }
}

public struct ProfileUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - darkTheme
  ///   - growthMeasure
  ///   - foodGroupId
  ///   - fitnessPreference
  ///   - targetWeight
  ///   - gender
  ///   - email
  ///   - age
  ///   - weight
  ///   - growth
  ///   - weightMeasure
  ///   - targetWeightMeasure
  ///   - goal
  ///   - doSport
  ///   - notifications
  ///   - reminders
  public init(darkTheme: Swift.Optional<Bool?> = nil, growthMeasure: Swift.Optional<MeasureGrowth?> = nil, foodGroupId: Swift.Optional<Int?> = nil, fitnessPreference: Swift.Optional<FitnessPreferenceType?> = nil, targetWeight: Swift.Optional<Double?> = nil, gender: Swift.Optional<GenderType?> = nil, email: Swift.Optional<String?> = nil, age: Swift.Optional<Int?> = nil, weight: Swift.Optional<Double?> = nil, growth: Swift.Optional<Int?> = nil, weightMeasure: Swift.Optional<MeasureWeight?> = nil, targetWeightMeasure: Swift.Optional<MeasureWeight?> = nil, goal: Swift.Optional<GoalType?> = nil, doSport: Swift.Optional<DoSportType?> = nil, notifications: Swift.Optional<Bool?> = nil, reminders: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["darkTheme": darkTheme, "growthMeasure": growthMeasure, "foodGroupId": foodGroupId, "fitnessPreference": fitnessPreference, "targetWeight": targetWeight, "gender": gender, "email": email, "age": age, "weight": weight, "growth": growth, "weightMeasure": weightMeasure, "targetWeightMeasure": targetWeightMeasure, "goal": goal, "doSport": doSport, "notifications": notifications, "reminders": reminders]
  }

  public var darkTheme: Swift.Optional<Bool?> {
    get {
      return graphQLMap["darkTheme"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "darkTheme")
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

  public var foodGroupId: Swift.Optional<Int?> {
    get {
      return graphQLMap["foodGroupId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
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

  public var targetWeight: Swift.Optional<Double?> {
    get {
      return graphQLMap["targetWeight"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "targetWeight")
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

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
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

  public var growth: Swift.Optional<Int?> {
    get {
      return graphQLMap["growth"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "growth")
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

  public var targetWeightMeasure: Swift.Optional<MeasureWeight?> {
    get {
      return graphQLMap["targetWeightMeasure"] as? Swift.Optional<MeasureWeight?> ?? Swift.Optional<MeasureWeight?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "targetWeightMeasure")
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

  public var notifications: Swift.Optional<Bool?> {
    get {
      return graphQLMap["notifications"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notifications")
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

public final class ProfileUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ProfileUpdate($record: ProfileUpdateInput!) {
      profileUpdate(record: $record) {
        __typename
        Rank {
          __typename
          countryPosition
          globalPosition
          level
          rank
        }
        age
        coins
        darkTheme
        doSport
        email
        energy
        fitnessPreference
        foodGroupId
        gender
        goal
        growth
        id
        name
        notifications
        reminders
        showOnBoarding
        weight
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

    /// Резолвер записи данных после анбординга
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
          GraphQLField("Rank", type: .object(Rank.selections)),
          GraphQLField("age", type: .scalar(Int.self)),
          GraphQLField("coins", type: .scalar(Int.self)),
          GraphQLField("darkTheme", type: .scalar(Bool.self)),
          GraphQLField("doSport", type: .scalar(DoSportType.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("fitnessPreference", type: .scalar(FitnessPreferenceType.self)),
          GraphQLField("foodGroupId", type: .scalar(Int.self)),
          GraphQLField("gender", type: .scalar(GenderType.self)),
          GraphQLField("goal", type: .scalar(GoalType.self)),
          GraphQLField("growth", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("notifications", type: .scalar(Bool.self)),
          GraphQLField("reminders", type: .scalar(Bool.self)),
          GraphQLField("showOnBoarding", type: .scalar(Bool.self)),
          GraphQLField("weight", type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(rank: Rank? = nil, age: Int? = nil, coins: Int? = nil, darkTheme: Bool? = nil, doSport: DoSportType? = nil, email: String? = nil, energy: Int? = nil, fitnessPreference: FitnessPreferenceType? = nil, foodGroupId: Int? = nil, gender: GenderType? = nil, goal: GoalType? = nil, growth: Int? = nil, id: GraphQLID? = nil, name: String? = nil, notifications: Bool? = nil, reminders: Bool? = nil, showOnBoarding: Bool? = nil, weight: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "Rank": rank.flatMap { (value: Rank) -> ResultMap in value.resultMap }, "age": age, "coins": coins, "darkTheme": darkTheme, "doSport": doSport, "email": email, "energy": energy, "fitnessPreference": fitnessPreference, "foodGroupId": foodGroupId, "gender": gender, "goal": goal, "growth": growth, "id": id, "name": name, "notifications": notifications, "reminders": reminders, "showOnBoarding": showOnBoarding, "weight": weight])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var rank: Rank? {
        get {
          return (resultMap["Rank"] as? ResultMap).flatMap { Rank(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Rank")
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

      public var fitnessPreference: FitnessPreferenceType? {
        get {
          return resultMap["fitnessPreference"] as? FitnessPreferenceType
        }
        set {
          resultMap.updateValue(newValue, forKey: "fitnessPreference")
        }
      }

      public var foodGroupId: Int? {
        get {
          return resultMap["foodGroupId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "foodGroupId")
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
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Me {
      me {
        __typename
        Rank {
          __typename
          countryPosition
          globalPosition
          level
          rank
        }
        age
        coins
        darkTheme
        doSport
        email
        energy
        fitnessPreference
        foodGroupId
        gender
        goal
        growth
        id
        name
        notifications
        reminders
        showOnBoarding
        weight
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
          GraphQLField("Rank", type: .object(Rank.selections)),
          GraphQLField("age", type: .scalar(Int.self)),
          GraphQLField("coins", type: .scalar(Int.self)),
          GraphQLField("darkTheme", type: .scalar(Bool.self)),
          GraphQLField("doSport", type: .scalar(DoSportType.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("energy", type: .scalar(Int.self)),
          GraphQLField("fitnessPreference", type: .scalar(FitnessPreferenceType.self)),
          GraphQLField("foodGroupId", type: .scalar(Int.self)),
          GraphQLField("gender", type: .scalar(GenderType.self)),
          GraphQLField("goal", type: .scalar(GoalType.self)),
          GraphQLField("growth", type: .scalar(Int.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("notifications", type: .scalar(Bool.self)),
          GraphQLField("reminders", type: .scalar(Bool.self)),
          GraphQLField("showOnBoarding", type: .scalar(Bool.self)),
          GraphQLField("weight", type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(rank: Rank? = nil, age: Int? = nil, coins: Int? = nil, darkTheme: Bool? = nil, doSport: DoSportType? = nil, email: String? = nil, energy: Int? = nil, fitnessPreference: FitnessPreferenceType? = nil, foodGroupId: Int? = nil, gender: GenderType? = nil, goal: GoalType? = nil, growth: Int? = nil, id: GraphQLID? = nil, name: String? = nil, notifications: Bool? = nil, reminders: Bool? = nil, showOnBoarding: Bool? = nil, weight: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "Rank": rank.flatMap { (value: Rank) -> ResultMap in value.resultMap }, "age": age, "coins": coins, "darkTheme": darkTheme, "doSport": doSport, "email": email, "energy": energy, "fitnessPreference": fitnessPreference, "foodGroupId": foodGroupId, "gender": gender, "goal": goal, "growth": growth, "id": id, "name": name, "notifications": notifications, "reminders": reminders, "showOnBoarding": showOnBoarding, "weight": weight])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var rank: Rank? {
        get {
          return (resultMap["Rank"] as? ResultMap).flatMap { Rank(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Rank")
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

      public var fitnessPreference: FitnessPreferenceType? {
        get {
          return resultMap["fitnessPreference"] as? FitnessPreferenceType
        }
        set {
          resultMap.updateValue(newValue, forKey: "fitnessPreference")
        }
      }

      public var foodGroupId: Int? {
        get {
          return resultMap["foodGroupId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "foodGroupId")
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
}
