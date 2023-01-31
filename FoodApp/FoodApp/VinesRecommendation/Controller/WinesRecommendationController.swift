//
//  WinesRecommendationController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/31/23.
//

import Foundation


class  WinesRecommendationController {
    
    let apiService = APIService()
    
    func fetchWines(completion: @escaping (Result<[WineModel], Error>) -> Void) {
        apiService.fetchWines { result in
            switch result {
            case .success(let wine):
                completion(.success(wine.recommendedWines))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}
