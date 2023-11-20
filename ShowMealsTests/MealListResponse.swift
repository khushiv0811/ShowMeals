//
//  MealListResponse.swift
//  ShowMealsTests
//
//  Created by Kushboo Patel on 11/16/23.
//

import XCTest
@testable import ShowMeals

final class MealListResponse: XCTestCase {
    
    ///Tests the decoding of the DessertListResponse struct
    func testDessertListResponseDecoding() throws {
        // Given
        let jsonData = try MockDataLoader.loadMockData(fromFile: "MockMealDetailErrorResponse")
        
        // When
        let decoder = JSONDecoder()
        let response = try decoder.decode(MealsResponse.self, from: jsonData)
        
        // Then
        XCTAssertNotNil(response.meals)
        XCTAssertEqual(response.meals.count, 64)
        
        // Verify the details of the first meal
        let firstMeal = response.meals.first
        XCTAssertEqual(firstMeal?.id, "53049")
        XCTAssertEqual(firstMeal?.name, "Apam balik")
        XCTAssertEqual(firstMeal?.mealImage, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    }
}


