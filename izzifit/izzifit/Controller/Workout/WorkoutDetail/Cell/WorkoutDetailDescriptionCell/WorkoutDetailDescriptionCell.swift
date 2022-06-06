//
//  WorkoutDetailDescriptionCell.swift
//  izzifit
//
//  Created by Andrey S on 28.03.2022.
//

import UIKit

protocol WorkoutDetailDescriptionProtocol: AnyObject {
    func workoutDetailDescriptionMuscle(cell: WorkoutDetailDescriptionCell, muscles: [String])
}

class WorkoutDetailDescriptionCell: BaseTableViewCell {
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainMuscleGroupsLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var musclesGroupLabel: UILabel!
    
    weak var delegate: WorkoutDetailDescriptionProtocol?
    
    private var model: WorkoutByIdMainModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24

        mainTitleLabel.attributedText = NSMutableAttributedString(string: RLocalization.workout_detail_description(), attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        mainMuscleGroupsLabel.text = RLocalization.workout_detail_muscle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: WorkoutByIdMainModel?) {
        self.model = model
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24

        descriptionLabel.attributedText = NSMutableAttributedString(string: model?.description ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        musclesGroupLabel.text = model?.muscles?.compactMap({$0.name}).joined(separator: ", ")
    }
    
    @IBAction func actionMuscle(_ sender: UIButton) {
        guard let muscles = model?.muscles?.compactMap({$0.name}) else { return }
        delegate?.workoutDetailDescriptionMuscle(cell: self, muscles: muscles)
    }
}
