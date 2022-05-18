//
//  EnergyMealsCell.swift
//  izzifit
//
//  Created by Andrey S on 07.03.2022.
//

import UIKit

protocol EnergyMealsDeleagate: AnyObject {
    func energyMealsAdd(cell: EnergyMealsCell, type: MealType)
}

class EnergyMealsCell: BaseTableViewCell {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var proteinCircleView: UIView!
    @IBOutlet weak var fatsCircleView: UIView!
    @IBOutlet weak var carbsCircleView: UIView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var protainLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    
    @IBOutlet weak var proteinPercentLabel: UILabel!
    @IBOutlet weak var fatsPercentLabel: UILabel!
    @IBOutlet weak var carbsPercentLabel: UILabel!
    
    @IBOutlet weak var proteinGrammLabel: UILabel!
    @IBOutlet weak var fatsGrammLabel: UILabel!
    @IBOutlet weak var carbsGrammLabel: UILabel!
    
    @IBOutlet weak var breakfestLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var snackLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    
    @IBOutlet weak var breakfestSubTitleLabel: UILabel!
    @IBOutlet weak var lunchSubTitleLabel: UILabel!
    @IBOutlet weak var snackSubTitleLabel: UILabel!
    @IBOutlet weak var dinnerSubTitleLabel: UILabel!
    
    @IBOutlet weak var breakfestImageView: UIImageView!
    @IBOutlet weak var lunchImageView: UIImageView!
    @IBOutlet weak var snackImageView: UIImageView!
    @IBOutlet weak var dinnerImageView: UIImageView!
    
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var circularProgressProteinView: CircularProgressBarView!
    private var circularProgressFatsView: CircularProgressBarView!
    private var circularProgressCarbsView: CircularProgressBarView!
    
    private var circularViewDuration: TimeInterval = 1
    private var model: MealsWidgetMainModel?
    
    weak var delegate: EnergyMealsDeleagate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTitleLabel.text = RLocalization.energy_meals_title()
        
        protainLabel.text = RLocalization.energy_meals_protein()
        fatsLabel.text = RLocalization.energy_meals_fats()
        carbsLabel.text = RLocalization.energy_meals_carbs()
        
        breakfestLabel.text = RLocalization.energy_meals_breakfast()
        lunchLabel.text = RLocalization.energy_meals_lunch()
        snackLabel.text = RLocalization.energy_meals_snack()
        dinnerLabel.text = RLocalization.energy_meals_dinner()
        
        DispatchQueue.main.async {
            // set view
            self.circularProgressProteinView = CircularProgressBarView(frame: .zero)
            self.circularProgressProteinView.createCircularPath(backColor: UIColor(red: 0.247, green: 0.245, blue: 0.338, alpha: 0.1), frontColor: UIColor(rgb: 0x957ACE), radius: 25, lineWidth: 4)
            // align to the center of the screen
            self.circularProgressProteinView.center = self.proteinCircleView.center
            
            // add this view to the view controller
            self.proteinCircleView.addSubview(self.circularProgressProteinView)
        }
        
        DispatchQueue.main.async {
            // set view
            self.circularProgressFatsView = CircularProgressBarView(frame: .zero)
            self.circularProgressFatsView.createCircularPath(backColor: UIColor(red: 0.247, green: 0.245, blue: 0.338, alpha: 0.1), frontColor: UIColor(rgb: 0x957ACE), radius: 25, lineWidth: 4)
            // align to the center of the screen
            self.circularProgressFatsView.center = self.fatsCircleView.center
            
            // add this view to the view controller
            self.fatsCircleView.addSubview(self.circularProgressFatsView)
        }
        
        DispatchQueue.main.async {
            // set view
            self.circularProgressCarbsView = CircularProgressBarView(frame: .zero)
            self.circularProgressCarbsView.createCircularPath(backColor: UIColor(red: 0.247, green: 0.245, blue: 0.338, alpha: 0.1), frontColor: UIColor(rgb: 0x957ACE), radius: 25, lineWidth: 4)
            // align to the center of the screen
            self.circularProgressCarbsView.center = self.carbsCircleView.center
            
            // add this view to the view controller
            self.carbsCircleView.addSubview(self.circularProgressCarbsView)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(model: MealsWidgetMainModel) {
        self.model = model
        
        countLabel.text = "\(Int(model.energy ?? 0))/\(model.energyTotal ?? 0)"
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            if let protein = model.sources?.first(where: {$0?.name == SourceEntityType.sourceEntityTypeProteins}) {
                self.proteinPercentLabel.text = "\(protein?.donePercents ?? 0)%"
                self.proteinGrammLabel.text = RLocalization.energy_meals_gramm(protein?.needed ?? 0)
                self.circularProgressProteinView.progressAnimation(duration: self.circularViewDuration, toValue: CGFloat((protein?.donePercents ?? 0)) / 100)
            }
            
            if let fats = model.sources?.first(where: {$0?.name == SourceEntityType.sourceEntityTypeFats}) {
                self.fatsPercentLabel.text = "\(fats?.donePercents ?? 0)%"
                self.fatsGrammLabel.text = RLocalization.energy_meals_gramm(fats?.needed ?? 0)
                self.circularProgressFatsView.progressAnimation(duration: self.circularViewDuration, toValue: CGFloat((fats?.donePercents ?? 0)) / 100 )
            }
            
            if let carbs = model.sources?.first(where: {$0?.name == SourceEntityType.sourceEntityTypeCarbs}) {
                self.carbsPercentLabel.text = "\(carbs?.donePercents ?? 0)%"
                self.carbsGrammLabel.text = RLocalization.energy_meals_gramm(carbs?.needed ?? 0)
                self.circularProgressCarbsView.progressAnimation(duration: self.circularViewDuration, toValue: CGFloat((carbs?.donePercents ?? 0)) / 100 )
            }
        }
        
        
        if let breakfest = model.meals?.first(where: {$0?.type == MealType.mealTypeBreakfast}) {
            breakfestImageView.image = breakfest?.products?.count ?? 0 != 0 ? RImage.onboarding_selected_ic() : RImage.energy_meals_add_ic()
            breakfestSubTitleLabel.isHidden = breakfest?.products?.count ?? 0 == 0 ? true : false
            breakfestSubTitleLabel.text = breakfest?.textProduct
        } else {
            breakfestImageView.image = RImage.energy_meals_add_ic()
            breakfestSubTitleLabel.isHidden = true
        }
       
        if let lunch = model.meals?.first(where: {$0?.type == MealType.mealTypeLunch}) {
            lunchImageView.image = lunch?.products?.count ?? 0 != 0 ? RImage.onboarding_selected_ic() : RImage.energy_meals_add_ic()
            lunchSubTitleLabel.isHidden = lunch?.products?.count ?? 0 == 0 ? true : false
            lunchSubTitleLabel.text = lunch?.textProduct
        } else {
            lunchImageView.image = RImage.energy_meals_add_ic()
            lunchSubTitleLabel.isHidden = true
        }
        
        if let snack = model.meals?.first(where: {$0?.type == MealType.mealTypeSnack}) {
            snackImageView.image = snack?.products?.count ?? 0 != 0 ? RImage.onboarding_selected_ic() : RImage.energy_meals_add_ic()
            snackSubTitleLabel.isHidden = snack?.products?.count ?? 0 == 0 ? true : false
            snackSubTitleLabel.text = snack?.textProduct
        } else {
            snackImageView.image = RImage.energy_meals_add_ic()
            snackSubTitleLabel.isHidden = true
        }
        
        if let dinner = model.meals?.first(where: {$0?.type == MealType.mealTypeDinner}) {
            dinnerImageView.image = dinner?.products?.count ?? 0 != 0 ? RImage.onboarding_selected_ic() : RImage.energy_meals_add_ic()
            dinnerSubTitleLabel.isHidden = dinner?.products?.count ?? 0 == 0 ? true : false
            dinnerSubTitleLabel.text = dinner?.textProduct
        } else {
            dinnerImageView.image = RImage.energy_meals_add_ic()
            dinnerSubTitleLabel.isHidden = true
        }
        
        layoutIfNeeded()
    }
    
    @IBAction func actionBreakfast(_ sender: UIButton) {
        AudioManager.sharedManager.playSound()
        //if let breakfest = model?.meals?.first(where: {$0?.type == MealType.mealTypeBreakfast}), breakfest?.eatenAt == nil {
            delegate?.energyMealsAdd(cell: self, type: .mealTypeBreakfast)
        //}
    }
    
    @IBAction func actionLunch(_ sender: UIButton) {
        AudioManager.sharedManager.playSound()
        //if let lunch = model?.meals?.first(where: {$0?.type == MealType.mealTypeLunch}), lunch?.eatenAt == nil {
            delegate?.energyMealsAdd(cell: self, type: .mealTypeLunch)
        //}
    }
    
    @IBAction func actionSnack(_ sender: UIButton) {
        AudioManager.sharedManager.playSound()
        //if let snack = model?.meals?.first(where: {$0?.type == MealType.mealTypeSnack}), snack?.eatenAt == nil {
            delegate?.energyMealsAdd(cell: self, type: .mealTypeSnack)
       // }
    }
    
    @IBAction func actionDinner(_ sender: UIButton) {
        AudioManager.sharedManager.playSound()
        //if let dinner = model?.meals?.first(where: {$0?.type == MealType.mealTypeDinner}), dinner?.eatenAt == nil {
            delegate?.energyMealsAdd(cell: self, type: .mealTypeDinner)
        //}
    }
}
