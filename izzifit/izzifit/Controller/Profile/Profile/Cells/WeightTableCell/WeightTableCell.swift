//
//  WeightTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 18.03.2022.
//

import UIKit
import SwiftUI

class WeightTableCell: BaseTableViewCell {
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    @IBOutlet var dateLabelsCollection: [UILabel]!
    @IBOutlet var weightsOutletCollection: [UILabel]!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var targetLbl: UILabel!
    @IBOutlet weak var backVw: UIView!
    @IBOutlet weak var chartBackVw: UIView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    private var calculator = TrigonometryManager()
    
    private lazy var chartBackViewStrideX: CGFloat = {
        (w - 99) / 7
    }()

    
    private var chartShapeLayer: CAShapeLayer = {
        let chartShapeLayer = CAShapeLayer()
        chartShapeLayer.lineWidth = 2
        chartShapeLayer.lineCap = .round
        chartShapeLayer.fillColor = UIColor.clear.cgColor
        chartShapeLayer.strokeColor = UIColor(named: Clrs.intensivePurple.rawValue)?.cgColor
        chartShapeLayer.strokeEnd = 1
        return chartShapeLayer
    }()
    
    static let id = "WeightTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        selectionStyle = .none
    }
    
    private func setup() {
        for (index, label) in dateLabelsCollection.enumerated() {
            label.tag = index
        }
        for (index, label) in weightsOutletCollection.enumerated() {
            label.tag = index
        }
        weightLbl.text = RLocalization.profile_weight()
        backVw.layer.masksToBounds = true
        backVw.layer.cornerRadius = 20
        chartBackVw.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func calculateMeasureY(value: CGFloat, upper: CGFloat, lower: CGFloat) -> CGFloat {
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
    
    func fillCellBy(_ model: WeightsWidgetMainModel) {
        
        let path = UIBezierPath()
        var chartPoints = [CGPoint]()
        let weights = createWeights(from: model.targetWeight)
        let startY = calculateMeasureY(value: CGFloat(model.Weights.first?.weight ?? 30.0),
                                       upper: CGFloat(weights.first ?? 1),
                                       lower: CGFloat(weights.last ?? 1))
        
        let startPoint = CGPoint(x: 0,
                                 y: startY)
        
        path.move(to: startPoint)
        // Weight Labels
        fillWeightLbls(model)
        // Date Labels
        for (index, item) in model.Weights.enumerated() {
            if index <= 6 {
                dateLabelsCollection[index].text = convertDate(item.createdAt)
                // Draw Graph
                let currentX = chartBackViewStrideX * CGFloat(index)
                let currentY = calculateMeasureY(value: CGFloat(item.weight),
                                                 upper: CGFloat(weights.first ?? 1),
                                                 lower: CGFloat(weights.last ?? 1))
                let cgPoint = CGPoint(x: currentX,
                                      y: currentY)
                chartPoints.append(cgPoint)
            }
        }
        
        for point in chartPoints {
            path.addLine(to: point)
        }
        
        chartShapeLayer.path = path.cgPath
        chartBackVw.layer.addSublayer(chartShapeLayer)
        
        for (index,point) in chartPoints.enumerated() {
            var combination: ChartCombinations
            var previousPoint = CGPoint()
            
            switch index {
            case 0:
                previousPoint = startPoint
                combination = calculator.recognizeCombination(backPoint:  startPoint,
                                                              forwardPoint: point,
                                                              interY: chartBackVw.sizeHeight / 2)
            default:
                previousPoint = chartPoints[index - 1]
                combination = calculator.recognizeCombination(backPoint: chartPoints[index - 1],
                                                              forwardPoint: point,
                                                              interY: chartBackVw.sizeHeight / 2)
            }
            
            switch combination {
            case .triangleIntersectionForwardToBack:
                let path = UIBezierPath()
                
                path.move(to: previousPoint)
                path.addLine(to: point)
                
                let end = calculator.getForwardIntersectedStrokeEnd(by: previousPoint,
                                                                    and: point,
                                                                    intersectionY: chartBackVw.sizeHeight / 2)
                
                let shapeLayer = CAShapeLayer()
                shapeLayer.strokeEnd = end
                shapeLayer.lineWidth = 2
                shapeLayer.fillColor = UIColor.clear.cgColor
                shapeLayer.strokeColor = clr(color: .pinkTarget)?.cgColor
                
                shapeLayer.path = path.cgPath
                chartBackVw.layer.addSublayer(shapeLayer)
            case .triangleIntersectionBackToForward:
                
                let path = UIBezierPath()
                
                path.move(to: point )
                path.addLine(to: previousPoint)
                
                let end = calculator.getBackIntersectedStrokeEnd(by: previousPoint,
                                                                 and: point,
                                                                 intersectionY: chartBackVw.sizeHeight / 2)
                let shapeLayer = CAShapeLayer()
                shapeLayer.strokeEnd = end
                shapeLayer.lineWidth = 2
                shapeLayer.fillColor = UIColor.clear.cgColor
                shapeLayer.strokeColor = clr(color: .pinkTarget)?.cgColor
                
                shapeLayer.path = path.cgPath
                chartBackVw.layer.addSublayer(shapeLayer)
            case .twoPointsUnderTarget:
                let path = UIBezierPath()
                
                path.move(to: previousPoint)
                path.addLine(to: point)
                
                let shapeLayer = CAShapeLayer()
                shapeLayer.strokeEnd = 1
                shapeLayer.lineWidth = 2
                shapeLayer.fillColor = UIColor.clear.cgColor
                shapeLayer.strokeColor = clr(color: .pinkTarget)?.cgColor
                
                shapeLayer.path = path.cgPath
                chartBackVw.layer.addSublayer(shapeLayer)
            case .none:
                break
            }
        }
        targetLbl.text = RLocalization.profile_target()
        targetLineDraw()
    }
    
    private func targetLineDraw() {
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = clr(color: .pinkTarget)!.cgColor
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [6, 4]
        let linePath = CGMutablePath()
        let lineY = chartBackVw.sizeHeight / 2
        
        linePath.addLines(between: [CGPoint(x: 0,
                                            y: lineY),
                                    CGPoint(x: chartBackVw.sizeWidth,
                                            y: lineY) ])
        lineLayer.path = linePath
        chartBackVw.layer.addSublayer(lineLayer)
    }
    
    private func correlateValueToY(_ targetAmount: Int) -> CGFloat  {
        
        let oneHundredth: CGFloat = CGFloat(targetAmount) / 100
        let verticalPointAmount: CGFloat = CGFloat(oneHundredth) * chartBackVw.sizeHeight  // 83 - chart height
        let residualValue: CGFloat = chartBackVw.sizeHeight - verticalPointAmount
        return residualValue
    }
    
    private func fillWeightLbls(_ model: WeightsWidgetMainModel) {
        var measure = String()
        switch model.measure {
        case .weightMeasureTypeLb:
            measure = "lb"
        case .weightMeasureTypeKg:
            measure = "kg"
        case .__unknown(_):
            measure = ""
        }
        let weightValues = createWeights(from: model.targetWeight)
        for (index,item) in weightsOutletCollection.enumerated() {
            item.text = "\(weightValues[index]) \(measure)"
        }
    }
    
    private func createWeights(from targetWeight: Float) -> [Int] {
        var multiplier: Float = 1.4
        var weightsArray = [Int]()
        for _ in 1...5 {
            let number = Int(targetWeight * multiplier)
            weightsArray.append(number)
            multiplier -= 0.2
        }
        return weightsArray
    }
    
    private func convertDate(_ stringDate: String) -> String {
        let oldDateFormatter = DateFormatter()
        oldDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        oldDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let gettedDate = oldDateFormatter.date(from: stringDate)
        
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "dd.MM"
        return newDateFormatter.string(from: gettedDate ?? Date())
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
