//
//  MealCellView.swift
//  ShowMeals
//
//  Created by Kushboo Patel on 11/14/23.
//

import SwiftUI

//MARK: Meal Cell

struct MealCellView: View {
    var meal: Meal
    var body: some View {
        HStack {
            MealImageView(meal: meal)
                .padding(.trailing, 10)
                .frame(width: 100)
                .cornerRadius(10)
            Text(meal.name)
                .font(.title3)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .bold()
        }
    }
}


struct MealCellView_Previews: PreviewProvider {
    static var previews: some View {
        MealCellView(meal: Meal(id: "1", name: "Cake", mealImage: ""))
    }
}
