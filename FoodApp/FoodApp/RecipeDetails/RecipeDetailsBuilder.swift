//
//  RecipeDetailsBuilder.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/17/23.
//

import Foundation


struct RecipeDetailsBuilder {
    
    func build(id: Int) -> RecipeDetailsViewController {
        let controller = RecipeDetailsController(id: id)
        let viewController = RecipeDetailsViewController()
        viewController.controller = controller
        return viewController
    }
}
