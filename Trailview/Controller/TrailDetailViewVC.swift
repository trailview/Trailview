//
//  TrailDetailViewVC.swift
//  Trailview
//
//  Created by TrailViewers on 10/26/2021
//  Copyright © TrailViewers. All rights reserved.
//
//  TrailViewers: Anh Vu, Elizabeth Thorne, Mark Jordan, Reid William Strange
//  Date Modified: 10/26/2021
//

import UIKit

class TrailDetailViewVC: UIViewController {

    @IBOutlet weak var ParkDetailImage: UIImageView!
    @IBOutlet weak var ParkDetailName: UILabel!
    @IBOutlet weak var ParkDetailLocation: UILabel!
    @IBOutlet weak var ParkDetailDescription: UILabel!
    @IBOutlet weak var ParkDetailWeather: UILabel!
    
    var park: Park!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let firstParkImage = park.images[0]
        let parkImageString = firstParkImage.url
        let parkImageURL = URL(string: parkImageString)!
        ParkDetailImage.af.setImage(withURL: parkImageURL)
        
        ParkDetailName.text = park.fullName
        ParkDetailDescription.text = park.description
        ParkDetailWeather.text = park.weatherInfo
        
        let parkCity = park.addresses[0].city
        var parkState = park.addresses[0].stateCode
        parkState = parkState.uppercased()
        let parkLocation = parkCity + ", " + parkState
        
        ParkDetailLocation.text = parkLocation

        
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
