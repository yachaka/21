//
//  twHome.swift
//  21
//
//  Created by Ilyes HERMELLIN on 11/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

@IBDesignable class twHomeView: twView {
    
    var search: UISearchBar = UISearchBar()
    var searchBarTopConstraint: NSLayoutConstraint!
    var feed: twFeedTableView = twFeedTableView()
    var cameraButton: twCameraButton = twCameraButton(size: CGSizeMake(60, 60))
    
    override func cInit() {
        super.cInit()
        
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Search for #interest and people"
        search.showsCancelButton = false
        
        addSubview(feed)
        insertSubview(search, belowSubview: statusBar)
        addSubview(cameraButton)
        
        addConstraint(NSLayoutConstraint(item: cameraButton, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: cameraButton, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: -10.0))
        
        let v = ["statusBar": statusBar, "feed": feed, "s": search];
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[feed]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[s]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[statusBar]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[s][feed]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        searchBarTopConstraint = NSLayoutConstraint(item: search, attribute: .Top, relatedBy: .Equal, toItem: statusBar, attribute: .Bottom, multiplier: 1, constant: 0)
        addConstraint(searchBarTopConstraint)
    }
}