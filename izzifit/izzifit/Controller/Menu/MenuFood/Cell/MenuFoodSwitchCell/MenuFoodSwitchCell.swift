//
//  MenuFoodSwitchCell.swift
//  izzifit
//
//  Created by Andrey S on 28.02.2022.
//

import UIKit

protocol MenuFoodSwitchDelegate: AnyObject {
    func menuFoodSwitch(cell: MenuFoodSwitchCell, model: ProductsMainModel)
    func menuFoodSwitchMusclee(cell: MenuFoodSwitchCell, model: MusclesMainModel)
}

extension MenuFoodSwitchDelegate {
    func menuFoodSwitch(cell: MenuFoodSwitchCell, model: ProductsMainModel) {}
    func menuFoodSwitchMusclee(cell: MenuFoodSwitchCell, model: MusclesMainModel) {}
}

class MenuFoodSwitchCell: UITableViewCell {

    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    private var model: ProductsMainModel?
    private var modelMuscle: MusclesMainModel?
    
    weak var delegate: MenuFoodSwitchDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: ProductsMainModel) {
        self.model = model
        mainTextLabel.text = model.name
        switcher.setOn(model.isToggled ?? false, animated: false)
        
    }
    
    func setupCellMuscle(model: MusclesMainModel) {
        self.modelMuscle = model
        mainTextLabel.text = model.name
        switcher.setOn(model.isToggled ?? false, animated: false)
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionChangedSwitcher(_ sender: UISwitch) {
        if let model = model {
            delegate?.menuFoodSwitch(cell: self, model: model)
        } else if let model = modelMuscle {
            delegate?.menuFoodSwitchMusclee(cell: self, model: model)
        }
    }
}
