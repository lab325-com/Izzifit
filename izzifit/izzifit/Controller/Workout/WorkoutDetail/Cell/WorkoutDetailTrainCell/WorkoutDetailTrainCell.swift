//
//  WorkoutDetailTrainCell.swift
//  izzifit
//
//  Created by Andrey S on 29.03.2022.
//

import UIKit
import Kingfisher

class WorkoutDetailTrainCell: BaseTableViewCell {

    @IBOutlet weak var globalStackView: UIStackView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var trainingLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var describeLabel: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var bottomSeparatorView: UIView!
    @IBOutlet weak var separatorLeadingConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var restingView: UIView!
    @IBOutlet weak var exercisesView: UIView!
    @IBOutlet weak var restingDurationLabel: UILabel!
    @IBOutlet weak var restingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        restingLabel.text = RLocalization.workout_detail_resting()
        restingView.clipsToBounds = true
        restingView.layer.cornerRadius = 10
        restingView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: ExerciseModel, isSelected: Bool, isHiddenSepate: Bool) {
        bottomSeparatorView.isHidden = isHiddenSepate
        
        avatarImageView.kf.setImage(with: URL(string: model.image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_two_ic(), options: [.transition(.fade(0.25))])
        
        mainImageView.kf.setImage(with: URL(string: model.image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_two_ic(), options: [.transition(.fade(0.25))])
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.34

        describeLabel.attributedText = NSMutableAttributedString(string: model.description ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        trainingLabel.text = model.title
        
        durationLabel.text = model.duration?.time
        
        //if bottomView.isHidden != !isSelected {
            bottomView.isHidden = !isSelected
          //  globalStackView.layoutIfNeeded()
        //}
        restingView.isHidden = !(model.isRest ?? false)
        exercisesView.isHidden = model.isRest ?? false
        whiteView.isHidden = !isSelected
        
        separatorLeadingConstraints.constant = !isSelected ? 112 : 16
        
        restingDurationLabel.text = model.duration?.time
    }
}
