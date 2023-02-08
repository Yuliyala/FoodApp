//
//  RecipeDetailModel.swift
//  FoodApp
//
//  Created by Yuliya Lapenak on 1/17/23.
//

import Foundation


struct RecipeDetail: Codable {
    
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let sourceUrl: String
    let image: String
    let summary: String
    let cuisines: [String]
    let dishTypes: [String]
    let diets: [String]
    
    let vegetarian: Bool
    let glutenFree: Bool
    let dairyFree: Bool
    let veryHealthy: Bool
    let cheap: Bool
    let veryPopular: Bool
    let preparationMinutes: Int
    let cookingMinutes: Int
    let aggregateLikes: Int
    let healthScore: Int
    let sourceName: String
    let pricePerServing: Double
    let extendedIngredients: [Ingredient]
    
    let analyzedInstructions: [Instruction]
}

struct Ingredient: Codable {
    let id: Int
    let image: String?
    let name: String
    let original: String
    let amount: Double
    let unit: String
    
    var imageLink: String? {
    
        guard let image = image else {return nil}
        return "https://spoonacular.com/cdn/ingredients_250x250/" + image
    }
}

struct Instruction: Codable {
    let steps: [InstructionStep]
}

struct InstructionStep: Codable {
    let number: Int
    let step: String
}
