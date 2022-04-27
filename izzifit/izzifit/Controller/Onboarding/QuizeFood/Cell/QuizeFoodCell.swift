//
//  QuizeFoodCell.swift
//  izzifit
//
//  Created by Andrey S on 21.02.2022.
//

import UIKit
import Kingfisher

protocol QuizeFoodCellDelegate: AnyObject {
    func quizeFoodCellSelected(cell: QuizeFoodCell, model: FoodGroupModel)
    func quizeFoodCellSelectedFitness(cell: QuizeFoodCell, type: WorkoutDifficulty)
}

extension QuizeFoodCellDelegate {
    func quizeFoodCellSelected(cell: QuizeFoodCell, model: FoodGroupModel) {}
    func quizeFoodCellSelectedFitness(cell: QuizeFoodCell, type: WorkoutDifficulty) {}
}

class QuizeFoodCell: BaseTableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var foodView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private var model: FoodGroupModel?
    private var selecteType: WorkoutDifficulty?
    
    var delegate: QuizeFoodCellDelegate?
    
    func setupCell(model: FoodGroupModel, selected: Bool) {
        self.model = model
        
        selectedImageView.isHidden = !selected
        
        foodView.layer.borderWidth = 2
        if selected {
            foodView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
        } else {
            foodView.layer.borderColor = UIColor.clear.cgColor
        }
        
        nameLabel.text = model.name
        
        avatarImageView.kf.setImage(with: URL(string: model.Image?.urlIosFull ?? ""), placeholder: RImage.placeholder_food_ic(), options: [.transition(.fade(0.25))])
    }
    
    func setupCellFitness(type: WorkoutDifficulty, selected: Bool) {
        self.selecteType = type
        
        selectedImageView.isHidden = !selected
        
        foodView.layer.borderWidth = 2
        if selected {
            foodView.layer.borderColor = UIColor(red: 1, green: 0.258, blue: 0.659, alpha: 1).cgColor
        } else {
            foodView.layer.borderColor = UIColor.clear.cgColor
        }
        
        nameLabel.text = type.text
        
        switch type {
        case .workoutDifficultyTypeLight:
            avatarImageView.image = RImage.onboarding_sport_newbie_ic()
        case .workoutDifficultyTypeProfessional:
            avatarImageView.image = RImage.onboarding_sport_professional_ic()
        case .workoutDifficultyTypeStrong:
            avatarImageView.image = RImage.onboarding_sport_regulary_ic()
        case .__unknown(_):
            break
        }
    }
    
    @IBAction func actionSelect(_ sender: UIButton) {
        if let model = model {
            delegate?.quizeFoodCellSelected(cell: self, model: model)
        } else if let selecteType = selecteType {
            delegate?.quizeFoodCellSelectedFitness(cell: self, type: selecteType)
        }
    }
    
}
