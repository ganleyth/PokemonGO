//
//  PokemonGOAnnotation.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/27/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation
import MapKit

class PokemonGOAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let type: AnnotationType
    
    init(title: String? = nil, coordinate: CLLocationCoordinate2D, type: AnnotationType) {
        self.title = title
        self.coordinate = coordinate
        self.type = type
    }
}

extension PokemonGOAnnotation {
    enum AnnotationType: String {
        case store = "StorePlacemark"
        case pokemon = "PokemonPlacemark"
    }
}
