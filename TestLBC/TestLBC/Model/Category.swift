//
//  Category.swift
//  TestLBC
//
//  Created by Guillaume on 07/03/2023.
//

import Foundation

struct Category {
    static var id: [Int: String] = [:]
}

struct CategoryDowloaded: Codable {
    let id: Int
    let name: String
}
