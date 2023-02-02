//
//  WineModel.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/31/23.
//

import Foundation


struct WineRecommendation: Decodable {
    let recommendedWines: [WineModel]
    let totalFound: Int
}

struct WineModel: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let imageUrl: String
    let averageRating: Double
}


