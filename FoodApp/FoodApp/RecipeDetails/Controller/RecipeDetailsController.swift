//
//  RecipeDetailsController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/17/23.
//

import UIKit

protocol RecipeDetailsControllerProtocol: AnyObject {
    func fetchRecipeInfo(completion: @escaping (Result<RecipeDetail, Error>) -> Void)
    func openLink()
}

class  RecipeDetailsController: RecipeDetailsControllerProtocol {
    
    let id: Int
    let apiService: APIServiceProtocol
    
    var details: RecipeDetail?
    
    init(id: Int, apiService: APIServiceProtocol = APIService()) {
        self.id = id
        self.apiService = apiService
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
