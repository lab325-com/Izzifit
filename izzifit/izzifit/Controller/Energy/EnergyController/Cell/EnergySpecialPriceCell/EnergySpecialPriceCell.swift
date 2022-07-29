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
}


class EnergySpecialPriceCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startWorkoutButton: UIButton!
    @IBOutlet weak var specialView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    weak var delegate: EnergySpecialPriceCellDelegate?
    
    private var model: WorkoutsWidgetMainModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        startWorkoutButton.layer.cornerRadius = 16
        startWorkoutButton.layer.borderWidth = 2
        startWorkoutButton.layer.borderColor = UIColor(rgb: 0xCCBEE9).cgColor
        
        specialView.clipsToBounds = true
        specialView.layer.cornerRadius = 4
        specialView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        priceLabel.isHidden = true
        discountLabel.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(model: WorkoutsWidgetMainModel, paymentInfo: PaymentsModel?) {
        self.model = model
        timeLabel.text = "\(model.duration?.minutes ?? 0) min"
        avatarImageView.kf.setImage(with: URL(string: model.Image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_ic(), options: [.transition(.fade(0.25))])
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Medium", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 11), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56, alpha: 0.4)]
        
        let fullString = NSMutableAttributedString(string: "\(model.title ?? "")  ", attributes: attrs1 as [NSAttributedString.Key : Any])

        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "energy_water_flash_ic")

        let image1String = NSAttributedString(attachment: image1Attachment)

        fullString.append(image1String)
        
        let energy = NSAttributedString(string: " \(model.energyTotal ?? 0)", attributes: attrs2 as [NSAttributedString.Key : Any])
        fullString.append(energy)

        // draw the result in a label
        nameLabel.attributedText = fullString
        
        if let paymentInfo = paymentInfo {
            setPrice(model: model, paymentInfo: paymentInfo)
        } else {
            priceLabel.isHidden = false
            discountLabel.isHidden = false
        }
    }
    
    @IBAction func actionStartWokout(_ sender: UIButton) {
        guard let model = model else {
            return
        }

        delegate?.energySpecialPriceSelect(cell: self, model: model)
    }
    
    func setPrice(model: WorkoutsWidgetMainModel, paymentInfo: PaymentsModel) {
        if KeychainService.standard.me?.Subscription != nil {
            priceLabel.isHidden = false
            discountLabel.isHidden = false
            
            priceLabel.text = "Free"
            
            let dicount = Int(paymentInfo.price)
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$\(dicount).99")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
            
            discountLabel.attributedText = attributeString
            
        } else if model.isAvailable != true {
            priceLabel.isHidden = false
            discountLabel.isHidden = false
            
            priceLabel.text = paymentInfo.prettyPrice
            
            let dicount = Int(paymentInfo.price)
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$\(dicount * 2).99")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
            
            discountLabel.attributedText = attributeString
        } else {
            priceLabel.isHidden = true
            discountLabel.isHidden = true
        }
    }
}
