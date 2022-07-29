//
//  WorkoutDetailDescriptionCell.swift
//  izzifit
//
//  Created by Andrey S on 28.03.2022.
//

import UIKit

protocol WorkoutDetailDescriptionProtocol: AnyObject {
    func workoutDetailDescriptionMuscle(cell: WorkoutDetailDescriptionCell, muscles: [String])
}

class WorkoutDetailDescriptionCell: BaseTableViewCell {
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainMuscleGroupsLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var musclesGroupLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var musclesView: UIView!
    @IBOutlet weak var priceView: UIView!
    
    
    weak var delegate: WorkoutDetailDescriptionProtocol?
    
    private var paymentsInfo = [PaymentsModel]()
    private var model: WorkoutByIdMainModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24

        mainTitleLabel.attributedText = NSMutableAttributedString(string: RLocalization.workout_detail_description(), attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        mainMuscleGroupsLabel.text = RLocalization.workout_detail_muscle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: WorkoutByIdMainModel?, isSpecial: Bool, paymentInfo: PaymentsModel?) {
        self.model = model
        
        musclesView.isHidden = isSpecial
        priceView.isHidden = !isSpecial
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24

        descriptionLabel.attributedText = NSMutableAttributedString(string: model?.description ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        musclesGroupLabel.text = model?.muscles?.compactMap({$0.name}).joined(separator: ", ")
        
        if let paymentInfo = paymentInfo, let model = model {
            setPrice(model: model, paymentInfo: paymentInfo)
        } else {
            priceLabel.isHidden = false
            discountLabel.isHidden = false
        }
    }
    
    @IBAction func actionMuscle(_ sender: UIButton) {
        guard let muscles = model?.muscles?.compactMap({$0.name}) else { return }
        delegate?.workoutDetailDescriptionMuscle(cell: self, muscles: muscles)
    }
    
    func setPrice(model: WorkoutByIdMainModel, paymentInfo: PaymentsModel) {
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
