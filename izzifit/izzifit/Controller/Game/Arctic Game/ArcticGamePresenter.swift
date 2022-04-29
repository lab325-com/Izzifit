//
//  ArcticGamePresenter.swift
//  izzifit
//
//  Created by Andrey S on 29.04.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol ArcticGameOutputProtocol: BaseController {
    func success()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol ArcticGameProtocol: AnyObject {
    init(view: ArcticGameOutputProtocol)
    
    func getMap()
}

class ArcticGamePresenter: ArcticGameProtocol {
    ///702FB234-1112-437A-9998-9BF039199C17
    private weak var view: ArcticGameOutputProtocol?
    
    var map: MapMainModel?
    
    required init(view: ArcticGameOutputProtocol) {
        self.view = view
    }
    
    func getMap() {
        view?.startLoader()
        let query = MapQuery()
        let _ = Network.shared.query(model: MapModel.self, query, controller: view, successHandler: { [weak self] model in
            self?.map = model.map
            self?.view?.success()
            self?.view?.stopLoading()
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        })
    }
}
