//
//  File.swift
//  21
//
//  Created by Ilyes HERMELLIN on 08/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class twViewMaker {
    
    static func makeFullViewWithViews(views: [UIView]) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if views.count == 0 {
            return view
        }
        
        
        for subview in views {
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
        }
        
        view.addConstraint(NSLayoutConstraint(item: views.first!, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0.0))
        
        for var index = 0; index < views.count; index++ {
            view.addConstraint(NSLayoutConstraint(item: views[index], attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 0.0))
            view.addConstraint(NSLayoutConstraint(item: views[index], attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: 0.0))
            
            if index > 0 {
                view.addConstraint(NSLayoutConstraint(item: views[index], attribute: .Top, relatedBy: .Equal, toItem: views[index - 1], attribute: .Bottom, multiplier: 1.0, constant: 0.0))
            }
        }
        view.addConstraint(NSLayoutConstraint(item: views.last!, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        
        return view
    }
    
}
