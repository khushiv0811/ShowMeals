//
//  MealsViewModel.swift
//  ShowMeals
//
//  Created by Kushboo Patel on 11/9/23.
//

import Foundation
import Combine

final class MealsViewModel: ObservableObject {
    @Published var mealList: [Meal] = []
    
    func fetchInitialData()
    {   Networkcall().fetchMeals()
        .map(\.meals)
        .receive(on: DispatchQueue.main)
        .replaceError(with: [])
        .assign(to: &$mealList)
    }
}
