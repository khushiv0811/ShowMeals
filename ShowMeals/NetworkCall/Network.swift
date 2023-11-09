//
//  Network.swift
//  ShowMeals
//
//  Created by Kushboo Patel on 11/9/23.
//

import Foundation
import Combine

enum NetworkFailure {
    case invalidURL
}

func fetchMeals() -> some Publisher<Meals, Error> {
    let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
    return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .map(\.data)
        .print()
        .decode(type: Meals.self, decoder: jsonDecoder)
}

func fetchMealDetails(meal: Meal) -> some Publisher<MealDetail, Error> {
    let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(meal.id)")!
    return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: MealDetail.self, decoder: jsonDecoder)
}
