//
//  CommentsSectionTableView.swift
//  21
//
//  Created by Ilyes HERMELLIN on 09/11/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class CommentsSectionTableView: UITableView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func cInit() {
        registerNib(UINib(nibName: "CommentTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "CommentCell")
        separatorStyle = UITableViewCellSeparatorStyle.None
        rowHeight = UITableViewAutomaticDimension
        estimatedRowHeight = CGFloat(60.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cInit()
    }
}
