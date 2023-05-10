//
//  UILabel + Extension.swift
//  izzifit
//
//  Created by O l e h on 22.08.2022.
//

import UIKit

extension UILabel {
    func addCharacterSpacing(kernValue: Double = 3) {
         if let labelText = text, labelText.isEmpty == false {
             let attributedString = NSMutableAttributedString(string: labelText)
             attributedString.addAttribute(.kern,
                                           value: kernValue,
                                           range: NSRange(location: 0, length: attributedString.length - 1))
             attributedText = attributedString
         }
     }
 }
