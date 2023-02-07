//
//  WinesRecommendationController.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/31/23.
//

import Foundation


class  WinesRecommendationController {
    
    let apiService = APIService()
    private var wines: [WineModel] = []
    private var total: Int?
    
    func fetchWines(wineType: WineType = .redWine, completion: @escaping (Result<[WineModel], Error>) -> Void) {
        apiService.fetchWines(wineType: wineType) { result in
            switch result {
            case.success(let data):
                completion(.success(data.recommendedWines))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}

