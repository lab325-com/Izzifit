//
//  EnergyWeightCell.swift
//  izzifit
//
//  Created by Andrey S on 09.03.2022.
//

import UIKit

protocol EnergyWeightProtocol: AnyObject {
    func energyWeightUpdate(cell: EnergyWeightCell)
}


class EnergyWeightCell: BaseTableViewCell {

    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    weak var delegate: EnergyWeightProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainTitleLabel.text = RLocalization.energy_update_weight_title()
        doneButton.layer.borderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: SaveWeightWidgetMainModel) {
        
        countLabel.text = "\(model.energy ?? 0)/\(model.energyTotal ?? 0)"
        
        goalLabel.text = RLocalization.energy_update_weight_goal(Double(model.targetWeight ?? 0.0), model.measure?.text ?? "")
        
        weightLabel.text = "\(String(format: "%.1f", model.weight ?? 0.0)) \(model.measure?.text ?? "")"
        
        if let _ = model.energy {
            doneButton.layer.borderColor = UIColor(rgb: 0xFF42A8).cgColor
            doneButton.setTitle(nil, for: .normal)
            doneButton.setImage(RImage.energy_weight_selected_ic(), for: .normal)
        } else {
            doneButton.layer.borderColor = UIColor(rgb: 0xCCBEE9).cgColor
            doneButton.setTitle(RLocalization.energy_update_button(), for: .normal)
            doneButton.setImage(nil, for: .normal)
        }
    }
    
    @IBAction func actionUpdateWieght(_ sender: UIButton) {
        delegate?.energyWeightUpdate(cell: self)
    }
}
