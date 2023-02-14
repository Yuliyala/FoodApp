//
//  RecipePreviewModel.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/11/23.
//

import Foundation

struct RecipePreviewModel: Codable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}

struct RecipesSearchResult: Codable {
    let results: [RecipePreviewModel]
    let offset: Int
    let number: Int
    let totalResults: Int
}
