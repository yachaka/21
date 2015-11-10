//
//  ViewController.swift
//  21
//
//  Created by Ilyes HERMELLIN on 07/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit
import QuartzCore

class HomeViewController: twController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UISearchBarDelegate  {
    
    struct k {
        static let TamponOffsetY: CGFloat = 150.0
    }
    
    var posts: JSON?
    var vview: twHomeView! {
        return self.view as! twHomeView
    }
    
    lazy var searchViewController: SearchViewController = {
        let view = self.view as! twHomeView
        var ctrl = SearchViewController()
        
        self.addChildViewController(ctrl)
        ctrl.didMoveToParentViewController(ctrl)
        
        view.addSubview(ctrl.view)
        
        let v = ["s": view.search, "over": ctrl.view]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[s][over]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[over]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        return ctrl
    }()
    var searchTask: NSURLSessionDataTask?
    
    var lastFeedOffsetY: CGFloat?
    var startedDraggingAt: CGFloat!
    var isFeedDragging: Bool = false
    
    // MARK: - Initialization
    override func loadView() {
        view = twHomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = self.view as! twHomeView
        
        navigationController?.delegate = self
        
        view.search.delegate = self
        
        view.feed.dataSource = self
        view.feed.delegate = self
        view.cameraButton.addTarget(self, action: Selector("cameraButtonPressed"), forControlEvents: .TouchUpInside)
        
        reloadPostFeed()
    }
    
//    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return ComeFromUpAnimator()
//    }
    

    // MARK: Feed Data
    func reloadPostFeed() {
        print("reloading")
        twAPI.index {
            data, error in
            
            dispatch_async(dispatch_get_main_queue()) {
                if let _ = data?["error"].string {
                    
                } else {
                    self.posts = data
                }
                (self.view as! twHomeView).feed.reloadData()
            }
            
            if error != nil {
                print(error)
                
            }
        }
    }
    
    func hashtagTouchedUpInside(hashtag: String) {
        let hc = HashtagFeedController()
        (hc.view as! HashtagFeedView).header.hashtag.text = hashtag
        navigationController!.pushViewController(hc, animated: true)
    }
    
    func usernameClicked() {
        Invoker.invokeUserProfile(navigationController!, forUserId: 10)
    }
    
    func cameraButtonPressed() {
        let imagePicker = twImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        twAPI.add(image)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (posts != nil) ? posts!.count : 0
     }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("twPostCell") as! twPostCell
        
        if let posts = posts {
            cell.postText.text = "Texte du post"
            cell.userName.setTitle("username", forState: .Normal)
            cell.userName.removeTarget(nil, action: nil, forControlEvents: UIControlEvents.AllEvents)
            cell.userName.addTarget(self, action: Selector("usernameClicked"), forControlEvents: .TouchUpInside)
            cell.postImageView.loadImageWithURL(NSURL(string: twAPI.host.stringByAppendingPathComponent(posts[indexPath.row]["media_url"].string!))!)
        }
        
        return cell
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        isFeedDragging = true
        startedDraggingAt = scrollView.contentOffset.y
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isFeedDragging = false
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 || scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height {
            return
        }

        var direction: ScrollDirection!
        var delta: CGFloat!
        
        if lastFeedOffsetY == nil {
            lastFeedOffsetY = scrollView.contentOffset.y
            return
        }
        
        delta = scrollView.contentOffset.y - lastFeedOffsetY!
        if delta > 0 {
            direction = ScrollDirection.Down
        } else if delta == 0 {
            direction = ScrollDirection.None
        } else {
            direction = ScrollDirection.Up
        }
        if direction == ScrollDirection.Up {
            if startedDraggingAt - scrollView.contentOffset.y > HomeViewController.k.TamponOffsetY || (vview.searchBarTopConstraint.constant < 0 && vview.searchBarTopConstraint.constant > -(vview.search.bounds.size.height)) {
                if vview.searchBarTopConstraint.constant < 0 {
                    if vview.searchBarTopConstraint.constant - delta > 0 {
                        vview.searchBarTopConstraint.constant = 0
                    } else {
                        vview.searchBarTopConstraint.constant -= delta
                    }
                    scrollView.contentOffset.y -= delta
                }
            }
        }
        
        if direction == ScrollDirection.Down {           
            if vview.searchBarTopConstraint.constant > -(vview.search.bounds.size.height) {
                if vview.searchBarTopConstraint.constant - delta < -(vview.search.bounds.size.height) {
                    vview.searchBarTopConstraint.constant = -(vview.search.bounds.size.height)
                } else {
                    vview.searchBarTopConstraint.constant -= delta
                }
                scrollView.contentOffset.y -= delta
            }
        }
        lastFeedOffsetY = scrollView.contentOffset.y
    }
    
    // MARK: - UISearchBar Delegate
    
    func showSearchOverlay() {
        self.searchViewController.view.alpha = 0
        self.searchViewController.view.transform = CGAffineTransformMakeScale(0.85, 0.85)
        UIView.animateKeyframesWithDuration(0.1, delay: 0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: {
            self.searchViewController.view.alpha = 1
            self.searchViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: nil)
    }
    
    func hideOverlay() {
        UIView.animateWithDuration(0.3, animations: {
            self.searchViewController.view.alpha = 0
        })
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        showSearchOverlay()
        searchBar.setShowsCancelButton(true, animated: true)
        
        return true
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        searchTask?.cancel()
        searchTask = twAPI.search(searchText, completion: {
            json, error in
            
            dispatch_async(dispatch_get_main_queue(), {
                (self.childViewControllers[0] as! SearchViewController).reloadResults(json)
            })
        })
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        hideOverlay()
        searchBar.setShowsCancelButton(false, animated: true)
        
        searchBar.resignFirstResponder()
        searchBar.text = ""
        
    }
}









