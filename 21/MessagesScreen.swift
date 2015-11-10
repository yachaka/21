//
//  MessagesScreen.swift
//  21
//
//  Created by Ilyes HERMELLIN on 28/10/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class MessagesScreen: twView {

    var messagesTableView: UITableView = {
        var t = UITableView(frame: CGRect.zero, style: UITableViewStyle.Plain)
        
        t.translatesAutoresizingMaskIntoConstraints = false
        t.registerNib(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageCell")
        t.rowHeight = 64
        
        return t
    }()
    
    override func cInit() {
        super.cInit()
        
        addSubview(messagesTableView)
        
        let v = ["m": messagesTableView, "s": statusBar]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[s][m]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[m]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
    }

}
