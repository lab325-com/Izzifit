
import Foundation

enum PaywallTrialType: CaseIterable {
    case oneWeek
    case oneMonth
    case oneYear
    
    var productId: String {
        switch self {
        case .oneWeek:
            return "izzifit_one_week_free_trial"
        case .oneMonth:
            return "izzifit_three_month_free_trial"
        case .oneYear:
            return "izzifit_one_year_free_trial"
        }
    }
}
