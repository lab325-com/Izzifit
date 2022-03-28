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
    
    @IBOutlet weak var moodLbl: UILabel! {
        didSet {
            moodLbl.text = RLocalization.profile_mood()
        }
    }
    private lazy var backYAxis: CGFloat = {
        chartBackVw.bounds.height / 10
    }()
    private lazy var backXAxis: CGFloat = {
        chartBackVw.bounds.size.width / 6.6
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
    
    private var emojiArray = ["😀","😐","🙂","😀","🙂","🙂"]
    private lazy var emojiPoints = [CGPoint]()
    static let id = "MoodTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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

    }
    
    func fillCellby(_ moods: [MoodsMainModel]) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: backYAxis * 4 ))
        
        for (index, mood) in moods.enumerated() {
            
            let currentX = backXAxis * CGFloat(index + 1)
            var currentY: CGFloat = 0.0
            switch mood.mood {
            case .moodTypeGood:
                currentY = backYAxis * 7.5
            case .moodTypeBadly:
                currentY = backYAxis * 5.0
            case .moodTypeNotBad:
                currentY = backYAxis * 2.5
            default: break
            }
            let cgPoint = CGPoint(x: currentX, y: currentY)
            path.move(to: cgPoint)
            
            let emojiLabel = UILabel(frame: CGRect(x: cgPoint.x - CGFloat(chartBackVw.bounds.size.width / 28),
                                                   y: cgPoint.y - 10 ,
                                                   width: 20,
                                                   height: 20))
            emojiLabel.text = mood.mood!.rawValue
            chartBackVw.addSubview(emojiLabel)
        }
        chartShapeLayer.path = path.cgPath
        chartBackVw.layer.addSublayer(chartShapeLayer)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
