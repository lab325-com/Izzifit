//
//  ProgressCell.swift
//  izzifit
//
//  Created by mob325 on 11.03.2022.
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
            
            // set view
            self.circularProgressView = CircularProgressBarView(frame: .zero)
            
            // align to the center of the screen
            self.circularProgressView.center = self.mainView.center
            
            // add this view to the view controller
            self.mainView.addSubview(self.circularProgressView)
        }
    }

    func setupCell(progress: CGFloat, isHidden: Bool, day: Int, isToday: Bool = false) {
        mainView.isHidden = isHidden
        
        DispatchQueue.main.async {
            let radius = (UIScreen.main.bounds.size.width - 48 - 60) / 7 - 5
            
            if isToday {
                self.circularProgressView.createCircularPath(backColor: UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 0.4), frontColor: UIColor(rgb: 0xFF42A8), radius: radius / 2, lineWidth: 2)
            } else {
                self.circularProgressView.createCircularPath(backColor: UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 0.4), frontColor: UIColor(rgb: 0x7759B7), radius: radius / 2, lineWidth: 2)
            }
            
            self.circularProgressView.progressAnimation(duration: self.circularViewDuration, toValue: progress / 100)
        }
        
        progressTitle.text = "\(day)"
    }
}
