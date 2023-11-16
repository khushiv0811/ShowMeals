//
//  MealDetailView.swift
//  ShowMeals
//
//  Created by Kushboo Patel on 11/10/23.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject var viewModel: MealDetailViewModel
    init(meal: Meal) {
        _viewModel = StateObject(wrappedValue: MealDetailViewModel(meal: meal ))
    }
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.mealInfo, id: \.id) { mealinformation in
                    VStack(alignment: .leading) {
                        MealImageView(meal: viewModel.meal)
                            .frame(width: 150, height: 150)
                            .cornerRadius(75)
                            .shadow(radius: 10)
                        Spacer()
                        createTitles(title: "Ingredients")
                        ForEach(mealinformation.ingredients ?? [], id: \.hashValue) {
                            ingredient in
                            
                            createIngredientsView(ingredient: ingredient.name, measument: ingredient.measure)
                            
                        }
                        Spacer()
                        createTitles(title: "Instructions")
                        createInstructionsView(instructions: mealinformation.instructions ?? "")
                    }
                    
                }
            }
        }
        .navigationTitle(viewModel.meal.name)
        .onAppear{
            viewModel.fetchInitialData()
        }
    }
    @ViewBuilder
    func createTitles(title: String) -> some View {
        Text(title)
            .font(.title2)
            .bold()
            .foregroundColor(.black)
            .padding(.leading, 15)
    }
    @ViewBuilder
    func createIngredientsView(ingredient: String, measument: String) -> some View {
        VStack{
            HStack{
                Circle()
                    .foregroundColor(.black)
                    .frame( height: 8)
                Text(measument)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Text(ingredient)
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.8))
                Spacer()
            }//: HStack
            .font(.title3)
            .padding(.horizontal, 12)
        }
    }
    @ViewBuilder
    func createInstructionsView(instructions: String) -> some View {
        VStack {
            Text(instructions)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .padding(.bottom, 10)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray.opacity(0.5))
                .padding(.leading, 10)
                .padding(.trailing, 10)
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: Meal(id: "", name: "Cake", mealImage: ""))
    }
}
