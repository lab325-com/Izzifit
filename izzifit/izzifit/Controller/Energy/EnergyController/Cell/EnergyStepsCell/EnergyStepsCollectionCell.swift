
import UIKit
import SwiftUI

class EnergyStepsCollectionCell: UICollectionViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    

    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    static let id = "EnergyStepsCollectionCell"
    
    private var shapeLayer = CAShapeLayer()
    private var shapeLineWidth: Double = 36
    private var strokeEnd: Double = 0
    private var targetValue: CGFloat = 0.0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = clr(color: .profileCellBack)
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(rgb: 0x3F3E56, alpha: 0.1).cgColor
    }

    func fillCellBy(_ model: CurrentStepsModel) {
        strokeEnd = calculateStrokeEnd(CGFloat(model.steps))
        targetValue = KeychainService.standard.me?.gender == .genderTypeMan ? 950.0 : 650.0
        
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
        let x = self.bounds.width / 2
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x, y: y + y))
        path.addLine(to: CGPoint(x: x , y: 0))
        shapeLayer.path = path.cgPath
        overShapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        layer.addSublayer(overShapeLayer)
        
        let convertedTargetValue = calculateStrokeEnd(targetValue)
        guard strokeEnd > convertedTargetValue else { return }
        
        let overTargetSL = CAShapeLayer()
        overTargetSL.lineWidth = shapeLineWidth
        overTargetSL.strokeColor = clr(color: .intensivePurple)?.cgColor
        overTargetSL.strokeEnd = 1
        overTargetSL.fillColor = nil
        
        let overTargetPath = UIBezierPath()
        overTargetPath.move(to: CGPoint(x: x, y: calculateMeasureY(value: targetValue)))
        overTargetPath.addLine(to: CGPoint(x: x, y: calculateMeasureY(value: CGFloat(model.steps))))
        
        overTargetSL.path = overTargetPath.cgPath
        layer.addSublayer(overTargetSL)
    }
    
    func calculateMeasureY(value: CGFloat,
                           upper: CGFloat = 1200,
                           lower: CGFloat = 0) -> CGFloat {
       
        switch value {
        case let x where x > upper: return 0.0
        case let x where x < lower: return 89.0
        default: break
        }
        
        let neededValue = value - lower
        let measureDistance = upper - lower
        let measureRatio = measureDistance / 89.0
        let pointY = neededValue / measureRatio.rounded(toPlaces: 1)
        let residualValue = 89.0 - pointY.rounded(toPlaces: 1)
        return residualValue
    }
    
    func calculateStrokeEnd(_ countCalories: CGFloat,
                            upper: CGFloat = 1200,
                            lower: CGFloat = 0) -> CGFloat {
       
        switch countCalories {
        case let x where x > upper: return 1.0
        case let x where x < lower: return 0.0
        default: break
        }
        
        let measureRatio: CGFloat = upper / 100
        let neededValue = countCalories / measureRatio.rounded(toPlaces: 1)
        let strokeEnd = neededValue * 0.01
      
        return strokeEnd
    }
}
