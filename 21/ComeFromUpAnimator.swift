//
//  FadeAnimator.swift
//  21
//
//  Created by Ilyes HERMELLIN on 19/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class ComeFromUpAnimator: NSObject, UIViewControllerAnimatedTransitioning {
   
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let to = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        transitionContext.containerView()?.addSubview(to.view)
        to.view.transform = CGAffineTransformTranslate(to.view.transform, 0, -to.view.bounds.height)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            to.view.transform = CGAffineTransformIdentity
        }, completion: {
            _ in
            transitionContext.completeTransition(transitionContext.transitionWasCancelled() == false)
        })
    }
}
