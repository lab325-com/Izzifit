
import Foundation

import Foundation
import HealthKit

enum HoursType: String, CaseIterable {
    case zero        = "00"
    case two         = "02"
    case four        = "04"
    case six         = "06"
    case eight       = "08"
    case ten         = "10"
    case twelve      = "12"
    case fourteen    = "14"
    case sixteen     = "16"
    case eighteen    = "18"
    case twenty      = "20"
    case twentyTwo   = "22"
//    case twentyThree = "23"
}

enum CurrentHourType: String, CaseIterable {
    case eight       = "08:00"
    case ten         = "10:00"
    case twelve      = "12:00"
    case fourteen    = "14:00"
    case sixeen      = "16:00"
    case eighteen    = "18:00"
    case twenty      = "20:00"
    case twentyTwo   = "22:00"
}

struct StepsModel {
    let hourType: HoursType
    var steps: Int
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        switch hourType {
        case .zero:
            return dateFormatter.string(from: Calendar.current.date(bySettingHour: 00, minute: 00, second: 00, of: Date())!)
        case .two:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 02, minute: 00, second: 00, of: Date())!)
        case .four:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 04, minute: 00, second: 00, of: Date())!)
        case .six:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 06, minute: 00, second: 00, of: Date())!)
        case .eight:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 08, minute: 00, second: 00, of: Date())!)
        case .ten:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 10, minute: 00, second: 00, of: Date())!)
        case .twelve:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 12, minute: 00, second: 00, of: Date())!)
        case .fourteen:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 14, minute: 00, second: 00, of: Date())!)
        case .sixteen:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 16, minute: 00, second: 00, of: Date())!)
        case .eighteen:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 18, minute: 00, second: 00, of: Date())!)
        case .twenty:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 20, minute: 00, second: 00, of: Date())!)
        case .twentyTwo:
            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 22, minute: 00, second: 00, of: Date())!)
//        case .twentyThree:
//            return dateFormatter.string(from:Calendar.current.date(bySettingHour: 23, minute: 00, second: 00, of: Date())!)
        }
    }
    
    mutating func setSteps(steps: Int) {
        self.steps = steps
    }
}

struct CurrentStepsModel {
    let hourType: CurrentHourType
    let steps: Int
}

class HealthKitManager {
    static let sharedManager: HealthKitManager = {
        let sharedInstance = HealthKitManager()
        return sharedInstance
    }()
    
    private let healthStore = HKHealthStore()
    private let healthKitTypes: Set = [HKObjectType.quantityType(forIdentifier: .stepCount)!]
    
    var healthSteps: [HealthStepsModel] = []
    var steps: [CurrentStepsModel] = []
    var stepsApi: [StepsModel] = []
    
    func querySteps(controller: BaseController?,
                    successHandler: @escaping ((_ model: [StepsModel], _ steps: [CurrentStepsModel]) -> Void),
                    failureHandler: @escaping ((_ error: Error) -> Void)) {
        
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { success, error in
            if success {
                let date = Date()
                let calendar = Calendar.current
                let startOfDay = calendar.date(bySettingHour: 00, minute: 00, second: 00, of: date)!
                let endOfDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
                
                var interval = DateComponents()
                interval.hour = 2
                                
                let type = HKQuantityType.quantityType(forIdentifier: .stepCount)!
                
                let stepsQuery = HKStatisticsCollectionQuery(quantityType: type,
                                                             quantitySamplePredicate: nil,
                                                             options: .cumulativeSum,
                                                             anchorDate: startOfDay,
                                                             intervalComponents: interval)
                
                stepsQuery.initialResultsHandler = { _, results, error in
                    if results != nil, let stepsResult = results {
                        stepsResult.enumerateStatistics(from: startOfDay, to: endOfDay) { statistics, stop in
                            if let quantity = statistics.sumQuantity() {
                                let date = statistics.startDate
                                let steps = Int(quantity.doubleValue(for: HKUnit.count()))
                                let daySteps = HealthStepsModel(date: date, steps: steps)
                                self.healthSteps.append(daySteps)
                            }
                        }
                        
                        var tempArray: [StepsModel] = []
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "HH"

                        for type in HoursType.allCases {
                            self.stepsApi.append(StepsModel(hourType: type, steps: 0))
                        }
                        
                        for steps in self.healthSteps {
                            let day = dateFormatter.string(from: steps.date)
                            let steps = steps.steps
                            if let index = self.stepsApi.firstIndex(where: {$0.hourType == HoursType(rawValue: day)}) {
                                self.stepsApi[index].setSteps(steps: steps)
                            }
                            
                            tempArray.append(StepsModel(hourType: HoursType(rawValue: day) ?? .zero, steps: steps))
                        }

                        for hourType in CurrentHourType.allCases {
                            self.steps.append(CurrentStepsModel(hourType: hourType, steps: self.getSteps(hourType: hourType, model: tempArray)))
                        }
                        
                        successHandler(self.stepsApi, self.steps)
                        
                    } else if let error = error {
                        failureHandler(error)
                    }
                }
                
                self.healthStore.execute(stepsQuery)
                
            } else if let error = error {
                failureHandler(error)
            }
        }
    }
    
    func getSteps(hourType: CurrentHourType, model: [StepsModel]) -> Int {
        switch hourType {
        case .eight:
            let zero = model.first(where: {$0.hourType == .zero})?.steps ?? 0
            let two = model.first(where: {$0.hourType == .two})?.steps ?? 0
            let four = model.first(where: {$0.hourType == .four})?.steps ?? 0
            let six = model.first(where: {$0.hourType == .six})?.steps ?? 0
            let eight = model.first(where: {$0.hourType == .eight})?.steps ?? 0
            return zero + two + four + six + eight
        case .ten:
            return model.first(where: {$0.hourType == .ten})?.steps ?? 0
        case .twelve:
            return model.first(where: {$0.hourType == .twelve})?.steps ?? 0
        case .fourteen:
            return model.first(where: {$0.hourType == .fourteen})?.steps ?? 0
        case .sixeen:
            return model.first(where: {$0.hourType == .sixteen})?.steps ?? 0
        case .eighteen:
            return model.first(where: {$0.hourType == .eighteen})?.steps ?? 0
        case .twenty:
            return model.first(where: {$0.hourType == .twenty})?.steps ?? 0
        case .twentyTwo:
//            let twentyTwo = model.first(where: {$0.hourType == .twentyTwo})?.steps ?? 0
//            let twentyThree = model.first(where: {$0.hourType == .twentyThree})?.steps ?? 0
//            return twentyTwo + twentyThree
            return model.first(where: {$0.hourType == .twentyTwo})?.steps ?? 0
        }
    }
}
