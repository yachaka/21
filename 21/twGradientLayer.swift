//
//  twTopBar.swift
//  21
//
//  Created by Ilyes HERMELLIN on 07/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit
import QuartzCore

class twGradientLayer: CAGradientLayer {
    
    override var frame: CGRect {
        didSet {
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 1.0, y: 0.0)
            print(startPoint)
        }
    }
    
    override init() {
        super.init()
        colors = [UIColor.twPurple().CGColor, UIColor.twOrange().CGColor]
        locations = [0.0, 1.0]
    }
    
    convenience init(frame: CGRect) {
        self.init()
        self.frame = frame
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}