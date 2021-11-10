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

class UserProfileVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    let user = PFUser.current()!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userProfileImage.layer.masksToBounds = true
        userProfileImage.layer.cornerRadius = userProfileImage.bounds.width / 2
        
        usernameLabel.text = user.username
        
        let userProfileImageFile = user["profileImage"] as! PFFileObject
        let profileImgURLString = userProfileImageFile.url!
        let userProfileImageURL = URL(string: profileImgURLString)!
        
        userProfileImage.af.setImage(withURL: userProfileImageURL)
    }
    

    @IBAction func changeProfilePic(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }

        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 500, height: 500)
        let scaledImage = image.af.imageAspectScaled(toFill: size)

        userProfileImage.image = scaledImage

        let profilePicData = userProfileImage.image!.pngData()
        let profilePicFile = PFFileObject(name: "profile_pic.png", data: profilePicData!)

        user["profileImage"] = profilePicFile

        user.saveInBackground { (success, error) in
            if success {
                print("saved!")
            } else {
                print("error!")
            }
        }

        dismiss(animated: true, completion: nil)
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
