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

        let targetInt = correlateValueToY(model.target)
        let path = CGMutablePath()
        
        path.addLines(between: [CGPoint(x: 0 , y: targetInt),
                                CGPoint(x: CGFloat(31 * 45), y: targetInt ) ])
        lineLayer.path = path
        chartCollectionView.layer.addSublayer(lineLayer)
        targetLbl.text = RLocalization.profile_target()
        targetLbl.topAnchor.constraint(equalTo: chartCollectionView.topAnchor,
                                       constant: targetInt - 13).isActive = true
        
        let hundredthTarget = CGFloat(model.target) * 0.00001
        
        for item in model.Calories {
            
            let hundredthCount = CGFloat(item.amount) * 0.00001
            
            let newCaloriesItem = CaloriesObjectModel(count: hundredthCount,
                                                      stringDate: convertDate(item.createdAt),
                                                      target: hundredthTarget)
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
    
  private func correlateValueToY(_ targetAmount: Int) -> CGFloat  {
        
        let decimalTargetAmount = Int(Float(targetAmount) * 0.001)
        
        let oneHundredth: CGFloat = CGFloat(decimalTargetAmount) / 100
        
        let verticalPointAmount: CGFloat = CGFloat(oneHundredth) * 83 // 83 - chartCollectionview height
        
        let residualValue: CGFloat = 83 - verticalPointAmount
        
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
