//
//  MessagesViewController.swift
//  21
//
//  Created by Ilyes HERMELLIN on 28/10/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view = self.view as! MessagesScreen
        
        view.messagesTableView.dataSource = self
        // Do any additional setup after loading the view.
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
    
    override func loadView() {
        view = MessagesScreen()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let nLayer = twGradientLayer()
        nLayer.cornerRadius = 24
        nLayer.frame = CGRectMake(8, 8, 48, 48)
        nLayer.opacity = 0.5
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell")!
        cell.layer.insertSublayer(nLayer, above: cell.layer)
        
        return cell
    }

}
