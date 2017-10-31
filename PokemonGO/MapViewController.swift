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
    var currentRegion: MKCoordinateRegion?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(displayPokemon), name: Constants.Notifications.nearbyPokemonUpdatedNotication, object: nil)
        
        setupMap()
    }
    
    // MARK: - Helper methods
    func setupMap() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.showsPointsOfInterest = false
        mapView.register(StoreAnnotationView.self, forAnnotationViewWithReuseIdentifier: Constants.ReuseIdentifiers.storeAnnotationViewIdentifier)
        mapView.register(PokemonAnnotationView.self, forAnnotationViewWithReuseIdentifier: Constants.ReuseIdentifiers.pokemonAnnotationViewIdentifier)
    }
    
    func fetchLocalStores(inRegion region: MKCoordinateRegion) {
        LocationController.shared.fetchPointsOfInterest(inRegion: region) { (response, error) in
            if let error = error { NSLog("Error fetching local points of interest: \(error.localizedDescription)"); return }
            guard let response = response else { NSLog("Local search response is nil"); return }
            
            let responseMapItems = response.mapItems
            responseMapItems.forEach { (mapItem) in
                let name = mapItem.placemark.name
                let coordinate = mapItem.placemark.coordinate
                let annotation = PokemonGOAnnotation(title: name, coordinate: coordinate, type: PokemonGOAnnotation.AnnotationType.store)
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
    @objc func displayPokemon() {
        guard let currentRegion = currentRegion else { return }
        for var pokemon in PokemonController.shared.nearbyPokemon {
            if pokemon.coordinate == nil {
                PokemonController.shared.setLocation(for: &pokemon, inRange: currentRegion)
            }
            
            guard let coordinate = pokemon.coordinate else { continue }
            let name = pokemon.name
            let annotation = PokemonGOAnnotation(title: name, coordinate: coordinate, type: PokemonGOAnnotation.AnnotationType.pokemon)
            mapView.addAnnotation(annotation)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // Update the map view's rectangle to display a radius around the current location
        mapView.centerCoordinate = userLocation.coordinate
        let defaultRegion = mapView.setDefaultRegion()
        currentRegion = defaultRegion
        fetchLocalStores(inRegion: defaultRegion)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let pokemonGOAnnotation = annotation as? PokemonGOAnnotation else { return nil }
        switch pokemonGOAnnotation.type {
        case .store:
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.ReuseIdentifiers.storeAnnotationViewIdentifier, for: annotation)
            annotationView.canShowCallout = true
            return annotationView
        case .pokemon:
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.ReuseIdentifiers.pokemonAnnotationViewIdentifier, for: annotation)
            return annotationView
        }
    }
}
