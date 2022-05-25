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
        return 7 + presenter.workoutWidgets.count
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
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellEnergyMood) as? EnergyMoodCell else { return UITableViewCell() }
            
            if let model = presenter.moodWidget {
                cell.setupCell(model: model)
            }
            
            cell.delegate = self
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellMealsIdentifier) as? EnergyMealsCell else { return UITableViewCell() }
            if let model = presenter.mealsWidget {
                cell.delegate = self
                cell.setupCell(model: model)
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellSleepIdentifier) as? EnergySleepCell else { return UITableViewCell() }
            cell.delegate = self
            if let model = presenter.sleepWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellWeightIdentifier) as? EnergyWeightCell else { return UITableViewCell() }
            cell.delegate = self
            if let model = presenter.weightWidget {
                cell.setupCell(model: model)
            }
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellChooseActivity) as? EnergyChooseActivityCell else { return UITableViewCell() }
            cell.delegate = self
            cell.setupCell(models: presenter.chooseWorkoutWidgets)
            return cell
        case 7..<7 + presenter.workoutWidgets.count:
            if presenter.workoutWidgets.count == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellAddActivity) as? EnergyAddActivityCell else { return UITableViewCell() }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellTraining) as? EnergyTrainingCell else { return UITableViewCell() }
                cell.delegate = self
                cell.setupCell(model: presenter.workoutWidgets[indexPath.row - 7])
                return cell
            }
        case 7 + presenter.workoutWidgets.count:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellAddActivity) as? EnergyAddActivityCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
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
        EnergyRouter(presenter: navigationController).presentUpdateWieght(delegate: self)
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
        
        if !PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .chooseAcivity) {
            guard let id = model.id else { return }
            WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id)
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
        
        if !PaywallRouter(presenter: navigationController).presentPaywall(delegate: self, place: .workoutTraini) {
            WorkoutRouter(presenter: navigationController).pushDetailWorkout(id: id)
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
