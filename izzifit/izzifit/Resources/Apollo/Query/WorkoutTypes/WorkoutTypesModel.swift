
import Foundation

struct WorkoutTypesModel: Codable {
    let workoutTypes: [WorkoutType]
}

struct WorkoutType: Codable, Hashable {
    let id: Int
    let name: String?
}
