//
//  EnergyPresenter.swift
//  izzifit
//
//  Created by Andrey S on 05.03.2022.
//

import Foundation
import Apollo
import UIKit
import HealthKit
import StoreKit
import SwiftyStoreKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol EnergyOutputProtocol: BaseController {
    func success()
    func successWidgetList()
    func successStepsEnergy()
    func failure()
    func showEnergyAnimation()
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
    private let healthStore = HKHealthStore()
    var paymentsInfo = [PaymentsModel]()
    
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
    var specialPriceNotBuing: [WorkoutsWidgetMainModel] = []
    var specialPriceBuing: [WorkoutsWidgetMainModel] = []
    var chooseWorkoutWidgets: [WorkoutsWidgetMainModel] = []
    var dietsPlanModels: [DietPlanModel] = []
    var stepsApi: [StepsModel] = []
    var steps: [CurrentStepsModel] = []
    var stepsWidget: StapsWidgetModel?
    
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
        
        group.enter()
        let query9 = SpecialWorkoutsQuery()
        let _ = Network.shared.query(model: SpecialWorkoutsModel.self, query9, controller: view, successHandler: { [weak self] model in
            self?.specialPriceNotBuing = model.specialWorkouts.filter({$0.isAvailable != true})
            self?.specialPriceBuing = model.specialWorkouts.filter({$0.isAvailable == true})
            
            let ids = model.specialWorkouts.compactMap({$0.externalId})
            self?.retriveNotAutoProduct(id: Set(ids))
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let query10 = DietPlansQuery(offset: 0, limit: 5)
        let _ = Network.shared.query(model: DietPlansModel.self, query10, controller: view, successHandler: { [weak self] model in
            self?.dietsPlanModels = model.dietPlans.dietPlans
            group.leave()
        }, failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        })
        
        group.enter()
        let _ = HealthKitManager.sharedManager.querySteps(controller: view) { [weak self] stepsApi, stepsModel in
            self?.stepsApi = stepsApi
            self?.steps = stepsModel
            group.leave()
        } failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        }
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            self?.view?.stopLoading()
            self?.view?.success()
        }
    }
    
    func setSteps() {
        var steps = [SaveStepsInputRecord]()
        for step in stepsApi {
            let date = step.date
            let count = step.steps
            let record = SaveStepsInputRecord(date: date, count: count)
            steps.append(record)
        }
        let mutation = SaveStepsMutation(steps: steps)
        let _ = Network.shared.mutation(model: SaveStepsModel.self, mutation, controller: view) { [weak self] model in
            self?.getStepsEnergy()
        } failureHandler: { [weak self] error in
            self?.view?.failure()
        }
    }
    
    func getStepsEnergy() {
        let query = StepsWidgetQuery()
        let _ = Network.shared.query(model: StepsWidgetDataModel.self, query, controller: view) { [weak self] model in
            self?.stepsWidget = model.stepsWidget
            self?.view?.successStepsEnergy()
        } failureHandler: { [weak self] error in
            self?.view?.failure()
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
            if self?.weightWidget?.energy == nil || self?.weightWidget?.energy == 0 {
                self?.view?.showEnergyAnimation()
            }
            
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
            
            if model.me.energy ?? 0 > KeychainService.standard.me?.energy ?? 0 {
                self?.view?.showEnergyAnimation()
            }
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
            //let types = model.widgetList ?? []
            //PreferencesManager.sharedManager.widgetList = types
            self?.view?.successWidgetList()
        } failureHandler: { _ in
        }
    }
    
    private func retriveNotAutoProduct(id: Set<String>) {
    
        if Set(paymentsInfo.compactMap({$0.product})) == id {
            return
        }
        
        SwiftyStoreKit.retrieveProductsInfo(id) { [weak self] results in
            if let invalidProductId = results.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                return
            }
            self?.paymentsInfo.removeAll()
            for product in results.retrievedProducts {
                if let priceString = product.localizedPrice
                    {
                    
                    let model = PaymentsModel(product: product.productIdentifier, prettyPrice: priceString, period: "", number: 0, price: product.price.doubleValue, currencySymbol: product.priceLocale.currencySymbol)
                    self?.paymentsInfo.append(model)
                } else {
                    debugPrint(">>>>>>>>>>>>>>>>>>>incorrect product!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                }
            }
            
            if self?.paymentsInfo.count == id.count {
                self?.view?.success()
            }
        }
    }
}
