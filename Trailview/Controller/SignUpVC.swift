//
//  LogInVC.swift
//  ParkView
//
//  Created by ParkViewers on 11/23/2021
//  Copyright © ParkViewers. All rights reserved.
//
//  ParkViewers: Anh Vu, Elizabeth Thorne, Mark Jordan, Reid William Strange
//  Date Modified: 11/23/2021
//

import UIKit
import Parse

class SignUpVC: UIViewController, UITextFieldDelegate {

    // MARK: - Properties/Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // initialize delegate methods
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    // MARK: - Navigation
    
    @IBAction func createAccountButton(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text!
        user.password = passwordTextField.text!
        
        user.signUpInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    @IBAction func returnToLogIn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Delegate Methods
    
    // TODO: Add delegate methods to modify text behavior in the textfields
    
}
