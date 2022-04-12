//
//  MenuLogoutCell.swift
//  izzifit
//
//  Created by Andrey S on 11.04.2022.
//

import UIKit

protocol MenuLogoutCellDeleagate: AnyObject {
    func menuLogoutCell(cell: MenuLogoutCell)
}

class MenuLogoutCell: UITableViewCell {

    @IBOutlet weak var logOutButton: UIButton!
    
    weak var delegate: MenuLogoutCellDeleagate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionLogOut(_ sender: UIButton) {
        delegate?.menuLogoutCell(cell: self)
    }
    
}
