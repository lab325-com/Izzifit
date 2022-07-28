
import Foundation

enum PaywallTrialType: CaseIterable {
    case oneWeek
    case threeMonth
    case threeMonth30
    case threeMonth50
    case oneMonth
    case oneYear
    case oneYear50
    case oneYear70
    
    var productId: String {
        switch self {
        case .oneWeek:
            return "izzifit_one_week_free_trial"
        case .threeMonth:
            return "izzifit_three_month_free_trial"
        case .threeMonth30:
            return "izzifit_three_month_30_free_trial"
        case .threeMonth50:
            return "izzifit_three_month_50_free_trial"
        case .oneMonth:
            return "izzifit_one_month_free_trial"
        case .oneYear:
            return "izzifit_one_year_free_trial"
        case .oneYear50:
            return "izzifit_one_year_50_free_trial"
        case .oneYear70:
            return "izzifit_one_year_70_free_trial"
        }
    }
}
