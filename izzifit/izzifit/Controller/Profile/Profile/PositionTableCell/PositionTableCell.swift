//
//  PositionTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 18.03.2022.
//

import UIKit

class PositionTableCell: UITableViewCell {

    static let id = "PositionTableCell"
    
    @IBOutlet weak var backVw: UIView! {
        didSet{
            backVw.layer.masksToBounds = true
            backVw.layer.cornerRadius = 20
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
