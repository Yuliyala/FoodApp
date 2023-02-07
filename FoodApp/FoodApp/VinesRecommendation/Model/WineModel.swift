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
    let description: String?
    let price: String
    let imageUrl: String
    let averageRating: Double
}

enum WineType: String , CaseIterable{
    case whiteWine = "white_wine"
    case redWine = "red_wine"
    case dessertWine = "dessert_wine"
    case roseWine = "rose_wine"
    case sparklingWine = "sparkling_wine"
    case sherry
    case vermouth
    case fruitWine = "fruit_wine"
    case mead
    
    var readable: String {
        switch self {
        case .whiteWine:
            return "White Wine"
        case .redWine:
            return "RedWine"
        case .dessertWine:
            return "Dessert Wine"
        case .roseWine:
            return "Rose Wine"
        case .sparklingWine:
            return "Sparkling Wine"
        case .sherry:
            return "Sherry"
        case .vermouth:
            return "Vermouth"
        case .fruitWine:
            return "FruitWine"
        case .mead :
            return "Mead"
        }
    }
}
