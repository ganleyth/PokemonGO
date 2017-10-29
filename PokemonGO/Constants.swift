//
//  Constants.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/26/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation

struct Constants {
    
    struct ReuseIdentifiers {
        static let storeAnnotationViewIdentifier = "storeAnnotationView"
        static let pokemonAnnotationViewIdentifier = "pokemonAnnotationView"
    }
    
    struct Notifications {
        static let nearbyPokemonUpdatedNotication: Notification.Name = Notification.Name(rawValue: "nearbyPokemonUpdated")
    }
    
    struct PokeAPI {
        static let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")
    }
}
