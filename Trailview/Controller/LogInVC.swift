//
//  LogInVC.swift
//  ParkView
//
//  Created by ParkViewers on 10/26/2021
//  Copyright © ParkViewers. All rights reserved.
//
//  ParkViewers: Anh Vu, Elizabeth Thorne, Mark Jordan, Reid William Strange
//  Date Modified: 11/23/2021
//

import UIKit
import Parse


class LogInVC: UIViewController, UITextFieldDelegate {

    // MARK: - Properties/Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var noAccountYetLabel: UILabel!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // configure forgot password button
        configureButton(buttonName: forgotPasswordButton, top: 1, leading: 1, bottom: 1, trailing: 1)
        
        // configure google auth button
        configureButton(buttonName: googleButton, top: 1, leading: 1, bottom: 1, trailing: 1)
    }
    
    
    // MARK: - Navigation

    @IBAction func logInButton(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) -> Void in
            if user != nil {
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            } else {
                print(error!.localizedDescription)
            }
        }
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }

    
    // MARK: - Helper Methods
    
    func configureButton(buttonName: UIButton!, top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        // configure content insets with respect to button boundary
        buttonName.configuration?.contentInsets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    // MARK: - Delegate Methods
    
    // TODO: Add delegate methods to modify text behavior in the textfields
    
}
