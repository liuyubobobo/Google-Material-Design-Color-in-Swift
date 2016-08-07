//
//  ColorDetailViewController.swift
//  GMDColorDemo
//
//  Created by liuyubobobo on 7/17/16.
//  Copyright © 2016 Yubo Liu. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    var colorType: GMDColorType!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = colorType.name
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.separatorStyle = .None
        self.tableView.backgroundColor = UIColor.darkTextColor()
        
        self.tableView.allowsSelection = false
    }
}

// MARK: - extension UITableView Data Source & Delegate
extension ColorDetailViewController: UITableViewDataSource, UITableViewDelegate{

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if colorType.accentLevelCount == 0{
            return 1
        }
        else{
            return 2
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return colorType.primaryLevelCount
        }
        else{
            assert(section == 1)
            return colorType.accentLevelCount
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0.0
        }
        else{
            return 10.0
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let backgroundView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.width, height: 0.0))
            backgroundView.backgroundColor = UIColor.blackColor()
            return backgroundView
        }
        else{
            let whiteView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.width, height: 10.0))
            whiteView.backgroundColor = UIColor.whiteColor()
            return whiteView
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: GMDColorDetailCell = tableView.dequeueReusableCellWithIdentifier("GMDColorDetailCell", forIndexPath: indexPath) as! GMDColorDetailCell
        cell.colorType = self.colorType
        if indexPath.section == 0{
            cell.primaryLevel = GMDColorPrimaryLevel(rawValue: indexPath.row)
        }
        else{
            assert( indexPath.section == 1 )
            cell.accentLevel = GMDColorAccentLevel(rawValue: indexPath.row)
        }
        
        cell.configureCell()
        
        return cell
    }
}