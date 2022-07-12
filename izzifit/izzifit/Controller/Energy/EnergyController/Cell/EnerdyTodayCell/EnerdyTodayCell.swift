//
//  EnerdyTodayCell.swift
//  izzifit
//
//  Created by Andrey S on 04.03.2022.
//

import UIKit

protocol EnergyTodayProtocol: AnyObject {
    func energyTodayProgress(cell: EnerdyTodayCell)
}

class EnerdyTodayCell: BaseTableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var middleGoodView: UIView!
    
    @IBOutlet weak var progressPercentLabel: UILabel!
    
    @IBOutlet weak var progressWidthLayout: NSLayoutConstraint!
    
    weak var delegate: EnergyTodayProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        progressView.layer.cornerRadius = 4
        progressView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(model: TodayProgressMainModel) {
        
        progressPercentLabel.text = RLocalization.energy_progress_percent(model.progress ?? 0)
        
        if let progress = model.progress {
            let progress = CGFloat(progress)
            let width = stackView.frame.width
            let point = width / 100
            
            if progress * point >= width {
                progressWidthLayout.constant = width
            } else {
                progressWidthLayout.constant = progress * point
            }
        }
        
        guard !PreferencesManager.sharedManager.gameOnboardingDone else { return }
        
        let onboardingView = GameOnboardingEnergyView(state: .game)
        
             ui.genericlLayout(object: onboardingView,
                               parentView: self,
                               width: wRatio(cW: 344),
                               height: 71,
                               bottomC: 10,
                               centerH: 0) 
    }
    
    @IBAction func actionProgress(_ sender: UIButton) {
        delegate?.energyTodayProgress(cell: self)
    }
}
