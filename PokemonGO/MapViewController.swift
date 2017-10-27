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
        mapView.showsUserLocation = true
    }
}
