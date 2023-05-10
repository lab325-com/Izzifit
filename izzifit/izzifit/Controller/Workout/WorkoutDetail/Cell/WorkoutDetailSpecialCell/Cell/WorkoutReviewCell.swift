//
//  WorkoutReviewCell.swift
//  izzifit
//
//  Created by mob325 on 03.08.2022.
//

import UIKit

class WorkoutReviewCell: UICollectionViewCell {

    @IBOutlet weak var lastStarImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(model: ReviewModel) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24
        descriptionLabel.attributedText = NSMutableAttributedString(string: model.text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        lastStarImageView.image = UIImage(named: model.isFive ? "workout_special_star_ic" : "workout_special_half_star_ic")
        
        nameLabel.text = model.name
    }
}
