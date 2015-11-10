//
//  MessageCell.swift
//  21
//
//  Created by Ilyes HERMELLIN on 28/10/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    var photo: UIImageView!
    var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photo = viewWithTag(100) as! UIImageView
        username = viewWithTag(101) as! UILabel
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
