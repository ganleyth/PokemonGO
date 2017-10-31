//
//  Pokemon.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/28/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation
import CoreLocation

struct Pokemon: Codable {
    let name: String
    let id: Int
    let spriteURLs: PokemonSpriteURLs
    var spriteData: Data? = nil
    var coordinate: CLLocationCoordinate2D? = nil
    
    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case spriteURLs = "sprites"
    }
}

struct PokemonSpriteURLs: Codable {
    let frontDefault: String
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

extension Pokemon: Equatable {
    static func ==(lhs: Pokemon, rhs: Pokemon) -> Bool {
        if lhs.name != rhs.name { return false }
        if lhs.id != rhs.id { return false }
        return true
    }
}

extension Pokemon {
    mutating func setSpriteData(value: Data) {
        spriteData = value
    }
    
    mutating func setCoordinate(value: CLLocationCoordinate2D) {
        coordinate = value
    }
}
