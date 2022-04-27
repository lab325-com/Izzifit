//
//  AwardsTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 22.03.2022.
//

import UIKit

class PolicyCell: BaseTableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    @IBOutlet var buttonsCollection: [UIButton]!
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    static let id = "AwardsTableCell"
    private var btnNames = [RLocalization.profile_privacy_policy(),
                            RLocalization.profile_terms_of_use(),
                            RLocalization.profile_write_to_us()]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {

        for (index, button) in buttonsCollection.enumerated() {
            button.setTitle(btnNames[index], for: .normal)
            button.setTitleColor(clr(color: .textTitleBlack),
                                 for: .normal)
            button.titleLabel!.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
