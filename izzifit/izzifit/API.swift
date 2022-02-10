// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum UserStatusType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case userStatusTypeHidden
  case userStatusTypeInCall
  case userStatusTypeOffline
  case userStatusTypeOnline
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "USER_STATUS_TYPE_HIDDEN": self = .userStatusTypeHidden
      case "USER_STATUS_TYPE_IN_CALL": self = .userStatusTypeInCall
      case "USER_STATUS_TYPE_OFFLINE": self = .userStatusTypeOffline
      case "USER_STATUS_TYPE_ONLINE": self = .userStatusTypeOnline
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .userStatusTypeHidden: return "USER_STATUS_TYPE_HIDDEN"
      case .userStatusTypeInCall: return "USER_STATUS_TYPE_IN_CALL"
      case .userStatusTypeOffline: return "USER_STATUS_TYPE_OFFLINE"
      case .userStatusTypeOnline: return "USER_STATUS_TYPE_ONLINE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: UserStatusType, rhs: UserStatusType) -> Bool {
    switch (lhs, rhs) {
      case (.userStatusTypeHidden, .userStatusTypeHidden): return true
      case (.userStatusTypeInCall, .userStatusTypeInCall): return true
      case (.userStatusTypeOffline, .userStatusTypeOffline): return true
      case (.userStatusTypeOnline, .userStatusTypeOnline): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [UserStatusType] {
    return [
      .userStatusTypeHidden,
      .userStatusTypeInCall,
      .userStatusTypeOffline,
      .userStatusTypeOnline,
    ]
  }
}

public final class HarksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Harks($limit: Int!, $offset: Int!) {
      harks(limit: $limit, offset: $offset) {
        __typename
        Harks {
          __typename
          id
          nickName
          status
        }
        Pagination {
          __typename
          total
          totalPages
          nextPageExists
          previousPageExists
        }
      }
    }
    """

  public let operationName: String = "Harks"

  public var limit: Int
  public var offset: Int

  public init(limit: Int, offset: Int) {
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("harks", arguments: ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .object(Hark.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(harks: Hark? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "harks": harks.flatMap { (value: Hark) -> ResultMap in value.resultMap }])
    }

    public var harks: Hark? {
      get {
        return (resultMap["harks"] as? ResultMap).flatMap { Hark(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "harks")
      }
    }

    public struct Hark: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["HarksResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Harks", type: .list(.object(Hark.selections))),
          GraphQLField("Pagination", type: .object(Pagination.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(harks: [Hark?]? = nil, pagination: Pagination? = nil) {
        self.init(unsafeResultMap: ["__typename": "HarksResponse", "Harks": harks.flatMap { (value: [Hark?]) -> [ResultMap?] in value.map { (value: Hark?) -> ResultMap? in value.flatMap { (value: Hark) -> ResultMap in value.resultMap } } }, "Pagination": pagination.flatMap { (value: Pagination) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var harks: [Hark?]? {
        get {
          return (resultMap["Harks"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Hark?] in value.map { (value: ResultMap?) -> Hark? in value.flatMap { (value: ResultMap) -> Hark in Hark(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Hark?]) -> [ResultMap?] in value.map { (value: Hark?) -> ResultMap? in value.flatMap { (value: Hark) -> ResultMap in value.resultMap } } }, forKey: "Harks")
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

      public struct Hark: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Hark"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("nickName", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(UserStatusType.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, nickName: String? = nil, status: UserStatusType? = nil) {
          self.init(unsafeResultMap: ["__typename": "Hark", "id": id, "nickName": nickName, "status": status])
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

        public var nickName: String? {
          get {
            return resultMap["nickName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "nickName")
          }
        }

        public var status: UserStatusType? {
          get {
            return resultMap["status"] as? UserStatusType
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }
      }

      public struct Pagination: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Pagination"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("total", type: .scalar(Int.self)),
            GraphQLField("totalPages", type: .scalar(Int.self)),
            GraphQLField("nextPageExists", type: .scalar(Bool.self)),
            GraphQLField("previousPageExists", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(total: Int? = nil, totalPages: Int? = nil, nextPageExists: Bool? = nil, previousPageExists: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pagination", "total": total, "totalPages": totalPages, "nextPageExists": nextPageExists, "previousPageExists": previousPageExists])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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
      }
    }
  }
}
