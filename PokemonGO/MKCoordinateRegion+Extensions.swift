//
//  MKCoordinateRegion+Extensions.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/31/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation
import MapKit
import GameKit

extension MKCoordinateRegion {
    
    func randomLocationInRegion() -> CLLocationCoordinate2D {
        let minLongitude = center.longitude - span.longitudeDelta/2
        let maxLongitude = center.longitude + span.longitudeDelta/2
        let minLatitude = center.latitude - span.latitudeDelta/2
        let maxLatitude = center.latitude + span.latitudeDelta/2
        
        let upperBoundRandomLongitude = Int(maxLongitude - minLongitude) * 1000
        let randomLongitudeOffset = Double(GKRandomSource.sharedRandom().nextInt(upperBound: upperBoundRandomLongitude)) / 1000.0
        let randomLongitude = randomLongitudeOffset + minLongitude
        
        let upperBoundRandomLatitude = Int(maxLatitude - minLatitude) * 1000
        let randomLatitudeOffset = Double(GKRandomSource.sharedRandom().nextInt(upperBound: upperBoundRandomLatitude)) / 1000.0
        let randomLatitude = randomLatitudeOffset + minLatitude
        
        return CLLocationCoordinate2DMake(randomLatitude, randomLongitude)
    }
    
}
