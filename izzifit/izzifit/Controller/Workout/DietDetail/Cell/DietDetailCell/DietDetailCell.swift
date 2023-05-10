//
//  DietDetailCell.swift
//  izzifit
//
//  Created by mob325 on 05.08.2022.
//

import UIKit

class DietDetailCell: UITableViewCell {
    
    @IBOutlet weak var specialView: UIView!
    @IBOutlet weak var lastMonthLabel: UILabel!
    @IBOutlet weak var averageWeekLabel: UILabel!
    
    @IBOutlet weak var yogaInstructarLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var hotSummerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        specialView.clipsToBounds = true
        specialView.layer.cornerRadius = 4
        specialView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        

        let attrsItalic1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Italic", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xA3A1AF)]
        
        let attrsItalic2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        
        
        let attributedString5 = NSMutableAttributedString(string: "It was made by certified yoga\ninstructor ", attributes:attrsItalic1 as [NSAttributedString.Key : Any])
        let attributedString6 = NSMutableAttributedString(string:"Faut", attributes:attrsItalic2 as [NSAttributedString.Key : Any])
        attributedString5.append(attributedString6)
        
        yogaInstructarLabel.attributedText = attributedString5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(model: DietPlanModel?) {
        if model?.isAvailable == true || KeychainService.standard.me?.Subscription != nil {
            hotSummerView.isHidden = true
        } else {
            hotSummerView.isHidden = false
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24
        descriptionLabel.attributedText = NSMutableAttributedString(string: model?.description ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0xA3A1AF)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Bold", size: 12), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        
        let attributedString3 = NSMutableAttributedString(string: "Average weekly\nweight loss ", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attributedString4 = NSMutableAttributedString(string:"-\(model?.kgLosePerWeek ?? 0)kg", attributes:attrs2 as [NSAttributedString.Key : Any])
        attributedString3.append(attributedString4)
        
        averageWeekLabel.attributedText = attributedString3
        
        let attributedString1 = NSMutableAttributedString(string: "Last month\npurchased ", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:"34 817", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        
        
        lastMonthLabel.attributedText = attributedString1
        
    }
    
}
