//
//  WorkoutDetailMuscleСell.swift
//  izzifit
//
//  Created by Andrey S on 29.03.2022.
//

import UIKit

class WorkoutDetailMuscleСell: BaseTableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(title: String) {
        mainLabel.text = title
    }
}
