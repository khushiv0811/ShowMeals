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

struct MealsResponse: Decodable {
    let meals: [Meal]
}

struct MealDetail: Decodable, Identifiable, Hashable {
    var id: String
    let name: String?
    let category: String?
    let instructions: String?
    let thumbnail: String?
    let tags: String?
    let youtube: String?
    let ingredients: [Ingredient]?
}

struct Ingredient: Decodable, Hashable {
    let name: String
    let measure: String
}



//Currently,the API response has 20 fields some of which are nil/null, we need to write a custom decoder that excludes nil fields and properly decodes them into an array so we can iterate
extension MealDetail {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDict = try container.decode([String: String?].self)
        var index = 1
        var ingredients: [Ingredient] = []
        while let ingredient = mealDict["strIngredient\(index)"] as? String,
              let measure = mealDict["strMeasure\(index)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            ingredients.append(.init(name: ingredient, measure: measure))
            index += 1
        }//: while
            self.ingredients = ingredients
            id = mealDict["idMeal"] as? String ?? ""
            name = mealDict["strMeal"] as? String ?? ""
            category = mealDict["strCategory"] as? String ?? ""
            instructions = mealDict["strInstructions"] as? String ?? ""
            thumbnail = mealDict["strMealThumb"] as? String ?? ""
            tags = mealDict["strTags"] as? String ?? ""
            youtube = mealDict["strYoutube"] as? String ?? ""
        }//: init
    }

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]
}

extension MealDetail {
    static let mealTest = MealDetail(id: "", name: "Apam balik", category: "Dessert", instructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.", thumbnail:  "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", tags: nil, youtube: "https://www.youtube.com/watch?v=6R8ffRRJcrg", ingredients: MealDetail.ingredientTest )
}

extension MealDetail {
    static let ingredientTest: [Ingredient]?  =
    [
        Ingredient(name: "Milk", measure: "200ml"),
        Ingredient(name: "Oil", measure: "60ml"),
        Ingredient(name: "Eggs", measure: "2"),
        Ingredient(name: "Flour", measure: "1600g"),
        Ingredient(name: "Baking Powder", measure: "3 tsp"),
        Ingredient(name: "Salt", measure: "1/2 tsp"),
        Ingredient(name: "Unsalted Butter", measure: "25g"),
        Ingredient(name: "Sugar", measure: "45g"),
        Ingredient(name: "Peanut Butter", measure: "3 tbs")
    ]
}



