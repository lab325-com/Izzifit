//
//  LevelView.swift
//  izzifit
//
//  Created by O l e h on 07.06.2022.
//

import UIKit

class LevelView: UIView {

    private var barBackVw = GameBarBackView(backImage: UIImage(named: "gameBarBack")!)
    
    private let imgUponScroll = UIImageView()
    let scrollView = UIScrollView()
    var points: [CGPoint]
    
    init(points: [CGPoint]) {
        self.points = points
        super.init(frame: .zero)
        setUI()
        layout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUI() { imgUponScroll.image = image(img: .level_england_back) }
    
    private func layout() {
        
        ui.setAndLayScrollView(contentV: imgUponScroll,
                               scrollV: scrollView,
                               parentView: self,
                               backColor: clr(color: .clrMainMapBack) ?? UIColor(),
                               showScrollIndicators: false,
                               bounces: false,
                               width: 428,
                               height: 926)
        
        let x = (428 - UIScreen.main.bounds.size.width) / 2
        scrollView.setContentOffset(CGPoint(x: x, y: 2605),
                                    animated: true)
        
        ui.genericlLayout(object: barBackVw,
                               parentView: self,
                               height: h / 9.2,
                               topC: 0,
                               leadingC: 0,
                               trailingC: 0)
    }
}
