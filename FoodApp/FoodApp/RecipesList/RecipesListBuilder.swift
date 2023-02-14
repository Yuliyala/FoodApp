//
//  RecipesListBuilder.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 2/14/23.
//

import Foundation


struct RecipesListBuilder {
    
    func build() -> RecipesListViewController {
        let controller = RecipesListController()
        let viewController = RecipesListViewController()
        viewController.controller = controller
        return viewController
    }
}
