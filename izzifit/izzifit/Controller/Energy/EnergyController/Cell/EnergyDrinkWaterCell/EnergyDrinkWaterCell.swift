//
//  EnergyDrinkWaterCell.swift
//  izzifit
//
//  Created by Andrey S on 05.03.2022.
//

import UIKit

protocol EnergyDrinkWaterProtocol: AnyObject {
    func energyDrinkWaterSelectIndex(cell: EnergyDrinkWaterCell, index: Int)
}

class EnergyDrinkWaterCell: UITableViewCell {

    @IBOutlet weak var waterStackView: UIStackView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var mlLeftLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    private var model: DrinkWidgetMainModel?
    weak var delegate: EnergyDrinkWaterProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: DrinkWidgetMainModel) {
        self.model = model
        
        mainLabel.text = RLocalization.water_widget_title()
        
        waterStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for _ in 0..<model.doneCups {
            let button = UIButton()
            button.setImage(RImage.energy_water_active_ic(), for: .normal)
            waterStackView.addArrangedSubview(button)
        }
        
        for index in model.doneCups..<model.totalCups {
            let button = UIButton()
            button.setImage(RImage.energy_water_empty_ic(), for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.tag = index - model.doneCups
            waterStackView.addArrangedSubview(button)
        }
        
        mlLeftLabel.text = RLocalization.water_widget_ml_left(model.left)
        countLabel.text = "\(model.energy)/\(model.energyTotal)"
    }
    
    @objc func buttonAction(sender: UIButton!) {
        debugPrint(sender.tag)
        delegate?.energyDrinkWaterSelectIndex(cell: self, index: sender.tag + 1)
    }
}
