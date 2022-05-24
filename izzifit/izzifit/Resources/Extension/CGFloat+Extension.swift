//
//  CGFloat + Extension.swift
//  izzifit
//
//  Created by O l e h on 23.05.2022.
//

import UIKit

extension CGFloat {
    func rounded(toPlaces places:Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}
