//
//  DietMealCell.swift
//  izzifit
//
//  Created by mob325 on 05.08.2022.
//

import UIKit
import Kingfisher

class DietMealCell: UITableViewCell {

    @IBOutlet weak var gradientView: Gradient!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var protLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    
    @IBOutlet weak var separatoView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(isShowGradient: Bool, scheduleMeals: ScheduleMealModel?, isHiddenSeparator: Bool) {
        separatoView.isHidden = isHiddenSeparator
        gradientView.isHidden = !isShowGradient
        
        guard let scheduleMeals = scheduleMeals else { return }
        
        mainImageView.kf.setImage(with: URL(string: scheduleMeals.image.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_ic(), options: [.transition(.fade(0.25))])
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.83
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56, alpha: 0.5), .paragraphStyle: paragraphStyle]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xA4A3BD, alpha: 0.5), .paragraphStyle: paragraphStyle]
        
        let protCount = NSMutableAttributedString(string: "\(scheduleMeals.prot)", attributes:attrs1 as [NSAttributedString.Key : Any])
        let prot = NSMutableAttributedString(string: " Prot", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        protCount.append(prot)
        protLabel.attributedText = protCount
        
        let fatsCount = NSMutableAttributedString(string: "\(scheduleMeals.fats)", attributes:attrs1 as [NSAttributedString.Key : Any])
        let fat = NSMutableAttributedString(string: " Fats", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        fatsCount.append(fat)
        fatsLabel.attributedText = fatsCount
        
        let carbsCount = NSMutableAttributedString(string: "\(scheduleMeals.carbs)", attributes:attrs1 as [NSAttributedString.Key : Any])
        let carb = NSMutableAttributedString(string: " Carb", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        carbsCount.append(carb)
        carbsLabel.attributedText = carbsCount
        
        mainTitleLabel.text = scheduleMeals.title
        descriptionLabel.text = scheduleMeals.description
        amountLabel.text = scheduleMeals.amount
    }
}
