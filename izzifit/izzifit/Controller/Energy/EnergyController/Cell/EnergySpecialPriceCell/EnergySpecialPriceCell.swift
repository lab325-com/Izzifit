//
//  EnergySpecialPriceCell.swift
//  izzifit
//
//  Created by Andrey S on 16.06.2022.
//

import UIKit
import Kingfisher

protocol EnergySpecialPriceCellDelegate: AnyObject {
    func energySpecialPriceSelect(cell: EnergySpecialPriceCell, model: WorkoutsWidgetMainModel)
    func energySpecialDietSelect(cell: EnergySpecialPriceCell, model: DietPlanModel)
}


class EnergySpecialPriceCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startWorkoutButton: UIButton!
    @IBOutlet weak var specialView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    weak var delegate: EnergySpecialPriceCellDelegate?
    
    private var model: WorkoutsWidgetMainModel?
    private var modelDiet: DietPlanModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        startWorkoutButton.layer.cornerRadius = 16
        startWorkoutButton.layer.borderWidth = 2
        startWorkoutButton.layer.borderColor = UIColor(rgb: 0xCCBEE9).cgColor
        
        specialView.clipsToBounds = true
        specialView.layer.cornerRadius = 4
        specialView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(model: WorkoutsWidgetMainModel, paymentInfo: PaymentsModel?) {
        self.modelDiet = nil
        self.model = model
        
        avatarImageView.kf.setImage(with: URL(string: model.Image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_ic(), options: [.transition(.fade(0.25))])

        nameLabel.text = model.title
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24
        descriptionLabel.attributedText = NSMutableAttributedString(string: model.shortDescription ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    func setupCell(model: DietPlanModel) {
        self.model = nil
        self.modelDiet = model
        
        avatarImageView.kf.setImage(with: URL(string: model.image.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_ic(), options: [.transition(.fade(0.25))])
        
        // draw the result in a label
        nameLabel.text = model.title
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24
        descriptionLabel.attributedText = NSMutableAttributedString(string: model.shortDescription ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    @IBAction func actionStartWokout(_ sender: UIButton) {
        if let model = model {
            delegate?.energySpecialPriceSelect(cell: self, model: model)
        }

        if let modelDiet = modelDiet {
            delegate?.energySpecialDietSelect(cell: self, model: modelDiet)
        }
    }
}
