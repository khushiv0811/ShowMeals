//
//  MealDetailViewModel.swift
//  ShowMeals
//
//  Created by Kushboo Patel on 11/14/23.
//

import Foundation
import Combine

final class MealDetailViewModel: ObservableObject {
    @Published var mealInfo: [MealDetail] = []
    
    let meal: Meal
    init(meal: Meal) {
        self.meal = meal
    }
    
    func fetchInitialData() {
        Networkcall().fetchMealDetails(meal: meal)
            .map(\.meals)
            .print()
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .assign(to: &$mealInfo)
    }
}
