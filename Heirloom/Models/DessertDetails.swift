//
//  DessertDetails.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/11/24.
//

import Foundation

struct DessertDetails: Decodable {
    let id: String
    let name: String
    let category: String
    let area: String
    let instructions: String
    let thumbnail: URL
    let youtubeURL: URL?
    let source: URL?
    let ingredients: [String]
    let measurements: [String]
    let tags: String?
    let drinkAlternate: String?

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case youtubeURL = "strYoutube"
        case source = "strSource"
        case tags = "strTags"
        case drinkAlternate = "strDrinkAlternate"
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        category = try container.decode(String.self, forKey: .category)
        area = try container.decode(String.self, forKey: .area)
        instructions = try container.decode(String.self, forKey: .instructions)
        thumbnail = try container.decode(URL.self, forKey: .thumbnail)
        youtubeURL = try container.decodeIfPresent(URL.self, forKey: .youtubeURL)
        source = try container.decodeIfPresent(URL.self, forKey: .source)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        drinkAlternate = try container.decodeIfPresent(String.self, forKey: .drinkAlternate)
        
        let ingredientsArray: [String] = [
            try container.decodeIfPresent(String.self, forKey: .strIngredient1) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient2) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient3) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient4) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient5) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient6) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient7) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient8) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient9) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient10) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient11) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient12) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient13) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient14) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient15) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient16) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient17) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient18) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient19) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strIngredient20) ?? ""
        ]

        let measurementsArray: [String] = [
            try container.decodeIfPresent(String.self, forKey: .strMeasure1) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure2) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure3) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure4) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure5) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure6) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure7) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure8) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure9) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure10) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure11) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure12) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure13) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure14) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure15) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure16) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure17) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure18) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure19) ?? "",
            try container.decodeIfPresent(String.self, forKey: .strMeasure20) ?? ""
        ]

        ingredients = ingredientsArray.filter {!$0.isEmpty}
        measurements = measurementsArray.filter {!$0.isEmpty}
    }
}
