//
//  TrailListVC.swift
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


class TrailListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var trailTableView: UITableView!
    
    var parkList = [Park]()
    var selectedStateCode: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trailTableView.rowHeight = 200
        trailTableView.delegate = self
        trailTableView.dataSource = self
        
    }
    
    override func loadView() {
        super.loadView()
        let parksData = ParksAPICall(stateCode: selectedStateCode)
        parksData.getParks() { jsonAPIResponse in
            self.parkList = jsonAPIResponse.data
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.trailTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = trailTableView.dequeueReusableCell(withIdentifier: "TrailCell") as! TrailCell
        
        let park = self.parkList[indexPath.row]

        cell.trailName.text = park.name
        cell.trailDescription.text = park.description

        let firstParkImage = park.images[0]
        let parkImageString = firstParkImage.url
        let parkImageURL = URL(string: parkImageString)!
        cell.trailImage.af.setImage(withURL: parkImageURL)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = trailTableView.indexPath(for: cell)!
        let park = parkList[indexPath.row]
        
        let detailsViewController = segue.destination as! TrailDetailViewVC
        detailsViewController.park = park
        
        trailTableView.deselectRow(at: indexPath, animated: true)
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
