//
//  MealDetailResponse.swift
//  ShowMealsTests
//
//  Created by Kushboo Patel on 11/16/23.
//

import XCTest
@testable import ShowMeals

final class DessertDetailResponseTests: XCTestCase {

    /// Tests the decoding of the DessertDetailResponse struct
    func testDessertDetailResponseDecoding() throws {
        // Given
        let jsonData = try MockDataLoader.loadMockData(fromFile: "MockMealDetailsResponse")
        
        // When
        let decoder = JSONDecoder()
        let response = try decoder.decode(MealDetailResponse.self, from: jsonData)
        
        // Then
        XCTAssertNotNil(response.meals)
        XCTAssertEqual(response.meals.count, 1)
        
        // Verify the details of the first meal
        let meal = response.meals.first
        XCTAssertEqual(meal?.id, "52893")
        XCTAssertEqual(meal?.name, "Apple & Blackberry Crumble")
        XCTAssertEqual(meal?.thumbnail, "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
        XCTAssertEqual(meal?.category, "Dessert")
        XCTAssertEqual(meal?.instructions, "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.")
        XCTAssertEqual(meal?.tags, "Pudding")
        XCTAssertEqual(meal?.youtube, "https://www.youtube.com/watch?v=4vhcOwVBDO4")
    }
}
