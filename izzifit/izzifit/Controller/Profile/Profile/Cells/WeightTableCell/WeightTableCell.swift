//
//  WeightTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 18.03.2022.
//

import UIKit

class WeightTableCell: UITableViewCell {

    
    @IBOutlet var dateLabelsCollection: [UILabel]! {
        didSet {
            for (index, label) in dateLabelsCollection.enumerated() {
                label.tag = index
            }
        }
    }
    
    @IBOutlet weak var weightLbl: UILabel! {
        didSet {
            weightLbl.text = RLocalization.profile_weight()
        }
    }
    
    @IBOutlet weak var targetLbl: UILabel! {
        didSet {
            targetLbl.text = RLocalization.profile_target()
        }
    }
    
    
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
        
        chartBackVw.layer.addSublayer(chartShapeLayer)
        chartBackVw.layer.addSublayer(pinkShapeLayer)
        // Initialization code
        
        let lineLayer = CAShapeLayer()
             lineLayer.strokeColor = clr(color: .pinkTarget)!.cgColor
             lineLayer.lineWidth = 1
             lineLayer.lineDashPattern = [6, 4]
             let linePath = CGMutablePath()
             linePath.addLines(between: [CGPoint(x: 0, y: backYAxis * 6),
                                         CGPoint(x: chartBackVw.bounds.size.width, y: backYAxis * 6)])
             lineLayer.path = linePath
             chartBackVw.layer.addSublayer(lineLayer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
