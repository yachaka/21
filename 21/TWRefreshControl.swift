//
//  TWRefreshControl.swift
//  21
//
//  Created by Ilyes HERMELLIN on 03/10/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class TWRefreshControl: UIView {

    var heightConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightConstraint = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 0.0)
        addConstraint(heightConstraint)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScrollTooHigh(offset: CGPoint) {
        heightConstraint.constant = offset.y * -1
    }

}
