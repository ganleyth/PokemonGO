//
//  MKMapView+Extensions.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/27/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
    func setDefaultRegion() -> MKCoordinateRegion {
        let region = MKCoordinateRegionMakeWithDistance(self.centerCoordinate, 500, 200)
        let regionThatFits = self.regionThatFits(region)
        self.setRegion(regionThatFits, animated: true)
        
        return regionThatFits
    }
}
