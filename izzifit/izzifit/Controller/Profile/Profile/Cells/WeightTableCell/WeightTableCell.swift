//
//  WeightTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 18.03.2022.
//

import UIKit
import SwiftUI

class WeightTableCell: UITableViewCell {
    
    
    var calculator = TrigonometryManager()
    
    @IBOutlet var dateLabelsCollection: [UILabel]! {
        didSet {
            for (index, label) in dateLabelsCollection.enumerated() {
                label.tag = index
            }
        }
    }
    
    @IBOutlet var weightsOutletCollection: [UILabel]! {
        didSet {
            for (index, label) in weightsOutletCollection.enumerated() {
                label.tag = index
            }
        }
    }
    
    @IBOutlet weak var weightLbl: UILabel! {
        didSet {
            weightLbl.text = RLocalization.profile_weight()
        }
    }
    
    @IBOutlet weak var targetLbl: UILabel!
    
    @IBOutlet weak var backVw: UIView! {
        didSet{
            backVw.layer.masksToBounds = true
            backVw.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var chartBackVw: UIView! {
        didSet {
            chartBackVw.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
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
        
        selectionStyle = .none
        
        let chartShapeLayer = CAShapeLayer()
        chartShapeLayer.lineWidth = 2
        chartShapeLayer.lineCap = .round
        chartShapeLayer.fillColor = UIColor.clear.cgColor
        chartShapeLayer.strokeColor = clr(color: .intensivePurple)?.cgColor
        chartShapeLayer.strokeEnd = 1
        
        
        let pinkShapeLayer = CAShapeLayer()
        pinkShapeLayer.lineWidth = 2
        pinkShapeLayer.fillColor = UIColor.clear.cgColor
        pinkShapeLayer.strokeColor = clr(color: .pinkTarget)?.cgColor
        pinkShapeLayer.strokeStart = 0.25
        pinkShapeLayer.strokeEnd = 0.75
        let path = UIBezierPath()
        let pinkPath = UIBezierPath()
        
        let backYAxis = chartBackVw.bounds.height / 10
        let backXAxis = chartBackVw.bounds.width / 7
        
        path.move(to: CGPoint(x: 5, y: backYAxis * 3 ))
        path.addLine(to: CGPoint(x: backXAxis, y: backYAxis * 4))
        path.addLine(to: CGPoint(x: backXAxis * 2, y: backYAxis * 5))
        path.addLine(to: CGPoint(x: backXAxis * 3, y: backYAxis * 7))
        path.addLine(to: CGPoint(x: backXAxis * 4, y: backYAxis * 5))
        path.addLine(to: CGPoint(x: backXAxis * 5.5, y: backYAxis * 5.5))
        path.addLine(to: CGPoint(x: backXAxis * 7, y: backYAxis * 3))
        
        pinkPath.move(to: CGPoint(x: backXAxis * 2, y: backYAxis * 5))
        pinkPath.addLine(to: CGPoint(x: backXAxis * 3, y: backYAxis * 7))
        pinkPath.addLine(to: CGPoint(x: backXAxis * 4 , y: backYAxis * 5))
        
        chartShapeLayer.path = path.cgPath
        pinkShapeLayer.path = pinkPath.cgPath
        
        //chartBackVw.layer.addSublayer(chartShapeLayer)
        // chartBackVw.layer.addSublayer(pinkShapeLayer)
        // Initialization code
    }
    
    func fillCellBy(_ model: WeightsWidgetMainModel) {
        
        let path = UIBezierPath()
        var chartPoints = [CGPoint]()
        
        path.move(to: CGPoint(x: 0,
                              y: 25))
        
        // Weight Labels
        fillWeightLbls(model)
        
        // Date Labels
        for (index, item) in model.Weights.enumerated() {
            if index <= 6 {
                dateLabelsCollection[index].text = convertDate(item.date)
                // Draw Graph
                let currentX = chartBackViewStrideX * CGFloat(index + 1)
                let currentY = correlateValueToY(Int(item.weight))
                
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
          //  path.addLine(to: point)
            
            switch index {
            case 0:
                previousPoint = CGPoint(x: 1, y: 25)
                combination = calculator.recognizeCombination(backPoint:  CGPoint(x: 1, y: 25),
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
                
                var end = calculator.getForwardIntersectedStrokeEnd(by: previousPoint,
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
                
                var end = calculator.getBackIntersectedStrokeEnd(by: previousPoint,
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
        // Pink UnderTarget
        //  pinkChartDrawer(chartPoints)
        
        
        
    }
    
    func pinkChartDrawer(_ points: [CGPoint]) {
        
        var previousPoint = CGPoint()
        var currentPoint = CGPoint()
        
        
        for (index, point) in points.enumerated() {
            var combination:  ChartCombinations!
            var starterDrawingPoint: CGPoint?
            
            switch index {
            case 0:
                previousPoint = CGPoint(x: 1,
                                        y: 25)
                combination = calculator.recognizeCombination(backPoint: previousPoint,
                                                              forwardPoint: point,
                                                              interY: chartBackVw.sizeHeight / 2)
                
            default:
                previousPoint = points[index - 1]
                combination = calculator.recognizeCombination(backPoint: previousPoint,
                                                              forwardPoint: point,
                                                              interY: chartBackVw.sizeHeight / 2)
            }
            
            switch combination! {
            case .triangleIntersectionForwardToBack:
                starterDrawingPoint = calculator.getForwardIntersectionPoint(by: previousPoint,
                                                                             and: point,
                                                                             intersectionY: chartBackVw.sizeHeight / 2)
                if let startPoint = starterDrawingPoint  {
                    // проевряй есть ли комбинация вообще
                    let path = UIBezierPath()
                    
                    path.move(to:startPoint )
                    path.addLine(to: previousPoint)
                    
                    let shapeLayer = CAShapeLayer()
                    shapeLayer.strokeEnd = 1
                    shapeLayer.lineWidth = 2
                    shapeLayer.fillColor = UIColor.clear.cgColor
                    shapeLayer.strokeColor = clr(color: .pinkTarget)?.cgColor
                    shapeLayer.path = path.cgPath
                    chartBackVw.layer.addSublayer(shapeLayer)
                }
                
            case .triangleIntersectionBackToForward:
                starterDrawingPoint = calculator.getBackIntersectionPoint(by:  previousPoint ,
                                                                          and: point,
                                                                          intersectionY: chartBackVw.sizeHeight / 2)
                if let startPoint = starterDrawingPoint  {
                    // проевряй есть ли комбинация вообще
                    let path = UIBezierPath()
                    
                    path.move(to:point )
                    path.addLine(to: startPoint)
                    
                    let shapeLayer = CAShapeLayer()
                    shapeLayer.strokeEnd = 1
                    shapeLayer.lineWidth = 2
                    shapeLayer.fillColor = UIColor.clear.cgColor
                    shapeLayer.strokeColor = clr(color: .pinkTarget)?.cgColor
                    shapeLayer.path = path.cgPath
                    chartBackVw.layer.addSublayer(shapeLayer)
                }
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
    }
    
    func targetLineDraw() {
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
    
    
    func correlateValueToY(_ targetAmount: Int) -> CGFloat  {
        
        let decimalTargetAmount = Int(Float(targetAmount) * 0.1)
        
        let oneHundredth: CGFloat = CGFloat(decimalTargetAmount) / 100
        
        let verticalPointAmount: CGFloat = CGFloat(oneHundredth) * 89 // 83 - chart height
        
        let residualValue: CGFloat = 89 - verticalPointAmount
        
        return residualValue
    }
    
    
    func fillWeightLbls(_ model: WeightsWidgetMainModel) {
        var measure = String()
        
        switch model.measure {
        case .weightMeasureTypeLb:
            measure = "lb"
        case .weightMeasureTypeKg:
            measure = "kg"
        case .__unknown(_):
            measure = ""
        }
        
        var weightValues = createWeights(from: model.targetWeight)
        for (index,item) in weightsOutletCollection.enumerated() {
            item.text = "\(weightValues[index]) \(measure)"
        }
    }
    
    func createWeights(from targetWeight: Float) -> [Int] {
        var multiplier: Float = 1.4
        var weightsArray = [Int]()
        for _ in 1...5 {
            let number = Int(targetWeight * multiplier)
            weightsArray.append(number)
            multiplier -= 0.2
        }
        return weightsArray
    }
    
    func convertDate(_ stringDate: String) -> String {
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
