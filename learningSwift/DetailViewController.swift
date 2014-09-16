//
//  DetailViewController.swift
//  learningSwift
//
//  Created by Kendrick Parks on 8/22/14.
//  Copyright (c) 2014 TD Falcor. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UITableViewController {
    lazy var data = NSMutableData()
    var toPass = ""
    var list = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (toPass == "Company"){
            toPass = "companies"
        }
        else if (toPass == "Person"){
            toPass = "people"
        }
        else if (toPass == "War"){
            toPass = "wars"
        }
        else if (toPass == "Country"){
            toPass = "countries"
        }
    self.navigationItem.title = toPass.capitalizedString
        startConnection()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startConnection(){
        var urlPath: String = "http://api.warpigs.dev/v1/"
        urlPath += toPass
        urlPath += ".json"
        
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
        
    }
    
//    func buttonAction(sender: UIButton!){
//        startConnection()
//    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            
            list = jsonResult["results"] as NSArray
            self.tableView.reloadData()

    }


    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView!.dequeueReusableCellWithIdentifier("Label", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = list[indexPath.row]["shortname"] as NSString
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var index = tableView.indexPathForSelectedRow()
        var svc = segue.destinationViewController as ShowViewController
        svc.toPass = list[index.row] as NSDictionary
        svc.category = toPass
        
    }
}
