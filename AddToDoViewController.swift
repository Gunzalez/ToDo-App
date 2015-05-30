//
//  AddToDoViewController.swift
//  ToDo Swift
//
//  Created by Segun Konibire on 11/04/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    
    @IBOutlet var textField: UITextField!
    
    
    
    @IBAction func saveToDo(sender: AnyObject) {
        
        var newToDo = textField.text;
        
        var trimmedString = newToDo.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        
        todoListData.append(trimmedString);
        
        NSUserDefaults.standardUserDefaults().setObject(todoListData, forKey: "ToDoList");
        
        textField.text = "";
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.textField.becomeFirstResponder();
        
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

}
