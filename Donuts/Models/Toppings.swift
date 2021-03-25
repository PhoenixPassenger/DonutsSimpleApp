//
//  Toppings.swift
//  Donuts
//
//  Created by Rodrigo Silva Ribeiro on 25/03/21.
//

import Foundation
struct Topping: Codable {
    let id: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id
        case type
    }
}
