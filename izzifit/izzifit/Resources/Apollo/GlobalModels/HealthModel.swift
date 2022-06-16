
import Foundation

struct HealthModel: Codable {
    let steps: HealthStepsModel
}

struct HealthStepsModel: Codable {
    let date: Date
    let steps: Int
}
