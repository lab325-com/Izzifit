//
//  ProgressCell.swift
//  izzifit
//
//  Created by Andrey S on 11.03.2022.
//

import UIKit

class ProgressCell: UICollectionViewCell {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var progressTitle: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var circularProgressView: CircularProgressBarView!
    private var circularViewDuration: TimeInterval = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            let radius = (UIScreen.main.bounds.size.width - 48 - 60) / 7 - 5
            // set view
            self.circularProgressView = CircularProgressBarView(frame: .zero)
            self.circularProgressView.createCircularPath(backColor: UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 0.4), frontColor: UIColor(rgb: 0x7759B7), radius: radius / 2, lineWidth: 2)
            // align to the center of the screen
            self.circularProgressView.center = self.mainView.center
            
            // add this view to the view controller
            self.mainView.addSubview(self.circularProgressView)
        }
    }

    func setupCell(progress: CGFloat, isHidd) {
        mainView.isHidden =
        DispatchQueue.main.async {
            self.circularProgressView.progressAnimation(duration: self.circularViewDuration, toValue: progress / 100)
        }
        
        progressTitle.text = "\(Int(progress))"
    }
}
