// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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
          GraphQLField("weight", type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(rank: Rank? = nil, age: Int? = nil, coins: Int? = nil, darkTheme: Bool? = nil, doSport: DoSportType? = nil, energy: Int? = nil, fitnessPreference: FitnessPreferenceType? = nil, foodGroupId: Int? = nil, gender: GenderType? = nil, goal: GoalType? = nil, growth: Int? = nil, id: GraphQLID? = nil, name: String? = nil, notifications: Bool? = nil, reminders: Bool? = nil, weight: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "MeModel", "Rank": rank.flatMap { (value: Rank) -> ResultMap in value.resultMap }, "age": age, "coins": coins, "darkTheme": darkTheme, "doSport": doSport, "energy": energy, "fitnessPreference": fitnessPreference, "foodGroupId": foodGroupId, "gender": gender, "goal": goal, "growth": growth, "id": id, "name": name, "notifications": notifications, "reminders": reminders, "weight": weight])
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
