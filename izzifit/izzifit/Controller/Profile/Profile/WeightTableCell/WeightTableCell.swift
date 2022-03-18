//
//  WeightTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 18.03.2022.
//

import UIKit

class WeightTableCell: UITableViewCell {

    @IBOutlet weak var backVw: UIView! {
        didSet{
            backVw.layer.masksToBounds = true
            backVw.layer.cornerRadius = 20
        }
    }
    static let id = "WeightTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
