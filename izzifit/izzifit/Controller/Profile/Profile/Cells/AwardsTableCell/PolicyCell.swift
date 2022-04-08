//
//  AwardsTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 22.03.2022.
//

import UIKit

class PolicyCell: UITableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet weak var activityBtn: UIButton!
    
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
        for (index, button) in buttonsCollection.enumerated() {
            button.setTitle(btnNames[index], for: .normal)
            button.setTitleColor(clr(color: .textTitleBlack),
                                 for: .normal)
            button.titleLabel!.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        }
        mainLbl.text = RLocalization.profile_awards()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
