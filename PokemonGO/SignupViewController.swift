//
//  SignupViewController.swift
//  PokemonGO
//
//  Created by Thomas Ganley on 10/26/17.
//  Copyright © 2017 Thomas Ganley. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Action methods
    @IBAction func signupButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func signupWithFacebookButtonTapped(_ sender: UIButton) {
    }
}
