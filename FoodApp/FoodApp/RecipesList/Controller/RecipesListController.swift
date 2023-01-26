//
//  RecipesListController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/11/23.
//

import Foundation

class RecipesListController {

    private let apiService = APIService()
    
    private var currentOffset = 0
    private var limit: Int?
    private var recipes: [RecipePreviewModel] = []
    private var isLoading = false

    func fetchRecipes(completion: @escaping ([RecipePreviewModel]) -> Void) {
        guard currentOffset < limit ?? 100 && !isLoading else { return }
        isLoading = true
        apiService.fetchRecipes(offset: currentOffset) { response in
            self.isLoading = false
            switch response {
            case .success(let data):
                self.currentOffset += data.number
                self.limit = data.totalResults
                self.recipes = data.results
                completion(self.recipes)
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }
}
