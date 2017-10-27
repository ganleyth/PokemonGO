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
        mapView.showsPointsOfInterest = false
    }
    
    func fetchLocalStores(inRegion region: MKCoordinateRegion) {
        LocationController.shared.fetchPointsOfInterest(inRegion: region) { (response, error) in
            if let error = error { NSLog("Error fetching local points of interest: \(error.localizedDescription)"); return }
            guard let response = response else { NSLog("Local search response is nil"); return }
            
            let responseMapItems = response.mapItems
            responseMapItems.forEach { (mapItem) in
                let annotation = MKPointAnnotation()
                annotation.coordinate = mapItem.placemark.coordinate
                if let title = mapItem.placemark.title { annotation.title = title }
                if let name = mapItem.name { print(name) }
                self.mapView.addAnnotation(annotation)
            }
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // Update the map view's rectangle to display a radius around the current location
        mapView.centerCoordinate = userLocation.coordinate
        let defaultRegion = mapView.setDefaultRegion()
        fetchLocalStores(inRegion: defaultRegion)
    }
}
