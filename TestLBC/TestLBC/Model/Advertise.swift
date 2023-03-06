//
//  Advertise.swift
//  TestLBC
//
//  Created by Guillaume on 06/03/2023.
//

import Foundation

struct Advertise: Codable {
    let id: Int
    let categoryId: Int
    let title: String
    let description: String
    let price: Int
    let imagesUrl: [String: String]
    let creationDate: String
    let isUrgent: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryId = "category_id"
        case title
        case description
        case price
        case imagesUrl = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
    }
}
