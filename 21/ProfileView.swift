//
//  ProfileView.swift
//  21
//
//  Created by Ilyes HERMELLIN on 24/10/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class ProfileView: twView {

    var profilePhoto: UIImageView = {
        let i = UIImageView(image: UIImage(named: "DefaultProfilePicture"))
        i.translatesAutoresizingMaskIntoConstraints = false
        i.clipsToBounds = true
        i.contentMode = UIViewContentMode.ScaleAspectFill
        
        i.addConstraint(NSLayoutConstraint(item: i, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 64))
        i.addConstraint(NSLayoutConstraint(item: i, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 64))
        i.layer.cornerRadius = 32
        i.layer.borderWidth = 2
        i.layer.borderColor = UIColor(red: 127, green: 127, blue: 127, alpha: 1).CGColor
        return i
    }()
    
    var username: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    override func cInit() {
        super.cInit()
        
        addSubview(profilePhoto)
        addSubview(username)
        
        let v = ["statusBar": statusBar, "username": username, "pp": profilePhoto]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[pp]-10-[username]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[statusBar]-10-[pp]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: v))
        addConstraint(NSLayoutConstraint(item: username, attribute: .CenterY, relatedBy: .Equal, toItem: profilePhoto, attribute: .CenterY, multiplier: 1, constant: 0))
    }

}
