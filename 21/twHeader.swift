//
//  twTopBar.swift
//  21
//
//  Created by Ilyes HERMELLIN on 07/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

extension twHeader {
    struct k {
        static let gradientBarHeight = 2
        static let height = 47
    }
}


class twHeader: FXBlurView {
    
    var logo: UIImageView!
    var gradientBar: twGradientLayer!
    var addButton: UIButton!
    
    func cInit() {
        let logoImg = UIImage(named: "LogoTransparent42x42")!
        
        logo = UIImageView(image: logoImg)
        logo.frame = CGRectMake(5, 0, logoImg.size.width, logoImg.size.height)
        
        gradientBar = twGradientLayer()
        
        addButton = UIButton(type: UIButtonType.System)
        addButton.setTitle("Add", forState: .Normal)
        addButton.sizeToFit()
        addButton.frame = CGRectMake(200, addButton.frame.origin.y, addButton.frame.width, addButton.frame.height)
        
        tintColor = UIColor.clearColor()
        blurRadius = 15

        addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: CGFloat(twHeader.k.height)))
        
        
        addSubview(addButton)
        addSubview(logo)
        layer.addSublayer(gradientBar)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        cInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cInit()
    }

    
    /*
    *   MARK: - Resize business
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBar.frame = CGRectMake(0, frame.size.height - CGFloat(twHeader.k.gradientBarHeight), frame.size.width, CGFloat(twHeader.k.gradientBarHeight))
    }
}