//
//  FoodTopTitleCell.swift
//  izzifit
//
//  Created by mob325 on 15.03.2022.
//

import UIKit
import Kingfisher

protocol FoodTopTitleDelegate: AnyObject {
    func foodTopTitleSelectDiet(cell: FoodTopTitleCell, model: DietPlanModel)
}

class FoodTopTitleCell: UITableViewHeaderFooterView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dietView: UIView!
    
    @IBOutlet weak var dietImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var energyDietLabel: UILabel!
    @IBOutlet weak var specialView: UIView!
    
    weak var delegate: FoodTopTitleDelegate?
    
    var dietModel: DietPlanModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        specialView.clipsToBounds = true
        specialView.layer.cornerRadius = 4
        specialView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func cellSetup(dietModel: DietPlanModel) {
        self.dietModel = dietModel
        
        mainTitleLabel.text = dietModel.title
        energyDietLabel.text = "\(dietModel.energyTotal ?? 0)"
        
        dietImageView.kf.setImage(with: URL(string: dietModel.image.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_ic(), options: [.transition(.fade(0.25))])
    }
    
    @IBAction func actionSelectDiet(_ sender: UIButton) {
        if let dietModel = dietModel {
            delegate?.foodTopTitleSelectDiet(cell: self, model: dietModel)
        }
    }
}
