//
//  MenuCell.swift
//  izzifit
//
//  Created by Andrey S on 23.02.2022.
//

import UIKit

protocol MenuCellDelegate: AnyObject {
    func menuCellProfile(cell: MenuCell, notification: Bool)
    func menuCellProfile(cell: MenuCell, reminders: Bool)
}

class MenuCell: BaseTableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var switcherSwitch: UISwitch!
    
    @IBOutlet weak var menuArrowRightImageView: UIImageView!
    
    
    weak var delegate: MenuCellDelegate?
    private var type: SettingsType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(type: SettingsType) {
        nameLabel.text = type.text
        self.type = type
        setupDetailLabel(type: type)
    }
    
    private func setupDetailLabel(type: SettingsType) {
        guard let model = KeychainService.standard.me else { return }
        
        
        flagImageView.isHidden = type == .targetWeight ? false : true
        
        switch type {
        case .notification:
            selectionStyle = .none
            switcherSwitch.setOn(model.notifications ?? false, animated: true)
            switcherSwitch.isHidden = false
            mainStack.isHidden = true
            menuArrowRightImageView.isHidden = true
        case .reminders:
            selectionStyle = .none
            switcherSwitch.setOn(model.reminders ?? false, animated: true)
            switcherSwitch.isHidden = false
            mainStack.isHidden = true
            menuArrowRightImageView.isHidden = true
        default:
            selectionStyle = .default
            switcherSwitch.isHidden = true
            mainStack.isHidden = false
            menuArrowRightImageView.isHidden = false
        }
        
        switch type {
        case .name:
            detailLabel.text = model.name
        case .age:
            detailLabel.text =  "\(model.age ?? 0)"
        case .email:
            detailLabel.text = model.email
        case .height:
            detailLabel.text = "\(model.growth ?? 0)"
        case .weight:
            detailLabel.text = "\(model.weight ?? 0)"
        case .targetWeight:
            detailLabel.text = "\(model.targetWeight ?? 0)"
        case .foodPreferences:
            if let food = model.FoodGroup {
                detailLabel.text = food.name
            } else {
                detailLabel.text = ""
            }
        case .fitnessPreferences:
            detailLabel.text = model.fitnessPreference?.text
        case .language:
            detailLabel.text = RLocalization.menu_english()
        case .notification, .logout:
            break
        case .reminders:
            break
        }
    }
    
    @IBAction func actionChangeSwitcher(_ sender: UISwitch) {
        if type == .notification {
            delegate?.menuCellProfile(cell: self, notification: sender.isOn)
        } else if type == .reminders {
            delegate?.menuCellProfile(cell: self, reminders: sender.isOn)
        }
    }
}
