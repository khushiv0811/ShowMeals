//
//  MockNetworkCall.swift
//  ShowMealsTests
//
//  Created by Kushboo Patel on 11/16/23.
//

import XCTest
import Combine
@testable import ShowMeals


class NetworkTests: XCTestCase {
    func testFetchMeals() {
        
        let expectation = XCTestExpectation(description: "Meals fetched successfully")
        _ = Networkcall().fetchMeals()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        expectation.fulfill()
                    case .failure(let error):
                        XCTFail("Failed to fetch meals with error: \(error)")
                    }
                },
                receiveValue: { mealsResponse in
                    // Perform assertions on the mealsResponse if needed
                }
            )
    }
    
    func testFetchMealDetails() {
        
        let meal = Meal(id: "123", name: "TestMeal", mealImage: "test.jpg")
        let expectation = XCTestExpectation(description: "Meal details fetched successfully")
        _ = Networkcall().fetchMealDetails(meal: meal)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        expectation.fulfill()
                    case .failure(let error):
                        XCTFail("Failed to fetch meal details with error: \(error)")
                    }
                },
                receiveValue: { mealDetailResponse in
                    // Perform assertions on the mealDetailResponse if needed
                }
            )
    }
}


