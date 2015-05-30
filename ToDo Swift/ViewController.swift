//
//  ViewController.swift
//  ToDo Swift
//
//  Created by Segun Konibire on 11/04/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

var todoListData = [String]();

class ViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet var tableData: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoListData.count;
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell");
        
        var currentTimesRow: AnyObject = todoListData[indexPath.row];
        
        cell.textLabel?.text = ("\(currentTimesRow)");
        
        return cell;
    }
    
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            todoListData.removeAtIndex(indexPath.row);
            
            NSUserDefaults.standardUserDefaults().setObject(todoListData, forKey: "ToDoList");
            
            tableData.reloadData();
            
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        if NSUserDefaults.standardUserDefaults().objectForKey("ToDoList") != nil {
        
            todoListData = NSUserDefaults.standardUserDefaults().objectForKey("ToDoList") as! [(String)];
            
        }
        
        tableData.reloadData();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        tableData.reloadData();
    }


}

