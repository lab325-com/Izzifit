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
    
    @IBOutlet weak var backVw: UIView!
    @IBOutlet weak var chartCollectionView: UICollectionView!
    
    static let id = "ChartTableCell"
    
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
        
        let lineLayer = CAShapeLayer()
             lineLayer.strokeColor = clr(color: .pinkTarget)!.cgColor
             lineLayer.lineWidth = 1
             lineLayer.lineDashPattern = [6, 4]
             let path = CGMutablePath()
             path.addLines(between: [CGPoint(x: wRatio(cW: 16), y: 88),
                                     CGPoint(x: chartCollectionView.bounds.size.width + 16, y: 88)])
             lineLayer.path = path
             backVw.layer.addSublayer(lineLayer)
    }
}

extension ChartTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionCell.id,
                                                      for: indexPath) as! ChartCollectionCell
       cell.strokeEnd = Double(Int(arc4random_uniform(50)) / 100  )
        return cell
    }
}
