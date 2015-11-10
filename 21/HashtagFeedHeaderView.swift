//
//  HashtagFeedHeaderView.swift
//  21
//
//  Created by Ilyes HERMELLIN on 19/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class HashtagFeedHeaderView: UIView {
    
    weak var backButton: UIButton!
    
    weak var hashtag: UILabel!
    weak var subscribersCount: UILabel!

    override func awakeFromNib() {
        backButton = viewWithTag(99) as! UIButton
        hashtag = viewWithTag(100) as! UILabel
        subscribersCount = viewWithTag(101) as! UILabel
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: frame.height))
    }

}
