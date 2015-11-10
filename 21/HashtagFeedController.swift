//
//  HashtagFeedViewController.swift
//  21
//
//  Created by Ilyes HERMELLIN on 19/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class HashtagFeedController: twController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view as! HashtagFeedView
        
        view.header.backButton.addTarget(self, action: Selector("buttonTapped"), forControlEvents: .TouchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    func buttonTapped() {
        navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func loadView() {
        print("herre")
        view = HashtagFeedView()
    }
    
    deinit {
        print("HashtagFeedController deinited")
    }
}
