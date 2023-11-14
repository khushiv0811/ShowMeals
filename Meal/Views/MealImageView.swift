//
//  MealImageView.swift
//  ShowMeals
//
//  Created by Kushboo Patel on 11/14/23.
//

import SwiftUI

//MARK: Meal Image
struct MealImageView: View {
    var meal: Meal
    var body: some View {
        AsyncImage(url: URL(string: meal.mealImage)) { phase in
            switch phase {
            case .empty:
                VStack {
                    ProgressView()
                    Text("Loading...")
                }
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .shadow(radius: 10)
            case .failure:
                Image(systemName: "photo.artframe")
            @unknown default:
                EmptyView()
            }
        }
    }
}
struct MealImageView_Previews: PreviewProvider {
    static var previews: some View {
        MealImageView(meal: Meal(id: "1", name: "Deserts", mealImage: ""))
    }
}
