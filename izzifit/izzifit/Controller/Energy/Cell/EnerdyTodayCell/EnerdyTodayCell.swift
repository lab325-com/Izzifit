//
//  EnerdyTodayCell.swift
//  izzifit
//
//  Created by Andrey S on 04.03.2022.
//

import UIKit

class EnerdyTodayCell: UITableViewCell {

    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var middleGoodView: UIView!
    @IBOutlet weak var moreGoodView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        progressView.layer.cornerRadius = 4
        progressView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        moreGoodView.layer.cornerRadius = 4
        moreGoodView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
