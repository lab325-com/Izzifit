//
//  ChartTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 16.03.2022.
//

import UIKit

class ChartTableCell: UITableViewCell {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var titleLbl: UILabel! {
        didSet {
            titleLbl.text = RLocalization.profile_calories()
        }
    }
    @IBOutlet weak var targetLbl: UILabel! {
        didSet {
            targetLbl.text = RLocalization.profile_target()
        }
    }
    
    private let floatMultiplier: Float = 0.00001
    
    @IBOutlet weak var backVw: UIView!
    @IBOutlet weak var chartCollectionView: UICollectionView!
    private var lineLayer: CAShapeLayer = {
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [6, 4]
        lineLayer.strokeColor =  UIColor(named: Clrs.pinkTarget.rawValue)?.cgColor
        return lineLayer
    }()
    
    static let id = "ChartTableCell"
    private var caloriesCellCount = 31
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backVw.clipsToBounds = true
        backVw.layer.cornerRadius = 20
        chartCollectionView.showsVerticalScrollIndicator = false
        chartCollectionView.backgroundColor = . clear
        chartCollectionView.dataSource = self
        chartCollectionView.delegate = self
        chartCollectionView.register(UINib(nibName: "ChartCollectionCell", bundle: nil),
                                     forCellWithReuseIdentifier: ChartCollectionCell.id)
        
       
 
    }
    
    func fillCellBy(_ model: CaloriesWidgetMainModel) {
        // Cast to Float
    
        let floatTarget = Float(model.target) * floatMultiplier
        let targetInt: CGFloat = CGFloat(model.target) * 0.0001
        
        let path = CGMutablePath()
        
        let y = chartCollectionView.bounds.size.height / 2 - 10
             path.addLines(between: [CGPoint(x: 0 , y: y),
                                     CGPoint(x: CGFloat(31 * 45), y: y)])
             lineLayer.path = path
             chartCollectionView.layer.addSublayer(lineLayer)
    }
}

extension ChartTableCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        caloriesCellCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionCell.id,
                                                      for: indexPath) as! ChartCollectionCell
       cell.strokeEnd = Double(Int(arc4random_uniform(50)) / 100  )
        return cell
    }
}

extension ChartTableCell: UICollectionViewDelegateFlowLayout {
    
}
