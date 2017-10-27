//
//  MapViewController.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/26/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
    }
    
    // MARK: - Helper methods
    func setupMap() {
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // Update the map view's rectangle to display a radius around the current location
        mapView.centerCoordinate = userLocation.coordinate
        mapView.setDefaultRegion()
    }
}
