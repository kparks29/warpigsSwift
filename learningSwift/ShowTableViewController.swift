//
//  ShowTableViewController.swift
//  learningSwift
//
//  Created by Kendrick Parks on 8/24/14.
//  Copyright (c) 2014 TD Falcor. All rights reserved.
//

import Foundation
import UIKit

class ShowTableViewController: UITableViewController {
    var values = []
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = name
        println(name)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    
        var cell = tableView!.dequeueReusableCellWithIdentifier("Label", forIndexPath: indexPath) as UITableViewCell
        if (name == "People"){
            var mytext = ""
            mytext = values[indexPath.row]["firstname"] as String
            mytext += " "
            mytext += values[indexPath.row]["lastname"] as String
            cell.textLabel.text = mytext
        }
        else if (name == "Companies") {
            cell.textLabel.text = values[indexPath.row]["shortname"] as String
        }
        else if (name == "Wars") {
            cell.textLabel.text = values[indexPath.row]["name"] as String
        }
        
        return cell
    }
}