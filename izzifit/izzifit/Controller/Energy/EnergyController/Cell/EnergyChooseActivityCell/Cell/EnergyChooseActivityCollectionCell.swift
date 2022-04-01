//
//  EnergyChooseActivityCell.swift
//  izzifit
//
//  Created by Andrey S on 09.03.2022.
//

import UIKit
import Kingfisher

class EnergyChooseActivityCollectionCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var exercisesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(model: WorkoutsWidgetMainModel) {
        nameLabel.text = model.title ?? ""
        var exersises = "\(model.totalExercises ?? 0) exercises | "
        
        if let hours = model.duration?.hours {
            exersises = exersises + "\(hours) hour(s)"
        }
        
        
        exercisesLabel.text = exersises + " \(model.duration?.minutes ?? 0) min"
        
        avatarImageView.kf.setImage(with: URL(string: model.Image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_ic(), options: [.transition(.fade(0.25))])
    }
}
