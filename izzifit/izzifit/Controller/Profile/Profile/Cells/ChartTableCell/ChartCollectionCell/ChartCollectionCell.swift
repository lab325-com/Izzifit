//
//  ChartCollectionCell.swift
//  izzifit
//
//  Created by Oleh Study on 16.03.2022.
//

import UIKit

class ChartCollectionCell: UICollectionViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var dateLbl: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    static let id = "ChartCollectionCell"
    private var shapeLayer = CAShapeLayer()
    private var shapeLineWidth: Double = 36
    private var strokeEnd: Double = 0
    private  var targetValue: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = clr(color: .profileCellBack)
    }
    
    func fillCellBy(_ model: CaloriesObjectModel) {
        strokeEnd = calculateStrokeEnd(model.count)
        
        dateLbl.text = model.stringDate
        targetValue =  calculateStrokeEnd(model.target)
        
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
        overTargetPath.move(to: CGPoint(x: x, y: calculateMeasureY(value: model.target)))
        overTargetPath.addLine(to: CGPoint(x: x, y: calculateMeasureY(value: model.count)))
        
        overTargetSL.path = overTargetPath.cgPath
        layer.addSublayer(overTargetSL)
        
    }
    
    func calculateMeasureY(value: CGFloat,
                           upper: CGFloat = 2500,
                           lower: CGFloat = 0) -> CGFloat {
       
        switch value {
        case let x where x > upper: return 0.0
        case let x where x < lower: return 83.0
        default: break
        }
        
        let neededValue = value - lower
        let measureDistance = upper - lower
        let measureRatio = measureDistance / 83.0
        let pointY = neededValue / measureRatio.rounded(toPlaces: 1)
        let residualValue = 83.0 - pointY.rounded(toPlaces: 1)
        return residualValue
    }
    
    func calculateStrokeEnd(_ countCalories: CGFloat,
                            upper: CGFloat = 2500,
                            lower: CGFloat = 0) -> CGFloat {
       
        switch countCalories {
        case let x where x > upper: return 0.0
        case let x where x < lower: return 1.0
        default: break
        }
        
        let measureRatio: CGFloat = 25
        let neededValue = countCalories / measureRatio.rounded(toPlaces: 1)
        let strokeEnd = neededValue * 0.01
      
        return strokeEnd
    }
}
