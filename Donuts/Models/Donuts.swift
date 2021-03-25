//
//  Donuts.swift
//  Donuts
//
//  Created by Rodrigo Silva Ribeiro on 25/03/21.
//

import Foundation
struct Donut: Codable {
    let id: String
    let type: String
    let name: String
    let ppu: Double
    let batters: Batters
    let topping: [Topping]

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case name
        case ppu
        case batters
        case topping
    }
}
