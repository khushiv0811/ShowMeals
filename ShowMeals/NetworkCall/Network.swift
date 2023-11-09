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
        .decode(type: Meals.self, decoder: jsonDecoder)
}
