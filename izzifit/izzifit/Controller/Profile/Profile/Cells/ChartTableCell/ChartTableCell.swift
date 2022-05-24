//
//  ChartTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 16.03.2022.
//

import UIKit

struct CaloriesObjectModel {
    var count: Double
    var stringDate: String
    var target: CGFloat
}

class ChartTableCell: BaseTableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    @IBOutlet weak var titleLbl: UILabel! {
        didSet {
            titleLbl.text = RLocalization.profile_calories()
        }
    }
    @IBOutlet weak var targetLbl: UILabel!
    @IBOutlet weak var backVw: UIView!
    @IBOutlet weak var chartCollectionView: UICollectionView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    private var lineLayer: CAShapeLayer = {
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [6, 4]
        lineLayer.strokeColor =  UIColor(named: Clrs.pinkTarget.rawValue)?.cgColor
        return lineLayer
    }()
    
    private var calories = [CaloriesObjectModel]()
    
    static let id = "ChartTableCell"
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backVw.clipsToBounds = true
        backVw.layer.cornerRadius = 20
        chartCollectionView.showsVerticalScrollIndicator = false
        chartCollectionView.backgroundColor = .clear
        chartCollectionView.dataSource = self
        chartCollectionView.delegate = self
        chartCollectionView.register(UINib(nibName: "ChartCollectionCell", bundle: nil),
                                     forCellWithReuseIdentifier: ChartCollectionCell.id)
    }
    
    func fillCellBy(_ model: CaloriesWidgetMainModel) {

        let targetInt = calculateMeasureY(value: CGFloat(model.target))
        let path = CGMutablePath()
        
        path.addLines(between: [CGPoint(x: 0 , y: targetInt),
                                CGPoint(x: CGFloat(31 * 45), y: targetInt ) ])
        lineLayer.path = path
        chartCollectionView.layer.addSublayer(lineLayer)
        targetLbl.text = RLocalization.profile_target()
        targetLbl.topAnchor.constraint(equalTo: chartCollectionView.topAnchor,
                                       constant: targetInt - 13).isActive = true

        for item in model.Calories {
        
            let newCaloriesItem = CaloriesObjectModel(count: CGFloat(item.amount),
                                                      stringDate: convertDate(item.createdAt),
                                                      target: CGFloat(model.target))
            calories.append(newCaloriesItem)
        }
        
        chartCollectionView.reloadData()
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

}

//----------------------------------------------
// MARK: - UICollectionViewDataSource
//----------------------------------------------

extension ChartTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        calories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionCell.id,
                                                      for: indexPath) as! ChartCollectionCell
        cell.fillCellBy(calories[indexPath.row])
        return cell
    }
}

extension ChartTableCell: UICollectionViewDelegateFlowLayout { }
