//
//  UserProfileVC.swift
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
import AlamofireImage

class UserProfileVC: UIViewController {
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    let user = PFUser.current()!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = user.username
        
        let userProfileImageFile = user["profileImage"] as! PFFileObject
        let profileImgURLString = userProfileImageFile.url!
        let userProfileImageURL = URL(string: profileImgURLString)!
        
        userProfileImage.af.setImage(withURL: userProfileImageURL)

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
