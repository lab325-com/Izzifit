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
    var strokeEnd: Double = 0
    var targetValue: CGFloat = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = clr(color: .profileCellBack)
    }
    
    func fillCellBy(_ model: CaloriesObjectModel) {
        strokeEnd = model.count
        dateLbl.text = model.stringDate
        targetValue = model.target
        
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
        path.move(to: CGPoint(x: x, y: y + y))
        path.addLine(to: CGPoint(x: x , y: 0))
        shapeLayer.path = path.cgPath
        overShapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        layer.addSublayer(overShapeLayer)
        
        guard strokeEnd > targetValue else { return }
       
        let overTargetSL = CAShapeLayer()
        overTargetSL.lineWidth = shapeLineWidth
        overTargetSL.strokeColor = clr(color: .intensivePurple)?.cgColor
        overTargetSL.strokeEnd = 1
        overTargetSL.fillColor = nil
        
        let overTargetPath = UIBezierPath()
        overTargetPath.move(to: CGPoint(x: x, y: correlateValueToY(targetValue)))
        overTargetPath.addLine(to: CGPoint(x: x, y: correlateValueToY(strokeEnd)))
        
        overTargetSL.path = overTargetPath.cgPath
        layer.addSublayer(overTargetSL)
        
    }
    
    
    
   private func correlateValueToY(_ targetAmount: CGFloat) -> CGFloat  {
        
        var decimalTargetAmount = Int(Float(targetAmount) * 100)
        
        var oneHundredth: CGFloat = CGFloat(decimalTargetAmount) / 100
        
        var verticalPointAmount: CGFloat = CGFloat(oneHundredth) * 83 // 83 - chartCollectionview height
        
        var residualValue: CGFloat = 83 - verticalPointAmount
        
        return residualValue
    }
}
