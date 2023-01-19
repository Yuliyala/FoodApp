//
//  ApiService.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/11/23.
//

import Foundation
import Alamofire

class APIService {
    
    let host = "https://api.spoonacular.com/"
    let apiKey = "30ff578cb7d54bd8935d52b9d0e7dd15"
    
    func fetchRecipes(offset: Int = 0, completion: @escaping (Result<RecipesSearchResult, Error>) -> Void) {
        let url = host + String(format: URLPathes.getRecipes, apiKey, offset, 30)
        AF.request(url).validate().response { response in
            switch response.result {
            case .success(let data):
                if let data = data,
                   let recipes = try? JSONDecoder().decode(RecipesSearchResult.self, from: data){
                    completion(.success(recipes))
                } else {
                    completion(.failure(APIError.noData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func fetchRecipe(id: Int,  completion: @escaping (Result<RecipeDetail, Error>) -> Void){
        let url = host + String(format: URLPathes.getRecipe, id, apiKey)
        AF.request(url).validate().response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let recipes = try JSONDecoder().decode(RecipeDetail.self, from: data)
                        completion(.success(recipes))
                    } catch {
                        completion(.failure(error))
                    }
                    
                } else {
                    completion(.failure(APIError.noData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

enum APIError: Error {
    case noData
}

struct URLPathes {
    
    static let getRecipes = "recipes/complexSearch?apiKey=%@&offset=%d&number=%d"
    static let getRecipe = "recipes/%d/information?apiKey=%@"
}

//%@ - для String , %d для Int
