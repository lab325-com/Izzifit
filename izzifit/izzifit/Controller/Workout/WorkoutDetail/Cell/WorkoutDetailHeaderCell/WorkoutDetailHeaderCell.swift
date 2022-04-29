//
//  WorkoutDetailHeaderCell.swift
//  izzifit
//
//  Created by Andrey S on 28.03.2022.
//

import UIKit
import Kingfisher
import CoreLocation

protocol WorkoutDetailHeaderProtocol: AnyObject {
    func workoutDetailHeaderBack(cell: WorkoutDetailHeaderCell)
}

class WorkoutDetailHeaderCell: BaseTableViewCell {

    @IBOutlet weak var workOutImageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var kCalLabel: UILabel!
    @IBOutlet weak var workCountLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    
    
    weak var delegate: WorkoutDetailHeaderProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: WorkoutByIdMainModel?) {
        workOutImageView.kf.setImage(with: URL(string: model?.image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_two_ic(), options: [.transition(.fade(0.25))])
        
        mainLabel.text = model?.title
        
        kCalLabel.text = "\(model?.kCal ?? 0) Kcal"
        
        var duration = ""
        
        if let hour = model?.duration?.hours {
            duration = duration + "\(hour) hour(s) "
        }
        
        
        workCountLabel.text = duration + "\(model?.duration?.minutes ?? 0) min"
        
        energyLabel.text = "\(model?.energyTotal ?? 0)"
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        delegate?.workoutDetailHeaderBack(cell: self)
    }
}
