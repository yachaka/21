//
//  SearchTableView.swift
//  21
//
//  Created by Ilyes HERMELLIN on 10/11/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class SearchTableView: UITableView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func cInit() {
        registerNib(UINib(nibName: "HashtagResultTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "HashtagCell")
        registerNib(UINib(nibName: "UserResultTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "UserCell")
        rowHeight = UITableViewAutomaticDimension
        estimatedRowHeight = 60.0
    }
    
    init() {
        super.init(frame: CGRect.zero, style: UITableViewStyle.Plain)
        cInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cInit()
    }

}
