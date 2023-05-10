//
//  MenuDeleteAccount.swift
//  izzifit
//
//  Created by mob325 on 27.05.2022.
//

import UIKit

protocol MenuDeleteAccountDelegate: AnyObject {
    func menuDeleteAccount(cell: MenuDeleteAccount)
}

class MenuDeleteAccount: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    weak var delegate: MenuDeleteAccountDelegate?
    
    @IBAction func actionDeleteAccount(_ sender: UIButton) {
        delegate?.menuDeleteAccount(cell: self)
    }
}
