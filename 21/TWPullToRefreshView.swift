//
//  TWAnimator.swift
//  21
//
//  Created by Ilyes HERMELLIN on 15/10/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import Foundation

class TWPullToRefreshView: UIView, PullToRefreshViewDelegate {
    
    var progress: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(progress)
        
        let v = ["progress": progress]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[progress]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[progress]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pullToRefreshAnimationDidStart(view: PullToRefreshView) {
    }
    
    func pullToRefreshAnimationDidEnd(view: PullToRefreshView) {
    }
    
    func pullToRefresh(view: PullToRefreshView, progressDidChange progress: CGFloat) {
        let pr = UnsafeMutablePointer<CGFloat>.alloc(1)
        let pg = UnsafeMutablePointer<CGFloat>.alloc(1)
        let pb = UnsafeMutablePointer<CGFloat>.alloc(1)
        let pa = UnsafeMutablePointer<CGFloat>.alloc(1)
        let or = UnsafeMutablePointer<CGFloat>.alloc(1)
        let og = UnsafeMutablePointer<CGFloat>.alloc(1)
        let ob = UnsafeMutablePointer<CGFloat>.alloc(1)
        let oa = UnsafeMutablePointer<CGFloat>.alloc(1)
        
        UIColor.twPurple().getRed(pr, green: pg, blue: pb, alpha: pa)
        UIColor.twOrange().getRed(or, green: og, blue: ob, alpha: oa)
        
        
        let progress = progress > 0.7 ? 0.7 : progress
        let red = or.memory * progress + pr.memory * (1 - progress)
        let green = og.memory * progress + pg.memory * (1 - progress)
        let blue = ob.memory * progress + pb.memory * (1 - progress)
        backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        self.progress.text = progress.description
    }
    
    func pullToRefresh(view: PullToRefreshView, stateDidChange state: PullToRefreshViewState) {
    }
    
    override func layoutSubviews() {
        if let superview = superview {
            let v = ["self": self]
            superview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[self]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
            superview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[self]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        }
    }
}