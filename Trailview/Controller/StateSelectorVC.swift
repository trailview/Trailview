//
//  StateSelectorVCViewController.swift
//  Trailview
//
//  Created by Reid Strange on 11/22/21.
//

import UIKit
import Parse

class StateSelectorVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var stateSelector: UIPickerView!
    
    var stateList: [String] = [String]()
    var selectedState: String = ""
    let user = PFUser.current()!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stateList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stateList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedState = stateList[stateSelector.selectedRow(inComponent: 0)]
        // Save selected row integer in User Defaults
        UserDefaults.standard.set(row, forKey: "pickerViewRow")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stateSelector.delegate = self
        self.stateSelector.dataSource = self
        
        let user = PFUser.current()!
        
        stateList = ["Alabama", "Alaska",  "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
        
        setDefaultValue(item: user["defaultState"] as! String, component: 0)
        selectedState = user["defaultState"] as! String
        
        print(self.selectedState)
        
    }
    
    func setDefaultValue(item: String, component: Int) {
        if let pickerRow = stateList.firstIndex(of: item) {
            stateSelector.selectRow(pickerRow, inComponent: 0, animated: true)
        }
    }
    
    @IBAction func submitStateSelection(_ sender: Any) {
        
    }
    
    
    let stateAbbreviations = [
        "Alabama": "AL",
        "Alaska": "AK",
        "Arizona": "AZ",
        "Arkansas": "AR",
        "California": "CA",
        "Colorado": "CO",
        "Connecticut": "CT",
        "Delaware": "DE",
        "District Of Columbia": "DC",
        "Florida": "FL",
        "Georgia": "GA",
        "Hawaii": "HI",
        "Idaho": "ID",
        "Illinois": "IL",
        "Indiana": "IN",
        "Iowa": "IA",
        "Kansas": "KS",
        "Kentucky": "KY",
        "Louisiana": "LA",
        "Maine": "ME",
        "Maryland": "MD",
        "Massachusetts": "MA",
        "Michigan": "MI",
        "Minnesota": "MN",
        "Mississippi": "MS",
        "Missouri": "MO",
        "Montana": "MT",
        "Nebraska": "NE",
        "Nevada": "NV",
        "New Hampshire": "NH",
        "New Jersey": "NJ",
        "New Mexico": "NM",
        "New York": "NY",
        "North Carolina": "NC",
        "North Dakota": "ND",
        "Ohio": "OH",
        "Oklahoma": "OK",
        "Oregon": "OR",
        "Pennsylvania": "PA",
        "Rhode Island": "RI",
        "South Carolina": "SC",
        "South Dakota": "SD",
        "Tennessee": "TN",
        "Texas": "TX",
        "Utah": "UT",
        "Vermont": "VT",
        "Virginia": "VA",
        "Washington": "WA",
        "West Virginia": "WV",
        "Wisconsin": "WI",
        "Wyoming": "WY"
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        user["defaultState"] = selectedState
        user.saveInBackground { (success, error) in
            if success {
                print("saved!")
            } else {
                print("error!")
            }
        }
        
        let selectedStateFullName = self.selectedState as String
        let selectedStateAbbrevUpper = self.stateAbbreviations[selectedStateFullName]
        let selectedStateAbbrevLower = selectedStateAbbrevUpper!.lowercased()
        
        let trailListViewController = segue.destination as! TrailListVC
        trailListViewController.selectedStateCode = selectedStateAbbrevLower
        
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
