//
//  LoginViewController.swift
//  21
//
//  Created by Ilyes HERMELLIN on 18/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class LoginViewController: twController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        twAPI.session {
            [weak self] data, response, error in
            
            if let strongSelf = self {
                if let data = data {
                let json = JSON(data: data)
                    if json["success"].boolValue == true {
                        dispatch_async(dispatch_get_main_queue()) {
                            strongSelf.switchToEntry()
                        }
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login() {
        twAPI.login(usernameField.text!, password: passwordField.text!) {
            [weak self] data, response, error in
            
            print(error)
            
            if let strongSelf = self {
                if error == nil {
                    dispatch_async(dispatch_get_main_queue()) {
                        strongSelf.switchToEntry()
                    }
                }
            }
        }
    }
    
    private func switchToEntry() {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("EntryViewController") 
        UIApplication.sharedApplication().keyWindow!.rootViewController =  vc
    }
    
}
