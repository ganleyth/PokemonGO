//
//  PokemonController.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/28/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation
import GameKit

class PokemonController {
    static let shared = PokemonController()
    var nearbyPokemon: [Pokemon] = [] {
        didSet {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Constants.Notifications.nearbyPokemonUpdatedNotication, object: self)
            }
        }
    }
    
    private var spriteLoadingDispatchGroup = DispatchGroup()
    private let decoder = JSONDecoder()
    
    // MARK: - CRUD
    func addNearbyPokemon(_ pokemon: Pokemon) {
        nearbyPokemon.append(pokemon)
    }
    
    func removeNearbyPokemon(_ pokemon: Pokemon) {
        guard let index = nearbyPokemon.index(where: { $0 == pokemon }) else { return }
        nearbyPokemon.remove(at: index)
    }
    
    // MARK: - Pokemon fetching
    func fetchInitialPokemonBatch() {
        guard let baseURL = Constants.PokeAPI.baseURL else { return }
        let randomIDs = randomPokemonIDs()
        var fetchedPokemon: [Pokemon] = []
        
        for randomID in randomIDs {
            let endPoint = baseURL.appendingPathComponent("\(randomID)")
            spriteLoadingDispatchGroup.enter()
            NetworkController.performDataTaskFor(url: endPoint, with: { (data, error) in
                if let error = error { NSLog("Error fetching initial pokemon batch: \(error.localizedDescription)"); return }
                guard let pokemonData = data else { NSLog("Data returned from initial pokemon fetch is nil"); return }
                guard var pokemon = try? self.decoder.decode(Pokemon.self, from: pokemonData) else { NSLog("JSON decoding failed"); return }
                self.fetchSprite(for: pokemon, with: { (data) in
                    pokemon.setSpriteData(value: data)
                    fetchedPokemon.append(pokemon)
                    self.spriteLoadingDispatchGroup.leave()
                })
                self.spriteLoadingDispatchGroup.leave()
            })
        }
        
        spriteLoadingDispatchGroup.notify(queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)) {
            self.nearbyPokemon = fetchedPokemon
        }
    }
    
    // MARK: - Helper methods
    private func randomPokemonIDs() -> [Int] {
        var randomIDs: [Int] = []
        let randomGenerator = GKRandomSource.sharedRandom()
        for _ in 0..<10 {
            let randomID = randomGenerator.nextInt(upperBound: 152) + 1
            randomIDs.append(randomID)
        }
        
        return randomIDs
    }
    
    private func fetchSprite(for pokemon: Pokemon, with completion: @escaping (Data?) -> Void) {
        guard let endPoint = URL(string: pokemon.spriteURLs.frontDefault) else { completion(nil); return }
        spriteLoadingDispatchGroup.enter()
        NetworkController.performDataTaskFor(url: endPoint) { (data, error) in
            if let error = error { NSLog("Error fetching sprite: \(error.localizedDescription)"); completion(nil); return }
            guard let data = data else { NSLog("Data returned for sprite is nil"); completion(nil); return }
            completion(data)
        }
    }
}
