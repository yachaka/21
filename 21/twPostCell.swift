//
//  twPostView.swift
//  21
//
//  Created by Ilyes HERMELLIN on 08/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class twPostCell: UITableViewCell, UITableViewDataSource {
    
    static let cellHeight: CGFloat = 84
    
    var userPhoto: UIImageView!
    var userName: UIButton!
    var postImageView: UIImageView!
    var postText: UILabel!
    
    var shareCount: UILabel!
    
    var commentsSection: UITableView!
    
    var writeAComment: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userPhoto = viewWithTag(99) as! UIImageView
        userName = viewWithTag(100) as! UIButton
        postText = viewWithTag(101) as! UILabel
        postImageView = viewWithTag(102) as! UIImageView
        postImageView.clipsToBounds = true
        postImageView.contentMode = UIViewContentMode.ScaleToFill
        shareCount = viewWithTag(103) as! UILabel
        commentsSection = viewWithTag(104) as! UITableView
        commentsSection.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell") as! CommentTableViewCell
        
        return cell
    }
}
