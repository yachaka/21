//
//  SearchViewController.swift
//  21
//
//  Created by Ilyes HERMELLIN on 10/11/15.
//  Copyright © 2015 Ilyes HERMELLIN. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource {

    var results: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = self.view as! SearchOverlay
        
        view.searchTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        view = SearchOverlay()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func reloadResults(newResults: JSON?) {
        print("yayyyyy")
        results = newResults
        (view as! SearchOverlay).searchTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HashtagCell") as! HashtagResultTableViewCell
        
        cell.hashtag.text = results![indexPath.row]["tag"].string
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if results == nil {
            return 0
        }
        return results!.count
    }

}
