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
        VStack {
            Text("Deserts")
                .bold()
                .font(.title)
                .padding(.all, 15)
            ScrollView {
                VStack {
                    ForEach(viewModel.mealList, id: \.id) { meal in
                        NavigationLink(destination: MealDetailView(meal: meal)) {
                            MealCellView(meal: meal)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 12)
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











