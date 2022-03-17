//
//  CaloriesCollectionCell.swift
//  izzifit
//
//  Created by Oleh Study on 15.03.2022.
//

import UIKit

class CaloriesCollectionCell: UICollectionViewCell {
    
    static let id = "CaloriesCollectionCell"
    
    var shapeLayer = CAShapeLayer()
    var shapeVw = UIView()
    var shapeLineWidth: Double = 9
    var strokeEnd = ((Double(Int(arc4random_uniform(58))) / 100) + 0.06)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = clr(color: .profileCellBack)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = shapeLineWidth
        shapeLayer.fillColor = nil
        shapeLayer.strokeEnd = 1
        shapeLayer.strokeColor = clr(color: .profileCellBack)!.cgColor
        
        let overShapeLayer = CAShapeLayer()
        overShapeLayer.lineWidth = shapeLineWidth
        overShapeLayer.fillColor = nil
        overShapeLayer.strokeEnd = strokeEnd
        overShapeLayer.strokeColor = clr(color: .chartPurple)?.cgColor
        
        let y = self.bounds.height / 2
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: y + y ))
        path.addLine(to: CGPoint(x: 0 , y:  y - y  ))
        shapeLayer.path = path.cgPath
        overShapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        layer.addSublayer(overShapeLayer)
        
        guard strokeEnd > 0.50 else { return }
        let afterTargetLayer = CAShapeLayer()
        afterTargetLayer.lineWidth = shapeLineWidth
        afterTargetLayer.fillColor = nil
        afterTargetLayer.strokeEnd = (strokeEnd - 0.50) * 2
        afterTargetLayer.strokeColor = clr(color: .afterTarget)?.cgColor
        
        let afterPath = UIBezierPath()
        afterPath.move(to: CGPoint(x: 0, y: y ))
        afterPath.addLine(to: CGPoint(x: 0 , y: y - y))
        afterTargetLayer.path = afterPath.cgPath
        
        overShapeLayer.addSublayer(afterTargetLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
