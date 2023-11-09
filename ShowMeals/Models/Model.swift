//
//  Model.swift
//  ShowMeals
//
//  Created by Kushboo Patel on 11/9/23.
//

import Foundation

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

//MARK: - Meals

struct Meal: Decodable, Identifiable, Equatable {
    var id: String
    let name: String
    let mealImage: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case id = "idMeal"
        case mealImage = "strMealThumb"
    }
}

struct Meals: Decodable {
    let meals: [Meal]
}

//MARK: - Meal Details

struct MealDetail: Decodable, Identifiable, Equatable {
    var id: String
    let instructions: String
    let youtubeURL: String
    let tags: String
    let source: String
    
    private enum CodingKeys: String, CodingKey {
        case id = ""
        case instructions = "strInstructions"
        case youtubeURL = "strYoutube"
        case tags = "strTags"
        case source = "strSource"
    }
}



