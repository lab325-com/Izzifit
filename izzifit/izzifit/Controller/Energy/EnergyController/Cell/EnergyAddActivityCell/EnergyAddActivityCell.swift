//
//  EnergyAddActivityCell.swift
//  izzifit
//
//  Created by mob325 on 14.03.2022.
//

import UIKit

class EnergyAddActivityCell: BaseTableViewCell {

    @IBOutlet weak var addActivityButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addActivityButton.layer.borderWidth = 2
        addActivityButton.layer.borderColor = UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 1).cgColor
        addActivityButton.setTitle(RLocalization.progress_activity(), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
