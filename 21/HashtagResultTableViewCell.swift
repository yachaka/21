//
//  HashtagResultTableViewCell.swift
//  21
//
//  Created by Ilyes HERMELLIN on 10/11/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class HashtagResultTableViewCell: UITableViewCell {

    var hashtag: UILabel!
    var subscribersCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        hashtag = viewWithTag(99) as! UILabel
        subscribersCount = viewWithTag(100) as! UILabel
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
