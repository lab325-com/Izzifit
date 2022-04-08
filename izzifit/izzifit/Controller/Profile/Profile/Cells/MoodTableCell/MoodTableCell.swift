//
//  MoodTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 22.03.2022.
//

import UIKit
import CoreAudio

class MoodTableCell: UITableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet var dateLabelsCollection: [UILabel]!
    @IBOutlet weak var backVw: UIView!
    @IBOutlet weak var chartBackVw: UIView!
    @IBOutlet weak var moodLbl: UILabel!
    @IBOutlet weak var moodChartBackImgVw: UIImageView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    static let id = "MoodTableCell"
    
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
        selectionStyle = .none
        setup()
    }
    
    private func setup() {
        for (index, label) in dateLabelsCollection.enumerated() {
            label.tag = index
        }
        backVw.layer.cornerRadius = 20
        backVw.layer.masksToBounds = true
        chartBackVw.layer.backgroundColor = UIColor.clear.cgColor
        moodLbl.text = RLocalization.profile_mood()
    }
    
    func fillCellby(_ moods: [MoodsMainModel]) {
        
        let path = UIBezierPath()
        var labelPoints = [CGPoint]()
        path.move(to: CGPoint(x: 0,
                              y: backYAxis * 4))
        
        for (index, mood) in moods.enumerated() {
            if index < 6 {
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
                
                let cgPoint = CGPoint(x: currentX,
                                      y: currentY)
                labelPoints.append(cgPoint)
                dateLabelsCollection[index + 1].text = convertDate(mood.createdAt)
            }
        }
        
        for point in labelPoints {
            path.addLine(to: point)
        }
        
        chartShapeLayer.path = path.cgPath
        chartBackVw.layer.addSublayer(chartShapeLayer)
        
        for (index, point) in labelPoints.enumerated() {
            let emojiLabel = UILabel(frame: CGRect(x: point.x - CGFloat(chartBackVw.bounds.size.width / 28),
                                                   y: point.y - 10,
                                                   width: 20,
                                                   height: 20))
            emojiLabel.text = moods[index].mood.text
            chartBackVw.addSubview(emojiLabel)
        }
        
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = clr(color: .chartPurple)!.cgColor
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [6, 4]
        let linePath = CGMutablePath()
        linePath.addLines(between: [path.currentPoint,
                                    CGPoint(x: backXAxis * CGFloat(labelPoints.count + 1),
                                            y: backYAxis * 3)])
        lineLayer.path = linePath
        chartBackVw.layer.addSublayer(lineLayer)
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
