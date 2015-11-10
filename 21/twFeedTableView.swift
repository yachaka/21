//
//  twFeed.swift
//  21
//
//  Created by Ilyes HERMELLIN on 08/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

protocol twFeedDelegate {
}

class twFeedTableView: UITableView, UITableViewDelegate {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        translatesAutoresizingMaskIntoConstraints = false
        //registerClass(twPostCell.self, forCellReuseIdentifier: "twPostCell")
        registerNib(UINib(nibName: "twPostView", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "twPostCell")
        allowsSelection = false
        separatorStyle = .None
        rowHeight = UITableViewAutomaticDimension
        estimatedRowHeight = CGFloat(390)
        delegate = self
        addPullToRefreshWithAction({
            NSOperationQueue().addOperationWithBlock {
                sleep(2)
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    self.stopPullToRefresh()
                }
            }
        }, withAnimator: TWPullToRefreshView(frame: CGRectMake(0, -80, 320, 80)))
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
