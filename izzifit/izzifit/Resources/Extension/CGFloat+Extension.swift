//
//  CGFloat+Extension.swift
//  izzifit
//
//  Created by mob325 on 24.05.2022.
//

import UIKit

extension CGFloat {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}
