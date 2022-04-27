//
//  PositionTableCell.swift
//  izzifit
//
//  Created by Oleh Study on 18.03.2022.
//

import UIKit

class PositionTableCell: BaseTableViewCell {

    static let id = "PositionTableCell"
    @IBOutlet weak var rankLbl: UILabel! {
        didSet {
            rankLbl.text = RLocalization.profile_rank()
        }
    }
    
    @IBOutlet weak var globalPositionLbl: UILabel! {
        didSet {
            globalPositionLbl.text = RLocalization.profile_global_position()
        }
    }
    
    @IBOutlet weak var countryPositionLbl: UILabel! {
        didSet {
            countryPositionLbl.text = RLocalization.profile_country_position()
        }
    }
    
    @IBOutlet weak var levelLbl: UILabel! {
        didSet {
            levelLbl.text = RLocalization.profile_level()
        }
    }
    
    
    @IBOutlet weak var backVw: UIView! {
        didSet{
            backVw.layer.masksToBounds = true
            backVw.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var rankCountLbl: UILabel!
    @IBOutlet weak var globalPositionCountLbl: UILabel!
    @IBOutlet weak var countryPositionCountLbl: UILabel!
    @IBOutlet weak var levelCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(by model: RankMainModel) {
        guard let rank = model.rank,
              let global = model.globalPosition,
              let country = model.countryPosition,
              let level = model.level else { return }
        rankCountLbl.text = String(rank)
        globalPositionCountLbl.text = String(global)
        countryPositionCountLbl.text = String(country)
        levelCountLbl.text = String(level)
    }
}
