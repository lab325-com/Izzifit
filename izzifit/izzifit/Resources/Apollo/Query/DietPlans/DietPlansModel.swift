//
//  DietPlansModel.swift
//  izzifit
//
//  Created by Andrey S on 12.08.2022.
//

import Foundation

struct DietPlansModel: Codable {
    let dietPlans: DietDetailPlansModel
}

struct DietDetailPlansModel: Codable {
    let dietPlans: [DietPlanModel]
    
    enum CodingKeys: String, CodingKey {
        case dietPlans = "DietPlans"
    }
}
