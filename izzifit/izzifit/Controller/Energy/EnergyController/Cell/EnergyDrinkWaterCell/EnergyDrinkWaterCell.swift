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

class EnergyDrinkWaterCell: BaseTableViewCell {

    @IBOutlet weak var underView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var waterStackView: UIStackView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mlLeftLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var infoTopView: UIView!
    @IBOutlet weak var infoBottomView: UIView!
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var infoBottomLayour: NSLayoutConstraint!
    @IBOutlet weak var infoLabel: UILabel!
    
    private var seeMoreDidTapHandler: (() -> Void)?
    private var model: DrinkWidgetMainModel?
    weak var delegate: EnergyDrinkWaterProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        infoBottomView.isHidden = true

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24

        infoLabel.attributedText = NSMutableAttributedString(string: "Drinking clean water is very important when it comes to health. Not drinking enough water daily might contribute to slower metabolism and serious health issues later down the line, so it’s better to track every drink to make sure that you’re properly hydrated!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        if PreferencesManager.sharedManager.drintWaterInfoHidden {
            hiddenInfo()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(model: DrinkWidgetMainModel) {
        self.model = model
        
        mainLabel.text = RLocalization.water_widget_title()
        
        waterStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for index in 0..<model.doneCups {
            let button = UIButton()
            button.setImage(RImage.energy_water_active_ic(), for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.tag = index
            waterStackView.addArrangedSubview(button)
        }
        
        var doneCups = model.doneCups
        if doneCups > model.totalCups {
            doneCups = model.totalCups
        }
        
       var animBtns = [UIButton]()
        
        for index in doneCups..<model.totalCups {
            let button = UIButton()
            button.setImage(RImage.energy_water_empty_ic(), for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.tag = index
            waterStackView.addArrangedSubview(button)
            animBtns.append(button)
        }
        
        mlLeftLabel.text = RLocalization.water_widget_ml_left(model.left)
        countLabel.text = "\(Int(model.energy))/\(model.energyTotal)"

        
        // перевірка
        
        guard !PreferencesManager.sharedManager.gameOnboardingDone,
              MainGameOnboardingView.currentState == .finalPopUp
        else { return }
        
        animateCups(animBtns)
    }
    
    func animateCups(_ cups: [UIButton]) {
        var guardCount = Int()
        switch cups.count {
        case let x where x  <= 7:   guardCount = 4
        case let x where x <= 12:   guardCount = 6
        default : break
        }
        
        var animTimeStride = 0.0
        for _ in 0...99 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + animTimeStride) {
                var strideCount = 0.0
                for (index, cup) in cups.enumerated() {
                 
                 //   guard  index <= guardCount else { return }
                    cup.setImage(RImage.energy_water_active_ic(), for: .normal)
                    strideCount += 0.15
                    cup.layer.opacity = 0.4
                    DispatchQueue.main.asyncAfter(deadline: .now() + strideCount) {
                        animOneCup(cup)
                    }
                }
            }
            animTimeStride += 3.2
        }
       
        func animOneCup(_ btn: UIButton) {
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear) {
                btn.layer.opacity = 1.0
            } completion: { (_) in
                UIView.animate(withDuration: 0.4, delay: 0,  options: .curveLinear) {
                    btn.layer.opacity = 0.4
                } completion: { (_) in }
            }
        }
    }
    
    private func hiddenInfo() {
        infoStackView.isHidden = true
        infoTopView.isHidden = true
        infoBottomView.isHidden = true
        infoBottomLayour.constant = 0
        infoStackView.layoutIfNeeded()
        contentView.layoutIfNeeded()
        seeMoreDidTapHandler?()
    }
    
    func onSeeMoreDidTap(_ handler: @escaping () -> Void) {
        self.seeMoreDidTapHandler = handler
    }
    
    @objc func buttonAction(sender: UIButton!) {
        debugPrint(sender.tag + 1)
        delegate?.energyDrinkWaterSelectIndex(cell: self, index: sender.tag + 1)
    }
    
    @IBAction func actionHiddenInfo(_ sender: UIButton) {
        PreferencesManager.sharedManager.drintWaterInfoHidden = true
        UIView.animate(withDuration: 0.3) {
            self.hiddenInfo()
        }
    }
    
    @IBAction func actionRotate(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.arrowImageView.transform = self.arrowImageView.transform.rotated(by: .pi)
            self.infoBottomView.isHidden = !self.infoBottomView.isHidden
            self.infoStackView.layoutIfNeeded()
            self.contentView.layoutIfNeeded()
            self.seeMoreDidTapHandler?()
        }
    }
    
}
