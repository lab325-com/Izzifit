//
//  MenuFoodTitleCellCell.swift
//  izzifit
//
//  Created by mob325 on 23.02.2022.
//

import UIKit

class MenuFoodTitleCellCell: BaseTableViewCell {

    @IBOutlet weak var mainTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(title: String) {
        mainTitleLabel.text = title
    }
}
