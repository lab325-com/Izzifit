//
//  EnergyMoodCell.swift
//  izzifit
//
//  Created by Andrey S on 07.03.2022.
//

import UIKit

class EnergyMoodCell: UITableViewCell {

    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var notBadLabel: UILabel!
    @IBOutlet weak var badlyLabel: UILabel!
    
    @IBOutlet weak var goodView: UIView!
    @IBOutlet weak var notBadView: UIView!
    @IBOutlet weak var badlyView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainTitleLabel.text = RLocalization.energy_mood_title()
        
        goodLabel.text = RLocalization.energy_mood_good()
        notBadLabel.text = RLocalization.energy_mood_not_bad()
        badlyLabel.text = RLocalization.energy_mood_badly()
        
        goodView.layer.cornerRadius = 20
        notBadView.layer.cornerRadius = 20
        badlyView.layer.cornerRadius = 20
        
        goodView.layer.borderWidth = 2
        notBadView.layer.borderWidth = 2
        badlyView.layer.borderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: MoodWidgetMainModel) {
        countLabel.text = "\(model.energy ?? 0)/\(model.energyTotal ?? 0)"
        
        switch model.mood {
        case .moodTypeGood:
            goodView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            notBadView.layer.borderColor = UIColor.clear.cgColor
            badlyView.layer.borderColor = UIColor.clear.cgColor
        case .moodTypeNotBad:
            goodView.layer.borderColor = UIColor.clear.cgColor
            notBadView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
            badlyView.layer.borderColor = UIColor.clear.cgColor
        case .moodTypeBadly:
            goodView.layer.borderColor = UIColor.clear.cgColor
            notBadView.layer.borderColor = UIColor.clear.cgColor
            badlyView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
        default:
            goodView.layer.borderColor = UIColor.clear.cgColor
            notBadView.layer.borderColor = UIColor.clear.cgColor
            badlyView.layer.borderColor = UIColor.clear.cgColor
        }
       
    }
}
