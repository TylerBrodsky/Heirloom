//
//  Dessert.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/11/24.
//

import Foundation

struct Dessert: Identifiable, Codable {
    let id: String
    let name: String
    let thumbnail: URL
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}
