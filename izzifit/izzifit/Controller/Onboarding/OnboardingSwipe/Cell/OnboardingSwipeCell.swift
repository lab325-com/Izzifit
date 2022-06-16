//
//  OnboardingSwipeCell.swift
//  izzifit
//
//  Created by Andrey S on 15.06.2022.
//

import UIKit

class OnboardingSwipeCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(model: OnboardingSwipeModel) {
        mainImageView.image = UIImage(named: model.image)
        mainTitleLabel.text  = model.title
        headerLabel.text  = model.header
    }
}
