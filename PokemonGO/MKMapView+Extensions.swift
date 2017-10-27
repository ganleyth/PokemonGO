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
    func setDefaultRegion() {
        let region  = MKCoordinateRegionMakeWithDistance(self.centerCoordinate, 1000, 400)
        let regionThatFits = self.regionThatFits(region)
        self.setRegion(regionThatFits, animated: true)
    }
}
