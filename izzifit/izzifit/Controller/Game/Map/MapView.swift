//
//  MapView.swift
//  izzifit
//
//  Created by O l e h on 03.06.2022.
//

import UIKit

class MapView: UIView {

   private let viewUponScrollView = UIView()
    
    
    override func draw(_ rect: CGRect) {
       setUI()
       layout()
    }

    private func setUI() {
        
    }
    
    private func layout() {
        ui.setAndLayScrollView(contentV: viewUponScrollView,
                               parentView: self,
                               backColor: clr(color: .clrMainMapBack) ?? UIColor(),
                               showScrollIndicators: false,
                               bounces: false,
                               width: 428,
                               height: 926)
    }
}
