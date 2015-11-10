//
//  twView.swift
//  21
//
//  Created by Ilyes HERMELLIN on 09/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

@IBDesignable class twView: UIView {
    
    var statusBar: twStatusBar = twStatusBar()
    
    func cInit() {
        backgroundColor = UIColor.whiteColor()
        
        addSubview(statusBar)
        
        addConstraint(NSLayoutConstraint(item: statusBar, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: statusBar, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: statusBar, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: 0.0))
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
