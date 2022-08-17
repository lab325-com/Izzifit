//
//  EnergyController+TableView.swift
//  izzifit
//
//  Created by Andrey S on 18.05.2022.
//

import UIKit

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension EnergyController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8 + presenter.workoutWidgets.count + presenter.specialPriceNotBuing.count + presenter.specialPriceBuing.count + presenter.dietsPlanModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? EnerdyTodayCell else { return UITableViewCell() }
            
            cell.delegate = self
            if let model = presenter.todayProgress {
                cell.setupCell(model: model)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellWaterIdentifier) as? EnergyDrinkWaterCell else { return UITableViewCell() }
            cell.delegate = self
            if let model = presenter.drinkWidget {
                cell.setupCell(model: model)
            }
            cell.onSeeMoreDidTap {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellMealsIdentifier) as? EnergyMealsCell else { return UITableViewCell() }
            if let model = presenter.mealsWidget {
                cell.delegate = self
                cell.setupCell(model: model)
            }
            
            cell.onSeeMoreDidTap {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellEnergyMood) as? EnergyMoodCell else { return UITableViewCell() }
            if let model = presenter.moodWidget {
                cell.setupCell(model: model)
            }
            cell.delegate = self
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellStepsIdentifier) as? EnergyStepsCell else { return UITableViewCell() }
            if let widget = presenter.stepsWidget {
                cell.setupCell(steps: presenter.steps, widget: widget)
            }
            
            cell.onSeeMoreDidTap {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            return cell
        case 5..<5 + presenter.specialPriceNotBuing.count:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSpecialPriceIdentifier) as? EnergySpecialPriceCell else { return UITableViewCell() }
            let model = presenter.specialPriceNotBuing[indexPath.row - 5]
            cell.setupCell(model: model, paymentInfo: presenter.paymentsInfo.first(where: {$0.product == model.externalId}))
            cell.delegate = self
            return cell
        case (5 + presenter.specialPriceNotBuing.count)..<(5 + presenter.specialPriceNotBuing.count + presenter.dietsPlanModels.count):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSpecialPriceIdentifier) as? EnergySpecialPriceCell else { return UITableViewCell() }
            let model = presenter.dietsPlanModels[indexPath.row - 5 - presenter.specialPriceNotBuing.count]
            cell.setupCell(model: model)
            cell.delegate = self
            return cell
        case 5 + presenter.specialPriceNotBuing.count + presenter.dietsPlanModels.count:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellChooseActivity) as? EnergyChooseActivityCell else { return UITableViewCell() }
            cell.delegate = self
            cell.setupCell(models: presenter.chooseWorkoutWidgets)
            return cell
        case 6 + presenter.specialPriceNotBuing.count + presenter.dietsPlanModels.count:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSleepIdentifier) as? EnergySleepCell else { return UITableViewCell() }
            cell.delegate = self
            if let model = presenter.sleepWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 7 + presenter.specialPriceNotBuing.count + presenter.dietsPlanModels.count:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellWeightIdentifier) as? EnergyWeightCell else { return UITableViewCell() }
            cell.delegate = self
            if let model = presenter.weightWidget {
                cell.setupCell(model: model)
            }
            return cell
        case (8 + presenter.specialPriceNotBuing.count + presenter.dietsPlanModels.count)..<8 + presenter.workoutWidgets.count + presenter.specialPriceNotBuing.count + presenter.dietsPlanModels.count:
            if presenter.workoutWidgets.count == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellAddActivity) as? EnergyAddActivityCell else { return UITableViewCell() }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellTraining) as? EnergyTrainingCell else { return UITableViewCell() }
                cell.delegate = self
                cell.setupCell(model: presenter.workoutWidgets[indexPath.row - 8 - presenter.specialPriceNotBuing.count - presenter.dietsPlanModels.count])
                return cell
            }
        case (8 + presenter.workoutWidgets.count + presenter.specialPriceNotBuing.count + presenter.dietsPlanModels.count)..<(8 + presenter.workoutWidgets.count + presenter.specialPriceNotBuing.count + presenter.specialPriceBuing.count + presenter.dietsPlanModels.count):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSpecialPriceIdentifier) as? EnergySpecialPriceCell else { return UITableViewCell() }
            let model = presenter.specialPriceBuing[indexPath.row - 8 - presenter.workoutWidgets.count - presenter.specialPriceNotBuing.count - presenter.dietsPlanModels.count]
            cell.setupCell(model: model, paymentInfo: presenter.paymentsInfo.first(where: {$0.product == model.externalId}))
            cell.delegate = self
            return cell
        case 8 + presenter.workoutWidgets.count + presenter.specialPriceNotBuing.count + presenter.specialPriceBuing.count + presenter.dietsPlanModels.count:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellAddActivity) as? EnergyAddActivityCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if indexPath.row == 0 { return 185.0 }
        
        
        if indexPath.row == 6 + presenter.specialPriceNotBuing.count + presenter.dietsPlanModels.count {
            return Date().isNeedSleepWidget ? tableView.rowHeight : 0
        }

        return UITableView.automaticDimension

    }
}

//----------------------------------------------
// MARK: - EnergyTodayProtocol
//----------------------------------------------

extension EnergyController: EnergyTodayProtocol {
    func energyTodayProgress(cell: EnerdyTodayCell) {
        EnergyRouter(presenter: navigationController).pushProgrress()
    }
}

//----------------------------------------------
// MARK: - EnergyMealsDeleagate
//----------------------------------------------

extension EnergyController: EnergyMealsDeleagate {
    func energyMealsAdd(cell: EnergyMealsCell, type: MealType) {
        
        if !PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .meals) {
            guard let meals = presenter.mealsWidget else { return }
            switch type {
            case .mealTypeBreakfast:
                AnalyticsHelper.sendFirebaseEvents(events: .dash_meal_breakfast_tap)
            case .mealTypeLunch:
                AnalyticsHelper.sendFirebaseEvents(events: .dash_meal_lunch_tap)
            case .mealTypeSnack:
                AnalyticsHelper.sendFirebaseEvents(events: .dash_meal_snack_tap)
            case .mealTypeDinner:
                AnalyticsHelper.sendFirebaseEvents(events: .dash_meal_dinner_tap)
            case .__unknown(_):
                break
            }
            
            EnergyRouter(presenter: navigationController).pushFood(mealsWidget: meals, currentMealType: type, delegate: self)
        }
    }
}

//----------------------------------------------
// MARK: - EnergyDrinkWaterProtocol
//----------------------------------------------

extension EnergyController: EnergyDrinkWaterProtocol {
    func energyDrinkWaterSelectIndex(cell: EnergyDrinkWaterCell, index: Int) {
        AnalyticsHelper.sendFirebaseEvents(events: .dash_water_tap)
        
        if !PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .drinkWater) {
            presenter.setWater(index: index, date: getDate())
        }
    
        //
        guard !PreferencesManager.sharedManager.gameOnboardingDone else { return }
        tableView.isScrollEnabled = true
        let indexPath = IndexPath(row: 1, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) as? EnergyDrinkWaterCell {
            cell.underView.removeFromSuperview()
        }
        tableView.reloadData()
        
        if let tabBarVC = parent as? MainTabBarController {
            tabBarVC.onboardingView?.removeFromSuperview()
            let isShowOnboard = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .afterAnimateOnboarding)
            
            if isShowOnboard == false {
                
                tabBarVC.onboardingView = MainGameOnboardingView(state: .finalPopUp,
                                                                 delegate: tabBarVC)
                
                view.ui.genericlLayout(object: tabBarVC.onboardingView!,
                                       parentView: tabBarVC.view,
                                       topC: 0,
                                       bottomC: 0,
                                       leadingC: 0,
                                       trailingC: 0)
            } else {
                PreferencesManager.sharedManager.gameOnboardingDone = true
                MainGameOnboardingView.stateCounter = 0
            }
        }
    }
}

//----------------------------------------------
// MARK: - EnergyMoodProtocol
//----------------------------------------------

extension EnergyController: EnergyMoodProtocol {
    func energyMoodSelected(cell: EnergyMoodCell, type: MoodType) {
        AnalyticsHelper.sendFirebaseEvents(events: .dash_emotion_tap)
        
        if !PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .mood) {
            presenter.setMood(mood: type, date: getDate())
        }
    }
}

//----------------------------------------------
// MARK: - EnergySleepCellProtocol
//----------------------------------------------

extension EnergyController: EnergySleepCellProtocol {
    func energySleepCellSeleep(cell: EnergySleepCell, sleep: SleepQualityType) {
        AnalyticsHelper.sendFirebaseEvents(events: .dash_sleep_tap)
        
        if !PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .sleep) {
            presenter.setSeleep(sleep: sleep, date: getDate())
        }
        
    }
}

//----------------------------------------------
// MARK: - EnergyWeightProtocol
//----------------------------------------------

extension EnergyController: EnergyWeightProtocol {
    func energyWeightUpdate(cell: EnergyWeightCell) {
        EnergyRouter(presenter: navigationController).presentUpdateWieght(measureSystem: presenter.weightWidget?.measure, weight: presenter.weightWidget?.weight, delegate: self)
    }
}

//----------------------------------------------
// MARK: - EnergyUpdateWeightProtocol
//----------------------------------------------

extension EnergyController: EnergyUpdateWeightProtocol {
    func energyUpdateWeight(controller: EnergyUpdateWeightController) {
        AnalyticsHelper.sendFirebaseEvents(events: .dash_update_weight_tap)
        presenter.updateWeight()
    }
}

//----------------------------------------------
// MARK: - EnergyChooseActivityProtocol
//----------------------------------------------

extension EnergyController: EnergyChooseActivityProtocol {
    func energyChooseActivitySelect(cell: EnergyChooseActivityCell, model: WorkoutsWidgetMainModel) {
        AnalyticsHelper.sendFirebaseEvents(events: .dash_activity_tap)
        
//        if !PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .chooseAcivity) {
//            guard let id = model.id else { return }
//            WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id)
//        }
        
        guard let id = model.id, let isAvailable = model.isAvailable else { return }
         
        if isAvailable {
            WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id)
        } else {
            let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .chooseAcivity)
        }
    }
}

//----------------------------------------------
// MARK: - EnergyTrainingProtocol
//----------------------------------------------

extension EnergyController: EnergyTrainingProtocol {
    func energyTrainingSelect(cell: EnergyTrainingCell, model: WorkoutsWidgetMainModel) {
        
        guard let id = model.id else { return }
        AnalyticsHelper.sendFirebaseEvents(events: .dash_training_tap)
        
        if model.isAvailable == true {
            WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id)
        } else {
            let _ = PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .workoutTraini)
        }
    }
}

//----------------------------------------------
// MARK: - FoodControllerProtocol
//----------------------------------------------

extension EnergyController: FoodControllerProtocol {
    func foodControllerUpdate(controller: FoodController) {
        presenter.getWidgets(date: getDate())
    }
}

//----------------------------------------------
// MARK: - PaywallProtocol
//----------------------------------------------

extension EnergyController: PaywallProtocol {
    func paywallActionBack(controller: BaseController) {
        self.dismiss(animated: true)
    }
    
    func paywallSuccess(controller: BaseController) {
        
    }
}

//----------------------------------------------
// MARK: - EnergySpecialPriceCellDelegate
//----------------------------------------------

extension EnergyController: EnergySpecialPriceCellDelegate {
    func energySpecialDietSelect(cell: EnergySpecialPriceCell, model: DietPlanModel) {
        guard let id = model.id, let specialID = model.externalId else {
            return
        }
        
        if !(model.isAvailable ?? false) {
            AnalyticsHelper.sendFirebaseEvents(events: .dash_paid_diet_tap, params: ["id": specialID])
        }
        
        WorkoutRouter(presenter: navigationController).pushDietDetail(id: id, idSpecialId: specialID)
    }
    
    
    func energySpecialPriceSelect(cell: EnergySpecialPriceCell, model: WorkoutsWidgetMainModel) {
        guard let id = model.id, let specialID = model.externalId else {
            return
        }
        
        if !(model.isAvailable ?? false) {
            AnalyticsHelper.sendFirebaseEvents(events: .dash_paid_mk_tap, params: ["id": specialID])
        }

        WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id, idSpecialId: specialID)
    }
}
