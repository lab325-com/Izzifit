//
//  EnergySleepCell.swift
//  izzifit
//
//  Created by mob325 on 07.03.2022.
//

import UIKit

protocol EnergySleepCellProtocol: AnyObject {
    func energySleepCellSeleep(cell: EnergySleepCell, sleep: SleepQualityType)
}

class EnergySleepCell: BaseTableViewCell {

    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    weak var delegate: EnergySleepCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTitleLabel.text = RLocalization.energy_sleep_title()
        goodButton.setTitle(RLocalization.energy_sleep_good(), for: .normal)
        badButton.setTitle(RLocalization.energy_sleep_bad(), for: .normal)
        
        goodButton.layer.borderWidth = 2
        
        
        badButton.layer.borderWidth = 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(model: SleepWidgetMainModel) {
        countLabel.text = "\(model.energy ?? 0)/\(model.energyTotal ?? 0)"
        
        switch model.quality {
        case .sleepQualityTypeGood:
            goodButton.layer.borderColor = UIColor(rgb: 0xFF42A8).cgColor
            badButton.layer.borderColor = UIColor(rgb: 0xCCBEE9).cgColor
        case .sleepQualityTypeBad:
            badButton.layer.borderColor = UIColor(rgb: 0xFF42A8).cgColor
            goodButton.layer.borderColor = UIColor(rgb: 0xCCBEE9).cgColor
        default:
            badButton.layer.borderColor = UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 1).cgColor
            goodButton.layer.borderColor = UIColor(red: 0.8, green: 0.745, blue: 0.914, alpha: 1).cgColor
        }
        
    }
    
    @IBAction func actionGood(_ sender: UIButton) {
        AudioManager.sharedManager.playSound()
        delegate?.energySleepCellSeleep(cell: self, sleep: .sleepQualityTypeGood)
    }
    
    @IBAction func actionBad(_ sender: UIButton) {
        AudioManager.sharedManager.playSound()
        delegate?.energySleepCellSeleep(cell: self, sleep: .sleepQualityTypeBad)
    }
}
