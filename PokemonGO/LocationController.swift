//
//  LocationController.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/27/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class LocationController {
    
    static let shared = LocationController()
    let locationManager = CLLocationManager()
    
    // MARK: - Map functions
    func fetchPointsOfInterest(inRegion region: MKCoordinateRegion, with completion: @escaping MKLocalSearchCompletionHandler) {
        let request = MKLocalSearchRequest()
        request.region = region
        request.naturalLanguageQuery = "restaurant"
        
        let search = MKLocalSearch(request: request)
        search.start(completionHandler: completion)
    }
}
