//
//  TrailCell.swift
//  Trailview
//
//  Created by Reid Strange on 11/8/21.
//

import UIKit

class TrailCell: UITableViewCell {

    @IBOutlet weak var trailImage: UIImageView!
    @IBOutlet weak var trailName: UILabel!
    @IBOutlet weak var trailDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
