//
//  SubscribeButton.swift
//  21
//
//  Created by Ilyes HERMELLIN on 19/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class SubscribeButton: UIButton {
    
    func cInit() {
        translatesAutoresizingMaskIntoConstraints = false
                
        titleLabel!.font = UIFont.systemFontOfSize(12.0)
        titleEdgeInsets = UIEdgeInsets(top: 4, left: 6, bottom: 4, right: 6)
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1.0).CGColor
        layer.cornerRadius = 2
        layer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        
        addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 20.0))
        addConstraint(NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100.0))
        
        setTitle("S'abonner", forState: .Normal)
        setTitleColor(UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0), forState: .Normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cInit()
    }

}
