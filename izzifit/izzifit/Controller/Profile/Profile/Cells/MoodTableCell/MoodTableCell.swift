//
//  MoodTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 22.03.2022.
//

import UIKit

class MoodTableCell: UITableViewCell {
    
    @IBOutlet weak var backVw: UIView! {
        didSet {
            backVw.layer.cornerRadius = 20
            backVw.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var chartBackVw: UIView! {
        didSet {
            chartBackVw.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    private lazy var backYAxis: CGFloat = {
        chartBackVw.bounds.height / 10
    }()
    private lazy var backXAxis: CGFloat = {
        chartBackVw.bounds.width / 7
    }()
    
    private var emojiArray = ["😀","😐","🙂","🤯","🙂","🙂"]
    private lazy var emojiPoints = [CGPoint(x: backXAxis, y: backYAxis * 2.5),
                                    CGPoint(x: backXAxis * 2, y: backYAxis * 7),
                                    CGPoint(x: backXAxis * 3, y: backYAxis * 5),
                                    CGPoint(x: backXAxis * 4.5, y: backYAxis * 8.5),
                                    CGPoint(x: backXAxis * 5.3, y: backYAxis * 5.5),
                                    CGPoint(x: backXAxis * 6, y: backYAxis * 5.5)]
    static let id = "MoodTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let chartShapeLayer = CAShapeLayer()
        chartShapeLayer.lineWidth = 2
        chartShapeLayer.lineCap = .round
        chartShapeLayer.fillColor = UIColor.clear.cgColor
        chartShapeLayer.strokeColor = clr(color: .intensivePurple)?.cgColor
        chartShapeLayer.strokeEnd = 1
        
        let path = UIBezierPath()
        
        
        
        path.move(to: CGPoint(x: 5, y: backYAxis * 4 ))
//        path.addLine(to: CGPoint(x: backXAxis, y: backYAxis * 2.5))
//        path.addLine(to: CGPoint(x: backXAxis * 2, y: backYAxis * 7))
//        path.addLine(to: CGPoint(x: backXAxis * 3, y: backYAxis * 5))
//        path.addLine(to: CGPoint(x: backXAxis * 4.5, y: backYAxis * 8.5))
//        path.addLine(to: CGPoint(x: backXAxis * 5.3, y: backYAxis * 5.5))
//        path.addLine(to: CGPoint(x: backXAxis * 6, y: backYAxis * 5.5))
    
        for (index, point) in emojiPoints.enumerated() {
            path.addLine(to: point)
        }
        
       
        
        
        chartShapeLayer.path = path.cgPath
        chartBackVw.layer.addSublayer(chartShapeLayer)
        // Initialization code
        
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = clr(color: .chartPurple)!.cgColor
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [6, 4]
        let linePath = CGMutablePath()
        linePath.addLines(between: [CGPoint(x: backXAxis * 6, y: backYAxis * 5.5),
                                    CGPoint(x: backXAxis * 7, y: backYAxis * 3)])
        lineLayer.path = linePath
        chartBackVw.layer.addSublayer(lineLayer)
        
        for (index, point) in emojiPoints.enumerated() {
        var emojiLabel = UILabel(frame: CGRect(x: point.x - 10,
                                               y: point.y - 10,
                                               width: 20,
                                               height: 20))
        emojiLabel.text = emojiArray[index]
        chartBackVw.addSubview(emojiLabel)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
