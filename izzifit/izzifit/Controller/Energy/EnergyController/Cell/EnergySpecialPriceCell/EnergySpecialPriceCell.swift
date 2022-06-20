//
//  EnergySpecialPriceCell.swift
//  izzifit
//
//  Created by Andrey S on 16.06.2022.
//

import UIKit
import StoreKit
import SwiftyStoreKit

protocol EnergySpecialPriceCellDelegate: AnyObject {
    func energySpecialPriceSelect(cell: EnergySpecialPriceCell)
}


class EnergySpecialPriceCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startWorkoutButton: UIButton!
    @IBOutlet weak var specialView: UIView!

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    weak var delegate: EnergySpecialPriceCellDelegate?
    
    private var paymentsInfo = [PaymentsModel]()
    
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
        
        retriveNotAutoProduct(id: ["izzifit_paid_master_class_1"])
    }
    
    @IBAction func actionStartWokout(_ sender: UIButton) {
        delegate?.energySpecialPriceSelect(cell: self)
    }
    
    private func retriveNotAutoProduct(id: Set<String>) {
        func setPrice() {
            priceLabel.isHidden = false
            discountLabel.isHidden = false
            
            priceLabel.text = paymentsInfo.first?.prettyPrice ?? ""
            
            let dicount = Int(paymentsInfo.first?.price ?? 0)
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$\(dicount * 2).99")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
            
            discountLabel.attributedText = attributeString
        }
        
        if paymentsInfo.count == id.count  {
            setPrice()
            return
        }
        
        SwiftyStoreKit.retrieveProductsInfo(id) { [weak self] results in
            if let invalidProductId = results.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                return
            }
            
            for product in results.retrievedProducts {
                if let priceString = product.localizedPrice
                    {
                    
                    let model = PaymentsModel(product: product.productIdentifier, prettyPrice: priceString, period: "", number: 0, price: product.price.doubleValue, currencySymbol: product.priceLocale.currencySymbol)
                    self?.paymentsInfo.append(model)
                } else {
                    debugPrint(">>>>>>>>>>>>>>>>>>>incorrect product!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                }
            }
            
            if self?.paymentsInfo.count == id.count {
                setPrice()
            }
        }
    }
}
