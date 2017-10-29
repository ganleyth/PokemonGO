//
//  NetworkController.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/28/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func performDataTaskFor(url: URL, with completion: @escaping (Data?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            completion(data, error)
        }
        dataTask.resume()
    }
}
