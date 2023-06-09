//
//  FoodRecomendedCell.swift
//  izzifit
//
//  Created by mob325 on 15.03.2022.
//

import UIKit
import Kingfisher

protocol FoodRecomendedProtocol: AnyObject {
    func foodRecomendedAdd(cell: FoodRecomendedCell, isUpdate: Bool, model: ProductsMainModel)
}

class FoodRecomendedCell: BaseTableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var protLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    
    @IBOutlet weak var grammLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    
    weak var delegate: FoodRecomendedProtocol?
    private var isActive: Bool?
    private var model: ProductsMainModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: ProductsMainModel, isActive: Bool, isHiddenBottom: Bool) {
        self.isActive = isActive
        self.model = model
        
        bottomView.isHidden = isHiddenBottom
        protLabel.text = RLocalization.food_prot_description(model.ProductSources?.first(where: {$0?.name == .sourceEntityTypeProteins})??.amount ?? 0)
        
        fatsLabel.text = RLocalization.food_fats_description(model.ProductSources?.first(where: {$0?.name == .sourceEntityTypeFats})??.amount ?? 0)
        
        carbsLabel.text = RLocalization.food_carbs_description(model.ProductSources?.first(where: {$0?.name == .sourceEntityTypeCarbs})??.amount ?? 0)
        
        grammLabel.text = "\(model.amount ?? 0) \(model.measure?.text ?? "")"
        
        nameLabel.text = model.name
        
        avatarImageView.kf.setImage(with: URL(string: model.Image?.urlIosFull ?? ""), placeholder: RImage.placeholder_food_two_ic(), options: [.transition(.fade(0.25))])
        
        
        let image = isActive ? RImage.onboarding_selected_ic() : RImage.energy_meals_add_ic()
        
        addButton.setImage(image, for: .normal)
    }
    
    @IBAction func addProduct(_ sender: UIButton) {
        guard let isActive = isActive, let model = model else { return }
        
        delegate?.foodRecomendedAdd(cell: self, isUpdate: isActive, model: model)
    }
}
