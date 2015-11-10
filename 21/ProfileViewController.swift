//
//  ProfileViewController.swift
//  21
//
//  Created by Ilyes HERMELLIN on 24/10/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view as! ProfileView
//        navigationController?.setNavigationBarHidden(false, animated: false)
        
        view.username.text = "Loul?"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func loadView() {
        view = ProfileView()
    }

}
