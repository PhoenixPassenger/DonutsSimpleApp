//
//  Batters.swift
//  Donuts
//
//  Created by Rodrigo Silva Ribeiro on 25/03/21.
//

import Foundation
struct Batters: Codable {
    let batter: [Topping]

    enum CodingKeys: String, CodingKey {
        case batter
    }
}
