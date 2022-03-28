//
//  ProfilePresenter.swift
//  izzifit
//
//  Created by O l e h on 24.03.2022.
//

// Стягиваешь схему перед каждым новым запросом
// - перепписываешь в модель названия модели из фейкера

import Foundation

protocol ProfileOutputProtocol: BaseController {
    func success()
    func failure()
}

protocol ProfilePresenterProtocol: AnyObject {
    init(view: ProfileOutputProtocol)
    func getRankTypes(from: String, to: String)
}


class ProfilePresenter: ProfilePresenterProtocol {
    
    private weak var view: ProfileOutputProtocol?
    
    
    required init(view: ProfileOutputProtocol) {
        self.view = view
    }
    
    var rank: RankMainModel?
    var moods: [MoodsMainModel]?
    
    
    func getRankTypes(from: String, to: String) {
        view?.startLoader()
        
        let group = DispatchGroup()
        
        group.enter()
        
        let query1 = RankQuery()
        
        let _ = Network.shared.query(model: RankModel.self, query1, controller: view) { [weak self] model in
            self?.rank = model.rank
            group.leave()
        } failureHandler: { [weak self] error in
            group.leave()
            self?.view?.failure()
        }
        
        group.enter()
        let query2 = MoodsQuery(from: from, to: to)
        let _ = Network.shared.query(model:  MoodsModel.self,
                                     query2,
                                     controller: view) { [weak self] model in
            self?.moods = model.moods
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
}
