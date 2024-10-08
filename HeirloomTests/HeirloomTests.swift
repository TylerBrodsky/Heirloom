//
//  HeirloomTests.swift
//  HeirloomTests
//
//  Created by Tyler Brodsky on 9/10/24.
//

import XCTest
@testable import Heirloom

final class HeirloomTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    let testApamBalik = """
        {
            "idMeal": "53049",
            "strMeal": "Apam balik",
            "strDrinkAlternate": null,
            "strCategory": "Dessert",
            "strArea": "Malaysian",
            "strInstructions": "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\\r\\n\\r\\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\\r\\n\\r\\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\\r\\n\\r\\nCut into wedges and best eaten when it is warm.",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
            "strTags": null,
            "strYoutube": "https://www.youtube.com/watch?v=6R8ffRRJcrg",
            "strIngredient1": "Milk",
            "strIngredient2": "Oil",
            "strIngredient3": "Eggs",
            "strIngredient4": "Flour",
            "strIngredient5": "Baking Powder",
            "strIngredient6": "Salt",
            "strIngredient7": "Unsalted Butter",
            "strIngredient8": "Sugar",
            "strIngredient9": "Peanut Butter",
            "strIngredient10": "",
            "strIngredient11": "",
            "strIngredient12": "",
            "strIngredient13": "",
            "strIngredient14": "",
            "strIngredient15": "",
            "strIngredient16": "",
            "strIngredient17": "",
            "strIngredient18": "",
            "strIngredient19": "",
            "strIngredient20": "",
            "strMeasure1": "200ml",
            "strMeasure2": "60ml",
            "strMeasure3": "2",
            "strMeasure4": "1600g",
            "strMeasure5": "3 tsp",
            "strMeasure6": "1/2 tsp",
            "strMeasure7": "25g",
            "strMeasure8": "45g",
            "strMeasure9": "3 tbs",
            "strMeasure10": " ",
            "strMeasure11": " ",
            "strMeasure12": " ",
            "strMeasure13": " ",
            "strMeasure14": " ",
            "strMeasure15": " ",
            "strMeasure16": " ",
            "strMeasure17": " ",
            "strMeasure18": " ",
            "strMeasure19": " ",
            "strMeasure20": " ",
            "strSource": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            "strImageSource": null,
            "strCreativeCommonsConfirmed": null,
            "dateModified": null
        }
        """.data(using: .utf8)!
        
        func testApamBalikDessertDetailsDecoding() throws {
            let decoder = JSONDecoder()
            let dessertDetail = try decoder.decode(DessertDetails.self, from: testApamBalik)
            
            XCTAssertEqual(dessertDetail.id, "53049")
            XCTAssertEqual(dessertDetail.name, "Apam balik")
            XCTAssertEqual(dessertDetail.category, "Dessert")
            XCTAssertEqual(dessertDetail.area, "Malaysian")
            XCTAssertEqual(dessertDetail.instructions, """
            Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.
            """)
            XCTAssertEqual(dessertDetail.thumbnail, URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
            XCTAssertEqual(dessertDetail.youtubeURL, URL(string: "https://www.youtube.com/watch?v=6R8ffRRJcrg"))
            XCTAssertEqual(dessertDetail.source, URL(string: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ"))
           
            let expectedIngredients = ["Milk", "Oil", "Eggs", "Flour", "Baking Powder", "Salt", "Unsalted Butter", "Sugar", "Peanut Butter"]
            let expectedMeasurements = ["200ml", "60ml", "2", "1600g", "3 tsp", "1/2 tsp", "25g", "45g", "3 tbs"]
            
            XCTAssertEqual(dessertDetail.ingredients, expectedIngredients)
            XCTAssertEqual(dessertDetail.measurements, expectedMeasurements)
        }

}
