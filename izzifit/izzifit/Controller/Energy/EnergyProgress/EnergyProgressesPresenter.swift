//
//  EnergyProgressesPresenter.swift
//  izzifit
//
//  Created by mob325 on 11.03.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol EnergyProgressesOutputProtocol: BaseController {
    func success()
    func failure()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol EnergyProgressesProtocol: AnyObject {
    init(view: EnergyProgressesOutputProtocol)
    
    func getProgresses(dateOne: Date, dateTwo: Date)
}

class EnergyProgressesPresenter: EnergyProgressesProtocol {
    
    private weak var view: EnergyProgressesOutputProtocol?
    private let uuid = UIDevice.current.identifierForVendor!.uuidString
    
    required init(view: EnergyProgressesOutputProtocol) {
        self.view = view
    }
    
    var progersses: [ProgressesMainModel] = []
    
    func getProgresses(dateOne: Date, dateTwo: Date) {
        
        let dateFormmater = DateFormatter()
        dateFormmater.locale = Locale(identifier: "en_US_POSIX")
        dateFormmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" 
        
        let from = dateFormmater.string(from: dateOne)
        let to = dateFormmater.string(from: dateTwo)
        view?.startLoader()
        
        let query = ProgressesQuery(from: from, to: to)
        let _ = Network.shared.query(model: ProgressesModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.progersses = model.progresses
            self?.view?.stopLoading()
            self?.view?.success()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure()
        })
        
    }
}
