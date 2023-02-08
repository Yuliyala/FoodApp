//
//  RecipeDetailsController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/17/23.
//

import Foundation


class  RecipeDetailsController {
    
    let id: Int
    let apiService = APIService()
    
    init(id: Int) {
        self.id = id
    }
    
    func fetchRecipeInfo(completion: @escaping (Result<RecipeDetail, Error>) -> Void) {
        apiService.fetchRecipe(id: id, completion: completion)
    }
}
