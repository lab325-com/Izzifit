//
//  EnergyDrinkWaterCell.swift
//  izzifit
//
//  Created by Andrey S on 05.03.2022.
//

import UIKit

class EnergyDrinkWaterCell: UITableViewCell {

    @IBOutlet weak var waterStackView: UIStackView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var mlLeftLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: DrinkWidgetMainModel) {
        mainLabel.text = RLocalization.water_widget_title()
        
        waterStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for _ in 0..<model.doneCups {
            waterStackView.addArrangedSubview(UIImageView(image: RImage.energy_water_active_ic()))
        }
        
        for _ in model.doneCups..<model.totalCups {
            waterStackView.addArrangedSubview(UIImageView(image: RImage.energy_water_empty_ic()))
        }
        
        mlLeftLabel.text = RLocalization.water_widget_ml_left(model.left)
        countLabel.text = "\(model.energy)/\(model.energyTotal)"
    }
}
