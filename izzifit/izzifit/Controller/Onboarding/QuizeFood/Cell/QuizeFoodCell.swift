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
}

class QuizeFoodCell: UITableViewCell {
    
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
        
        avatarImageView.kf.setImage(with: URL(string: model.Image?.urlIosFull ?? ""), placeholder: RImage.onboarding_food_keto_ic(), options: [.transition(.fade(0.25))])
    }
    
    @IBAction func actionSelect(_ sender: UIButton) {
        guard let model = model else {
            return
        }

        delegate?.quizeFoodCellSelected(cell: self, model: model)
    }
    
}
