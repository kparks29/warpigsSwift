//
//  ShowViewController.swift
//  learningSwift
//
//  Created by Kendrick Parks on 8/22/14.
//  Copyright (c) 2014 TD Falcor. All rights reserved.
//

import Foundation
import UIKit

class ShowViewController: UIViewController {
    var toPass = [:]
    var category = ""
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = toPass["shortname"] as String
        nameLabel.text = toPass["longname"] as String
        countryLabel.text = toPass["country"]["shortname"] as String
        println(category)
        if (category == "companies") {
            button1.setTitle("List of People" as String, forState: UIControlState.Normal)
        }
        else {
            button1.setTitle("List of Companies" as String, forState: UIControlState.Normal)
        }
        button2.setTitle("List of Wars" as String, forState: UIControlState.Normal)
        
        

    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        println(segue.identifier)
        var svc = segue.destinationViewController as ShowTableViewController
        if (segue.identifier == "button1Segue"){
            if (category == "companies"){
                svc.values = toPass["people"] as NSArray
                svc.name = "People"
            }
            else {
                svc.values = toPass["companies"] as NSArray
                svc.name = "Companies"
            }
        }
        else if (segue.identifier == "button2Segue"){
            svc.values = toPass["wars"] as NSArray
            svc.name = "Wars"
        }
        
        
    }
    
    
    
}
