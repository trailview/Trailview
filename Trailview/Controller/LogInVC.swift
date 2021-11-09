//
//  LogInVC.swift
//  Trailview
//
//  Created by TrailViewers on 10/26/2021
//  Copyright © TrailViewers. All rights reserved.
//
//  TrailViewers: Anh Vu, Elizabeth Thorne, Mark Jordan, Reid William Strange
//  Date Modified: 10/26/2021
//

import UIKit
import Parse


class LogInVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logInButton(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) -> Void in
            if user != nil {
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
