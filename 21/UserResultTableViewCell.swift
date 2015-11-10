//
//  UserResultTableViewCell.swift
//  21
//
//  Created by Ilyes HERMELLIN on 10/11/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class UserResultTableViewCell: UITableViewCell {

    var photo: UIImageView!
    var username: UILabel!
    var subscribersCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photo = viewWithTag(99) as! UIImageView
        username = viewWithTag(100) as! UILabel
        subscribersCount = viewWithTag(101) as! UILabel
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
