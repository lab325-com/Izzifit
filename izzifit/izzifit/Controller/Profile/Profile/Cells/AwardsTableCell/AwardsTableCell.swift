//
//  AwardsTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 22.03.2022.
//

import UIKit

class AwardsTableCell: UITableViewCell {

    static let id = "AwardsTableCell"
    var btnNames = [RLocalization.profile_privacy_policy(),
                    RLocalization.profile_terms_of_use(),
                    RLocalization.profile_write_to_us()]
    @IBOutlet weak var mainLbl: UILabel! {
        didSet{
            mainLbl.text = RLocalization.profile_awards()
        }
    }
    @IBOutlet var buttonsCollection: [UIButton]! {
        didSet {
            for (index, button) in buttonsCollection.enumerated() {
                button.setTitle(btnNames[index], for: .normal)
                button.setTitleColor(clr(color: .textTitleBlack),
                                     for: .normal)
                button.titleLabel!.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            }
        }
    }
    @IBOutlet weak var activityBtn: UIButton! {
        didSet{
            activityBtn.titleLabel?.font = UIFont(name: "Inter-Medium",
                                                  size: 18)
            activityBtn.layer.cornerRadius = 24
            activityBtn.layer.masksToBounds = true
            activityBtn.layer.borderColor = clr(color: .chartPurple)?.cgColor
            activityBtn.layer.borderWidth = 2
            activityBtn.setTitleColor(clr(color: .textTitleBlack),
                                      for: .normal)
            activityBtn.setTitle(RLocalization.profile_add_your_activity(),
                                 for: .normal)
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
