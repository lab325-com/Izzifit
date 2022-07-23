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
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: "Inter-Medium", size: 14), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: "Inter-Regular", size: 11), NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x3F3E56, alpha: 0.4)]
        
        let fullString = NSMutableAttributedString(string: "\(model.title ?? "")  ", attributes: attrs1 as [NSAttributedString.Key : Any])

        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "energy_water_flash_ic")

        let image1String = NSAttributedString(attachment: image1Attachment)

        fullString.append(image1String)
        
        let energy = NSAttributedString(string: " \(model.energyTotal ?? 0)", attributes: attrs2 as [NSAttributedString.Key : Any])
        fullString.append(energy)

        // draw the result in a label
        mainTitleLabel.attributedText = fullString
        
        var exersises = "\(model.totalExercises ?? 0) exercises | "
        
        if let hours = model.duration?.hours {
            exersises = exersises + "\(hours) hour(s)"
        }
        
        exercisesAndDurationLabel.text = exersises + " \(model.duration?.minutes ?? 0) min"
    }
}
