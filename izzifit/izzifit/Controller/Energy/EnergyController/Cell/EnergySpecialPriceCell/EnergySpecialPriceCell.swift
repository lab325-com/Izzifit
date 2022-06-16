//
//  EnergySpecialPriceCell.swift
//  izzifit
//
//  Created by Andrey S on 16.06.2022.
//

import UIKit

class EnergySpecialPriceCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startWorkoutButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        startWorkoutButton.layer.cornerRadius = 16
        startWorkoutButton.layer.borderWidth = 2
        startWorkoutButton.layer.borderColor = UIColor(rgb: 0xCCBEE9).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell() {
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Medium", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 11), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56, alpha: 0.4)]
        
        let fullString = NSMutableAttributedString(string: "Strengthening the muscles of the back and abs  ", attributes: attrs1 as [NSAttributedString.Key : Any])

        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "energy_water_flash_ic")

        let image1String = NSAttributedString(attachment: image1Attachment)

        fullString.append(image1String)
        
        let energy = NSAttributedString(string: " 200", attributes: attrs2 as [NSAttributedString.Key : Any])
        fullString.append(energy)

        // draw the result in a label
        nameLabel.attributedText = fullString
    }
}
