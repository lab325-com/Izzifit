
import Foundation

struct AuthModel: Codable {
    let token: String
    var isExpired: Bool? = false
}
