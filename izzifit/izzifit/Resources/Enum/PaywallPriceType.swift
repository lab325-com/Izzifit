
import Foundation

enum PaywallPriceType: CaseIterable {
    case oneWeek
    case oneMonth
    case threeMonth
    case threeMonth30
    case threeMonth50
    case oneYear
    case oneYear50
    case oneYear70
    
    case threeMonth30FreeTrial
    case threeMonth50FreeTrial
    case oneYear50FreeTrial
    
    var productId: String {
        switch self {
        case .oneWeek:
            return "izzifit_one_week"
        case .oneMonth:
            return "izzifit_one_month"
        case .threeMonth:
            return "izzifit_three_month"
        case .threeMonth30:
            return "izzifit_three_month_30"
        case .threeMonth50:
            return "izzifit_three_month_50"
        case .oneYear:
            return "izzifit_one_year"
        case .oneYear50:
            return "izzifit_one_year_50"
        case .oneYear70:
            return "izzifit_one_year_70"
        case .threeMonth30FreeTrial:
            return "izzifit_three_month_30_free_trial"
        case .threeMonth50FreeTrial:
            return "izzifit_three_month_50_free_trial"
        case .oneYear50FreeTrial:
            return "izzifit_one_year_50_free_trial"
        }
    }
}
