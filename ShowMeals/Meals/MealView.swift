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
        List(viewModel.mealList) { meal in
            NavigationLink {
                // move to detail view here
            } label: {
                Text(meal.name)
            }

        }
        .onAppear{
            viewModel.fetchInitialData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}
