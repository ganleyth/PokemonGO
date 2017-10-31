//
//  ARWorldViewController.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/26/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import UIKit
import ARKit

class ARWorldViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func enterMapButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
