//
//  RecipeDetailsController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/17/23.
//

import UIKit


class  RecipeDetailsController {
    
    let id: Int
    let apiService = APIService()
    
    var details: RecipeDetail?
    
    init(id: Int) {
        self.id = id
    }
    
    func fetchRecipeInfo(completion: @escaping (Result<RecipeDetail, Error>) -> Void) {
        apiService.fetchRecipe(id: id) { result in
            switch result {
            case.success(let data):
                self.details = data
                completion(.success(data))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func openLink() {
        guard let link = details?.sourceUrl , let url = URL(string:link ) else { return }
        // открывает ссылку в браузере
        UIApplication.shared.open(url)
    }
}
