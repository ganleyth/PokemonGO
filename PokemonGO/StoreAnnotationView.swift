//
//  StoreAnnotationView.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/27/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import Foundation
import MapKit

class StoreAnnotationView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.image = UIImage(named: "StorePlacemark")
        self.frame = CGRect(x: 0, y: 0, width: 27.6, height: 36)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This initializer cannot be used for a store annotation view")
    }
}
