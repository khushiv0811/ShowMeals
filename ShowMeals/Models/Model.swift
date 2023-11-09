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
    var id: UUID
    let strMeal: String
    let idMeal: String
    let strMealThumb: String
    var mealPoster: URL? {
        URL(string: strMealThumb)
    }
}

struct Meals: Decodable {
    let meals: [Meals]
}
