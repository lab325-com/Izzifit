//
//  DietSectionCell.swift
//  izzifit
//
//  Created by Andrey S on 05.08.2022.
//

import UIKit

class DietSectionCell: UITableViewHeaderFooterView {

    @IBOutlet weak var cornerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        cornerView.clipsToBounds = true
        cornerView.layer.cornerRadius = 10
        cornerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    
}
