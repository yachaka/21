//
//  Invoker.swift
//  21
//
//  Created by Ilyes HERMELLIN on 24/10/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import Foundation

class Invoker {
    
    
    static func invokeUserProfile(navigationCtrl: UINavigationController, forUserId: UInt) {
        let profile = ProfileViewController()
        
        navigationCtrl.pushViewController(profile, animated: true)
    }
}