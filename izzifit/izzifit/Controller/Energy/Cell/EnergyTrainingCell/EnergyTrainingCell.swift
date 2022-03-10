//
//  EnergyTrainingCell.swift
//  izzifit
//
//  Created by Andrey S on 10.03.2022.
//

import UIKit

enum EnergyTrainingType {
    case startTraining
    case continueTraining
    case training
    
    var text: String {
        switch self {
        case .startTraining:
            return RLocalization.energy_training_start_training()
        case .continueTraining:
            return RLocalization.energy_training_continue()
        case .training:
            return RLocalization.energy_training_training()
        }
    }
    
    func subTitle(minutes: Int) -> String {
        switch self {
        case .startTraining:
            return RLocalization.energy_training_next_workout(minutes)
        case .continueTraining:
            return ""
        case .training:
            return RLocalization.energy_training_excellent(minutes)
        }
    }
}

class EnergyTrainingCell: UITableViewCell {

    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var countEnergyLabel: UILabel!
    
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var describeLabel: UILabel!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var fromStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(type: EnergyTrainingType) {
        mainTitleLabel.text = type.text
        describeLabel.text = type.subTitle(minutes: 25)
        
        switch type {
        case .startTraining:
            describeLabel.isHidden = false
            fromLabel.isHidden = true
            fromStackView.isHidden = true
        case .continueTraining:
            describeLabel.isHidden = true
            fromLabel.isHidden = false
            fromStackView.isHidden = false
        case .training:
            describeLabel.isHidden = false
            fromLabel.isHidden = true
            fromStackView.isHidden = true
        }
    }
}
