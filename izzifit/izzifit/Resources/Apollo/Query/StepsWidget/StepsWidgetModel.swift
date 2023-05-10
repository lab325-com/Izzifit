
import Foundation

struct StepsWidgetDataModel: Codable {
    let stepsWidget: StapsWidgetModel?
}

struct StapsWidgetModel: Codable {
    let energy: Int
    let energyTotal: Int
}
