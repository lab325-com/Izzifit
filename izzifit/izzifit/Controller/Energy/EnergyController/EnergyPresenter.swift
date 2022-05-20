//
//  EnergyPresenter.swift
//  izzifit
//
//  Created by Andrey S on 05.03.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol EnergyOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol EnergyPresenterProtocol: AnyObject {
    init(view: EnergyOutputProtocol)
    func getWidgets(date: String, loader: Bool)
    
    func setWater(index: Int, date: String)
    func setMood(mood: MoodType, date: String)
    
    func updateWeight()
    func getWidgetList()
}

class EnergyPresenter: EnergyPresenterProtocol {
    
    private weak var view: EnergyOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: EnergyOutputProtocol) {
        self.view = view
    }
    
    var drinkWidget: DrinkWidgetMainModel?
    var sleepWidget: SleepWidgetMainModel?
    var mealsWidget: MealsWidgetMainModel?
    var moodWidget: MoodWidgetMainModel?
    var todayProgress: TodayProgressMainModel?
    var weightWidget: SaveWeightWidgetMainModel?
    var workoutWidgets: [WorkoutsWidgetMainModel] = []
    var chooseWorkoutWidgets: [WorkoutsWidgetMainModel] = []
    var widgetsType: [WidgetEntityType] = []
    
    func getWidgets(date: String, loader: Bool = true) {
        
        if loader {
            view?.startLoader()
        }
        
        let group = DispatchGroup()
        
        group.enter()
        let query1 = DrinkWidgetQuery(date: date)
        let _ = Network.shared.query(model: DrinkWidgetModel.self, query1, controller: view, successHandler: { [weak self] model in
            self?.drinkWidget = model.drinkWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query2 = SleepWidgetQuery(date: date)
        let _ = Network.shared.query(model: SleepWidgetModel.self, query2, controller: view, successHandler: { [weak self] model in
            self?.sleepWidget = model.sleepWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        

        group.enter()
        let query3 = MealsWidgetQuery(date: date)
        let _ = Network.shared.query(model: MealsWidgetModel.self, query3, controller: view, successHandler: { [weak self] model in
            self?.mealsWidget = model.mealsWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query4 = MoodWidgetQuery(date: date)
        let _ = Network.shared.query(model: MoodWidgetModel.self, query4, controller: view, successHandler: { [weak self] model in
            self?.moodWidget = model.moodWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query5 = ProgressQuery()
        let _ = Network.shared.query(model: TodayProgressModel.self, query5, controller: view, successHandler: { [weak self] model in
            self?.todayProgress = model.progress
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query6 = SaveWeightWidgetQuery()
        let _ = Network.shared.query(model: SaveWeightWidgetModel.self, query6, controller: view, successHandler: { [weak self] model in
            self?.weightWidget = model.saveWeightWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query7 = WorkoutsWidgetQuery(date: date)
        let _ = Network.shared.query(model: WorkoutsWidgetModel.self, query7, controller: view, successHandler: { [weak self] model in
            self?.workoutWidgets = model.workoutsWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query8 = ChooseWorkoutWidgetQuery(date: date)
        let _ = Network.shared.query(model: ChooseWorkoutWidgetModel.self, query8, controller: view, successHandler: { [weak self] model in
            self?.chooseWorkoutWidgets = model.chooseWorkoutWidget
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            self?.view?.stopLoading()
            self?.view?.success()
        }
    }
    
    func setWater(index: Int, date: String) {
        view?.startLoader()
        
        let mutation = DrinkWaterMutation(cupsCount: index)
        let _ = Network.shared.mutation(model: DrinkWaterModel.self, mutation, controller: view, successHandler: { [weak self] model in
            let query = DrinkWidgetQuery(date: date)
            let _ = Network.shared.query(model: DrinkWidgetModel.self, query, controller: self?.view, successHandler: { [weak self] model in
                self?.drinkWidget = model.drinkWidget
                self?.updateToday()
            }, failureHandler: { [weak self] error in
                self?.view?.stopLoading()
                self?.view?.failure()
            })
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    func setMood(mood: MoodType, date: String) {
        view?.startLoader()
        
        let mutation = SaveMoodMutation(mood: mood)
        let _ = Network.shared.mutation(model: SaveMoodModel.self, mutation, controller: view, successHandler: { [weak self] model in
            let query = MoodWidgetQuery(date: date)
            let _ = Network.shared.query(model: MoodWidgetModel.self, query, controller: self?.view, successHandler: { [weak self] model in
                self?.moodWidget = model.moodWidget
                self?.updateToday()
            }, failureHandler: { [weak self] error in
                self?.view?.stopLoading()
                self?.view?.failure()
            })
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    func setSeleep(sleep: SleepQualityType, date: String) {
        view?.startLoader()
        
        let mutation = SaveSleepQualityMutation(quality: sleep)
        
        let _ = Network.shared.mutation(model: SaveSleepQualityModel.self, mutation, controller: view, successHandler: { [weak self] model in
            let query = SleepWidgetQuery(date: date)
            let _ = Network.shared.query(model: SleepWidgetModel.self, query, controller: self?.view, successHandler: { [weak self] model in
                self?.sleepWidget = model.sleepWidget
                self?.updateToday()
            }, failureHandler: { [weak self] error in
                self?.view?.stopLoading()
                self?.view?.failure()
            })
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    func updateWeight() {
        view?.startLoader()
        
        let queryWeight = SaveWeightWidgetQuery()
        
        let _ = Network.shared.query(model: SaveWeightWidgetModel.self, queryWeight, controller: view, successHandler: { [weak self] model in
            self?.weightWidget = model.saveWeightWidget
            self?.updateToday()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    private func updateToday() {
        let query5 = ProgressQuery()
        let _ = Network.shared.query(model: TodayProgressModel.self, query5, controller: view, successHandler: { [weak self] model in
            
            self?.getMe()
            self?.todayProgress = model.progress
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
    }
    
    func getMe() {
        let query = MeQuery()
        let _ = Network.shared.query(model: MeModel.self, query, controller: view) { [weak self] model in
            
            KeychainService.standard.me = model.me
            self?.view?.success()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        }
    }
    
    func getWidgetList() {
        let query = WidgetListQuery()
        let _ = Network.shared.query(model: WidgetListModel.self, query, controller: view) { [weak self] model in
            self?.widgetsType = model.widgetList.compactMap({$0.type})
        } failureHandler: { _ in
        }
    }
    
}
