//
//  WorkoutExercisesDetailCell.swift
//  izzifit
//
//  Created by Andrey S on 31.03.2022.
//

import UIKit

class WorkoutExercisesDetailCell: UICollectionViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var exercisesAndDurationLabel: UILabel!
    
    @IBOutlet weak var heightImageView: NSLayoutConstraint!
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blockedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let weight = (UIScreen.main.bounds.size.width - 3*16) / 2
        let height = weight * 0.682
        heightImageView.constant = height
    }

    func setupCell(model: WorkoutByIdMainModel) {
        redView.isHidden = model.isAvailable ?? false
        
        blockedImageView.isHidden = model.isAvailable ?? false
        
        mainImageView.kf.setImage(with: URL(string: model.image?.urlIosFull ?? ""), placeholder: RImage.placeholder_big_sport_two_ic(), options: [.transition(.fade(0.25))])
        
        mainTitleLabel.text = model.title
        
        var exersises = "\(model.totalExercises ?? 0) exercises | "
        
        if let hours = model.duration?.hours {
            exersises = exersises + "\(hours) hour(s)"
        }
        
        exercisesAndDurationLabel.text = exersises + " \(model.duration?.minutes ?? 0) min"
    }
}
