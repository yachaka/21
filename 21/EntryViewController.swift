//
//  BaseViewController.swift
//  21
//
//  Created by Ilyes HERMELLIN on 30/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let accCtrl = UINavigationController(rootViewController: MessagesViewController())
        let feedCtrl = UINavigationController(rootViewController: HomeViewController())
        let hashsCtrl = AccountViewController()
        
        self.addChildViewController(hashsCtrl)
        self.scrollView!.addSubview(hashsCtrl.view)
        hashsCtrl.didMoveToParentViewController(self)
        
        self.addChildViewController(feedCtrl)
        self.scrollView!.addSubview(feedCtrl.view)
        feedCtrl.didMoveToParentViewController(self)
        
        self.addChildViewController(accCtrl)
        self.scrollView!.addSubview(accCtrl.view)
        accCtrl.didMoveToParentViewController(self)
        
        accCtrl.view.frame = CGRectMake(0, 0, view.frame.width + 280, view.frame.height + 32)
        accCtrl.setNavigationBarHidden(true, animated: false)
//        feedCtrl.view.autoresizesSubviews = false
        feedCtrl.view.frame = CGRectMake(view.frame.width, 0, view.frame.width + 280, view.frame.height + 32)
        feedCtrl.setNavigationBarHidden(true, animated: false)
        feedCtrl.view.setNeedsLayout()
        hashsCtrl.view.frame = CGRectMake(view.frame.width * 2, 0, view.frame.width, view.frame.height)
        
        scrollView.contentSize = CGSizeMake(view.frame.width * 3, view.frame.height)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        
        scrollView.contentOffset = CGPointMake(view.frame.width, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
