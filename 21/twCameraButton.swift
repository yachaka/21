//
//  twCameraButton.swift
//  21
//
//  Created by Ilyes HERMELLIN on 11/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class twCameraButton: UIControl {
    
    init(size: CGSize) {
        super.init(frame: CGRect.zero)
        
        opaque = false
        
        translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: size.width))
        addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: size.width))
        
//        animate()
    }
    
    override convenience init(frame: CGRect) {
        self.init(size: CGSizeMake(frame.width, frame.height))
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: CGRect.zero)
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        super.beginTrackingWithTouch(touch, withEvent: event)
        highlighted = true
        setNeedsDisplay()
        
        return true
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        super.endTrackingWithTouch(touch, withEvent: event)
        highlighted = false
        setNeedsDisplay()
    }
    
    
    func animate() {
        UIView.animateWithDuration(0.1, animations: {
            self.transform = CGAffineTransformRotate(self.transform, CGFloat(M_PI / 2))
            return
        }, completion: {
            (finished: Bool) in
            self.animate()
            return
        });
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
//        let context = UIGraphicsGetCurrentContext()
//        
//        CGContextClearRect(context, bounds)
//        
//        CGContextSetLineWidth(context, 2.0)
//        UIColor(red: 240, green: 237, blue: 223, alpha: 1.0).setStroke()
//        UIColor(red: 240, green: 239, blue: 237, alpha: 0.8).setFill()
//        CGContextStrokeEllipseInRect(context, CGRectInset(bounds, 2.0, 2.0))
//        
//        CGContextFillEllipseInRect(context, CGRectInset(bounds, 4.0, 4.0))
        // Create a gradient from white to red
//        var colors: [CGFloat] = [1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 1.0]
        print(highlighted)
        let colors = [UIColor.twPurple(0.9).CGColor, UIColor.twOrange(0.9).CGColor]
        
        let baseSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
//        var gradient = CGGradientCreateWithColorComponents(baseSpace, colors, nil, 2)
        let gradient = CGGradientCreateWithColors(baseSpace, colors, [0.0, 1.0])
        
        let context = UIGraphicsGetCurrentContext();
        
        CGContextSaveGState(context);
        CGContextSetLineWidth(context, 2.0)
        CGContextAddEllipseInRect(context, CGRectInset(rect, 2.0, 2.0));
        CGContextReplacePathWithStrokedPath(context)
        CGContextClip(context);
        
        let startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
        let endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions.init(rawValue: 0))
        
        CGContextRestoreGState(context);
        if (self.highlighted) {
            UIColor(red: 230/255, green: 231/255, blue: 231/255, alpha: 0.8).setFill()
        } else {
            UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 0.8).setFill()
        }
        CGContextFillEllipseInRect(context, CGRectInset(bounds, 3.0, 3.0))
    }

}
