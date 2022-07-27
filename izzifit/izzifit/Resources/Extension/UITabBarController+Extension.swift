//
//  UITabBar+Extension.swift
//  izzifit
//
//  Created by O l e h on 27.07.2022.
//

import UIKit
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended



extension UITabBarController: NVActivityIndicatorViewable {
    
    //----------------------------------------------
    // MARK: - Loader
    //----------------------------------------------
    
    func startLoader() {
        let size = CGSize(width: 50, height: 50)
        let allTypes = NVActivityIndicatorType.allCases
        
        startAnimating(size, message: "", type: .lineScalePulseOutRapid, color: UIColor(rgb: 0xFF42A8), fadeInAnimation: nil)
    }
    
    func stopLoading() {
        stopAnimating()
    }

}
