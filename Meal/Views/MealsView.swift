//
//  ContentView.swift
//  ShowMeals
//
//  Created by Kushboo Patel on 11/9/23.
//

import SwiftUI

struct MealsView: View {
    @StateObject var viewModel = MealsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.mealList) { meal in
                NavigationLink(destination: MealDetailView()) {
                    MealCellView(meal: meal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .listStyle(.plain)
            .foregroundColor(.black)
            .scrollContentBackground(.hidden)
            .navigationTitle("Deserts")
        }
        .onAppear {
            viewModel.fetchInitialData()
        }
    }
}


struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}











