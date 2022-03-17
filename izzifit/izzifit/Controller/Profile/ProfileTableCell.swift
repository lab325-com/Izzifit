//
//  ProfileTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 15.03.2022.
//

import UIKit

class ProfileTableCell: UITableViewCell {
    
    static let id = "ProfileCell"
    
    private let vw = UIView()
    private let caloriesLbl = UILabel()
    private let targetLbl = UILabel()
    private var chartCollectionVw: UICollectionView!
    
    private var zeroLbl = UILabel()
    private var fiveHundredLbl = UILabel()
    private var tenHundredLbl = UILabel()
    private var fifteenHundredLbl = UILabel()
    private var twentyHundredLbl = UILabel()
    private var twentyFiveHundredLbl = UILabel()
    private var labelsStackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionViewCreator()
        selectionStyle = .none
        setUI()
        layout()
    }
    
    private func collectionViewCreator() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 9,
                                 height: 88)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        
        chartCollectionVw = UICollectionView(frame: .zero,
                                             collectionViewLayout: layout)
        chartCollectionVw.backgroundColor = . clear
        chartCollectionVw.dataSource = self
        chartCollectionVw.delegate = self
        chartCollectionVw.register(CaloriesCollectionCell.self,
                                   forCellWithReuseIdentifier: CaloriesCollectionCell.id)
    }
    
    private func setUI() {
        
        vw.backgroundColor = clr(color: .profileCellBack)
        vw.layer.cornerRadius = 20
        vw.layer.masksToBounds = true
        
        ui.setLabel(label: caloriesLbl,
                    labelText: "Calories",
                    textColor: clr(color: .textTitleBlack),
                    textAlignment: .left,
                    fontSize: 18,
                    fontName: "Inter-Medium")
        
        ui.setLabel(label: targetLbl,
                    labelText: "Target",
                    textColor: clr(color: .pinkTarget),
                    textAlignment: .left,
                    fontSize: 9,
                    fontName: "Inter-Regular")
        
    }
    
    private func layout() {
        
        ui.genericlLayout(object: vw,
                          parentView: self,
                          topC: 4,
                          bottomC: 4,
                          leadingC: wRatio(cW: 16),
                          trailingC: wRatio(cW: 16))
        
        ui.genericlLayout(object: caloriesLbl,
                          parentView: vw,
                          topC: 16,
                          leadingC: 16)
        
        ui.layout(collectionView: chartCollectionVw,
                  view: vw,
                  width: wRatio(cW: 279),
                  height: 88,
                  leadingC: wRatio(cW: 16),
                  topToO: caloriesLbl.bottomAnchor,
                  topCG: 13)
        
        let lineLayer = CAShapeLayer()
             lineLayer.strokeColor = clr(color: .pinkTarget)!.cgColor
             lineLayer.lineWidth = 1
             lineLayer.lineDashPattern = [6, 4]
             let path = CGMutablePath()
             path.addLines(between: [CGPoint(x: wRatio(cW: 16), y: 93),
                                     CGPoint(x: wRatio(cW: 288), y: 93)])
             lineLayer.path = path
             vw.layer.addSublayer(lineLayer)
        
        ui.genericlLayout(object: targetLbl,
                          parentView: chartCollectionVw,
                          topC: 17,
                          leadingC: 0)
        
        labelsStackView = UIStackView(arrangedSubviews: [twentyFiveHundredLbl, twentyHundredLbl, fifteenHundredLbl, tenHundredLbl, fiveHundredLbl, zeroLbl])
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .equalSpacing
        
        let labelsArray = [zeroLbl, fiveHundredLbl, tenHundredLbl, fifteenHundredLbl, twentyHundredLbl, twentyFiveHundredLbl]
        let hundreds = ["0", "500", "1000", "1500", "2000", "2500"]
        
        for (index, item) in labelsArray.enumerated() {
            item.translatesAutoresizingMaskIntoConstraints = false
            ui.setLabel(label: item,
                        labelText: hundreds[index],
                        textColor: clr(color: .grayText),
                        textAlignment: .left,
                        fontSize: 9,
                        fontWeight: .regular)
        }

        
        ui.genericlLayout(object: labelsStackView,
                          parentView: vw,
                          width: 44,
                          height: 90,
                          centerVtoO: chartCollectionVw.centerYAnchor,
                          leadingToO: chartCollectionVw.trailingAnchor)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // Int((wRatio(cW: 279)) / 9)
        31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CaloriesCollectionCell.id,
                                                      for: indexPath) as! CaloriesCollectionCell
        cell.strokeEnd = Double(Int(arc4random_uniform(50)) / 100  )
        return cell
    }
}
