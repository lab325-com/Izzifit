//
//  MoodTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 22.03.2022.
//

import UIKit

class MoodTableCell: UITableViewCell {
    
    static let id = "MoodTableCell"
    
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
    @IBOutlet weak var moodChartBackImgVw: UIImageView!
    
    private lazy var backYAxis: CGFloat = {
        chartBackVw.bounds.height / 10
    }()
    
    private lazy var backXAxis: CGFloat = {
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        


    }
    
    func fillCellby(_ moods: [MoodsMainModel]) {
        
        let path = UIBezierPath()
        var labelPoints = [CGPoint]()
        path.move(to: CGPoint(x: 0, y: backYAxis * 4 ))
        for (index, mood) in moods.enumerated() {
            guard mood.mood != nil else { return }
            let currentX = backXAxis * CGFloat(index + 1)
            var currentY: CGFloat = 0.0
            switch mood.mood {
            case .moodTypeGood:
                currentY = backYAxis * 2.5
            case .moodTypeBadly:
                currentY = backYAxis * 7.5
            case .moodTypeNotBad:
                currentY = backYAxis * 5.0
            default: break
            }
            let cgPoint = CGPoint(x: currentX, y: currentY)
            path.addLine(to: cgPoint)
            labelPoints.append(cgPoint)
            let emojiLabel = UILabel(frame: CGRect(x: cgPoint.x - CGFloat(chartBackVw.bounds.size.width / 28),
                                                   y: cgPoint.y - 10,
                                                   width: 20,
                                                   height: 20))
            emojiLabel.text = mood.mood?.text
            chartBackVw.addSubview(emojiLabel)
        }
        chartShapeLayer.path = path.cgPath
        moodChartBackImgVw.layer.addSublayer(chartShapeLayer)
        
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = clr(color: .chartPurple)!.cgColor
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [6, 4]
        let linePath = CGMutablePath()
        
        linePath.addLines(between: [path.currentPoint,
                                    CGPoint(x: backXAxis * CGFloat(moods.count + 1),
                                            y: backYAxis * 3)])
        lineLayer.path = linePath
        chartBackVw.layer.addSublayer(lineLayer)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
