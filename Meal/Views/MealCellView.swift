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
        VStack(alignment: .leading) {
            HStack {
                MealImageView(meal: meal)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                Text(meal.name)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .bold()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(lineWidth: 2)
                .foregroundColor(.orange)
        }
    }
}


struct MealCellView_Previews: PreviewProvider {
    static var previews: some View {
        MealCellView(meal: Meal(id: "1", name: "Cake", mealImage: ""))
    }
}
