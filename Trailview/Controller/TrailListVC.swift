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
    
    var trails = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trailTableView.rowHeight = 200
        trailTableView.delegate = self
        trailTableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Trails")
        query.limit = 20
        
        query.findObjectsInBackground { trails, error in
            if trails != nil {
                self.trails = trails!
                self.trailTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trailTableView.dequeueReusableCell(withIdentifier: "TrailCell") as! TrailCell
        
        let trail = trails[indexPath.row]
        
        cell.trailName.text = (trail["trailName"] as! String)
        cell.trailDescription.text = (trail["trailDescription"] as! String)
        
        let trailImageFile = trail["trailImage"] as! PFFileObject
        let urlString = trailImageFile.url!
        let trailImageURL = URL(string: urlString)!
        
        cell.trailImage.af.setImage(withURL: trailImageURL)
        
        return cell
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
