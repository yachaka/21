//
//  HashtagFeedView.swift
//  21
//
//  Created by Ilyes HERMELLIN on 19/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class HashtagFeedView: twView {

    weak var header: HashtagFeedHeaderView!
    
    override func cInit() {
        super.cInit()
        
        header = (NSBundle.mainBundle().loadNibNamed("HashtagFeedHeader", owner: self, options: nil)).first as! HashtagFeedHeaderView
        addSubview(header)
        
        let v = ["sb": statusBar, "header": header]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[header]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[sb][header]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
    }

}
