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
   
        fetchData(from: url, completion: completion)
    }
    
    func fetchRecipe(id: Int,  completion: @escaping (Result<RecipeDetail, Error>) -> Void){
        let url = host + String(format: URLPathes.getRecipe, id, apiKey)
   
        fetchData(from: url, completion: completion)
    }
    
    func fetchWines(completion: @escaping (Result<WineRecommendation, Error>) -> Void) {
        let url = host + String(format: URLPathes.getWines, apiKey)
        fetchData(from: url, completion: completion)
    }
    
    func fetchData<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url).validate().response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(model))
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
    static let getWines = "food/wine/recommendation?wine=red_wine&number=100&apiKey=%@"
}

//%@ - для String , %d для Int
