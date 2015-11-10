//
//  SearchOverlay.swift
//  21
//
//  Created by Ilyes HERMELLIN on 10/11/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class SearchOverlay: UIView {

    var searchTableView: SearchTableView = {
        var t = SearchTableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        
        return t
    }()
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func cInit() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.whiteColor()
        
        addSubview(searchTableView)
        
        let v = ["table": searchTableView]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[table]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[table]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        cInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cInit()
    }
}
