//
//  twHashtagsHeader.swift
//  21
//
//  Created by Ilyes HERMELLIN on 12/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import Foundation

protocol twHashtagsHeaderDelegate: AnyObject {
    func hashtagTouchedUpInside(hashtag: String)
}

extension twHashtagsHeader {
    struct k {
        static let leftMargin: CGFloat = 10.0
        static let topMargin: CGFloat = 6.0
    }
}

class twHashtagsHeader: UIView {

    var hashtags = ["#lolilol", "#Fouuuu", "#LOULZ", "#mehh", "#bgefjfhjy", "#lolilol", "#Fouuuu", "#LOULZ", "#mehh", "#bgey"]
    var hashtagViews: [UIView] = [UIView]()
    
    var mask: UIView = UIView()
    var gradientLayer: CAGradientLayer!
    
    var delegate: twHashtagsHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50.0))
        
        backgroundColor = UIColor.clearColor()
        
        mask.backgroundColor = UIColor.whiteColor()
        addSubview(mask)
        
        for hashtag in hashtags {
            let subview = UIButton(type: UIButtonType.System)
            subview.setTitle(hashtag, forState: .Normal)
            subview.titleLabel!.font = UIFont.systemFontOfSize(13.0)
            subview.setTitleColor(UIColor(red: 78/255, green: 121/255, blue: 181/255, alpha: 1.0), forState: .Normal)
            subview.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
            subview.contentEdgeInsets = UIEdgeInsets(top: -1, left: 0, bottom: -1, right: 0)
            subview.translatesAutoresizingMaskIntoConstraints = false
            subview.addTarget(self, action: Selector("hashtagTouchedUpInside:"), forControlEvents: UIControlEvents.TouchUpInside)
            hashtagViews.append(subview)
            addSubview(subview)
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: CGRect.zero)
    }
    
    func hashtagTouchedUpInside(sender: UIButton) {
        print(delegate)
        delegate?.hashtagTouchedUpInside(sender.titleLabel!.text!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mask.frame = bounds
//        removeConstraints(hConstraints)
//        hConstraints.removeAll(keepCapacity: false)
        var currentLeft: CGFloat = twHashtagsHeader.k.leftMargin
        var currentTop: CGFloat = twHashtagsHeader.k.topMargin
        var size: CGSize
        for subview in hashtagViews {
            size = subview.sizeThatFits(bounds.size)
            if currentLeft + size.width + twHashtagsHeader.k.leftMargin > bounds.size.width {
                currentLeft = twHashtagsHeader.k.leftMargin
                currentTop += size.height + twHashtagsHeader.k.topMargin
            }
            addConstraint(NSLayoutConstraint(item: subview, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: currentLeft))
            addConstraint(NSLayoutConstraint(item: subview, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: currentTop))
            currentLeft += size.width + twHashtagsHeader.k.leftMargin
        }
        
    }
}
