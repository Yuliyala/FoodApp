//
//  WinesBuilder.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/14/23.
//

import Foundation

struct WinesBuilder {
    
    func build() -> WinesViewController {
        let controller = WinesRecommendationController()
        let viewController = WinesViewController()
        viewController.controller = controller
        return viewController
    }
}
