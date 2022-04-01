//
//  WorkoutSpecialDetailCell.swift
//  izzifit
//
//  Created by Andrey S on 30.03.2022.
//

import UIKit
import Kingfisher

class WorkoutSpecialDetailCell: UICollectionViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var exercisesAndDurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(model: WorkoutByIdMainModel) {
        mainImageView.kf.setImage(with: URL(string: model.image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_two_ic(), options: [.transition(.fade(0.25))])
        
        mainTitleLabel.text = model.title
        
        var exersises = "\(model.totalExercises ?? 0) exercises | "
        
        if let hours = model.duration?.hours {
            exersises = exersises + "\(hours) hour(s)"
        }
        
        exercisesAndDurationLabel.text = exersises + " \(model.duration?.minutes ?? 0) min"
    }
}
