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
    
    func setupCell(model: WorkoutsWidgetMainModel) {
        
        var type: EnergyTrainingType = .continueTraining
        
        if model.isFinished == true {
            type = .training
        } else if (model.totalFinishedExercises ?? 0) == 0 {
            type = .startTraining
        }
        
        mainTitleLabel.text = type.text
        describeLabel.text = type.subTitle(minutes: model.duration?.minutes ?? 0)
        
        switch type {
        case .startTraining:
            activityImage.isHidden = true
            describeLabel.isHidden = false
            fromLabel.isHidden = true
            fromStackView.isHidden = true
        case .continueTraining:
            fromStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
            
            for index in 0..<(model.totalExercises ?? 0) {
                let view = UIView()
                if (model.totalFinishedExercises ?? 0) > index {
                    view.backgroundColor = UIColor(rgb: 0x513A84)
                } else {
                    view.backgroundColor = UIColor(rgb: 0x513A84, alpha: 0.1)
                }
                
                if index == 0 {
                    view.layer.cornerRadius = 4
                    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                } else if index == (model.totalExercises ?? 0) - 1 {
                    view.layer.cornerRadius = 4
                    view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                }
                
                fromStackView.addArrangedSubview(view)
            }
            
            
            fromLabel.text = "\(model.totalFinishedExercises ?? 0) form \(model.totalExercises ?? 0)"
            activityImage.isHidden = true
            describeLabel.isHidden = true
            fromLabel.isHidden = false
            fromStackView.isHidden = false
        case .training:
            activityImage.isHidden = false
            describeLabel.isHidden = false
            fromLabel.isHidden = true
            fromStackView.isHidden = true
        }
    }
}
