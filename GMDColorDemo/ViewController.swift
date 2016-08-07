//
//  ViewController.swift
//  GMDColorDemo
//
//  Created by liuyubobobo on 7/17/16.
//  Copyright © 2016 Yubo Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .None
        self.tableView.backgroundColor = UIColor.darkTextColor()
        
        self.title = "Google Material Design"
    }
}

// MARK: - extension UITableView Data Source & Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GMDColorType.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: GMDColorTypeCell = tableView.dequeueReusableCellWithIdentifier("GMDColorTypeCell", forIndexPath: indexPath) as! GMDColorTypeCell
        cell.colorType = GMDColorType(rawValue: indexPath.row)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toColorDetail"{
            
            let colorDetailViewController = segue.destinationViewController as! ColorDetailViewController

            colorDetailViewController.colorType = GMDColorType(rawValue: tableView.indexPathForSelectedRow!.row)
        }
    }
}
