//
//  ChartCollectionCell.swift
//  izzifit
//
//  Created by Oleh Study on 16.03.2022.
//

import UIKit

class ChartCollectionCell: UICollectionViewCell {

    static let id = "ChartCollectionCell"
    @IBOutlet weak var dateLbl: UILabel!
    
    var shapeLayer = CAShapeLayer()
    var shapeLineWidth: Double = 36
    var strokeEnd = ((Double(Int(arc4random_uniform(68))) / 100) + 0.06)

    override func awakeFromNib() {
        super.awakeFromNib()
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
        
        let y = self.bounds.height / 2 - 10
        let x = self.bounds.width / 2
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x, y: y + y ))
        path.addLine(to: CGPoint(x: x , y:  y - y  ))
        shapeLayer.path = path.cgPath
        overShapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        layer.addSublayer(overShapeLayer)
        
        guard strokeEnd > 0.50 else { return }
        let afterTargetLayer = CAShapeLayer()
        afterTargetLayer.lineWidth = shapeLineWidth
        afterTargetLayer.fillColor = nil
        afterTargetLayer.strokeEnd = (strokeEnd - 0.50) * 2
        afterTargetLayer.strokeColor = clr(color: .intensivePurple)?.cgColor
        
        let afterPath = UIBezierPath()
        afterPath.move(to: CGPoint(x: x, y: y  ))
        afterPath.addLine(to: CGPoint(x: x , y: y - y))
        afterTargetLayer.path = afterPath.cgPath
        overShapeLayer.addSublayer(afterTargetLayer)
    }
}
