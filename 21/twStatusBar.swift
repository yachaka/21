//
//  twStatusBar.swift
//  21
//
//  Created by Ilyes HERMELLIN on 07/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class twStatusBar: UIView {

    var grLayer: twGradientLayer!
    
    func cInit() {
        translatesAutoresizingMaskIntoConstraints = false
        grLayer = twGradientLayer()
        alpha = 0.9
        addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 20.0))
        
        layer.insertSublayer(grLayer, below: layer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cInit()
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        grLayer.frame = frame
    }
}