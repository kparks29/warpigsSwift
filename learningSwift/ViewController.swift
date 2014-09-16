//
//  ViewController.swift
//  learningSwift
//
//  Created by Kendrick Parks on 8/19/14.
//  Copyright (c) 2014 TD Falcor. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let list = ["War","Person","Company","Country"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = tableView!.dequeueReusableCellWithIdentifier("Label", forIndexPath: indexPath) as UITableViewCell
        
        
        
        cell.textLabel.text = list[indexPath.row]
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var index = tableView.indexPathForSelectedRow()
        var svc = segue.destinationViewController as DetailViewController
        svc.toPass = list[index.row]
        
    }


}

