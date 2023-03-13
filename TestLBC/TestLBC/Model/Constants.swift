//
//  Constants.swift
//  TestLBC
//
//  Created by Guillaume on 07/03/2023.
//

import Foundation
import UIKit

struct ColorsScheme {
    static let background = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let backgroundUrgent = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    static let backgroundTitle = UIColor(red: 0/255, green: 150/255, blue: 200/255, alpha: 1)
    static let backgroundSubtitle = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0.8)
    static let backgroundCell = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
    static let backgroundButton = UIColor(red: 180/255, green: 12/255, blue: 0/255, alpha: 1)
    static let text = UIColor(red: 255/255, green: 120/255, blue: 0/255, alpha: 1)
}

struct Urls {
    static let listing = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
    static let categories = "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json"
}


