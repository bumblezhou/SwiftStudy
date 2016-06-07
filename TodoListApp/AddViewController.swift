//
//  AddViewController.swift
//  TodoListApp
//
//  Created by Jack Zhou on 6/7/16.
//  Copyright © 2016 Jack Zhou. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var textNotes: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        let dataset = NSMutableDictionary()
        dataset.setObject(textTitle.text!, forKey: "itemTitle")
        dataset.setObject(textNotes.text, forKey: "itemNotes")
        
        if((itemList) != nil){
            let newItemList = NSMutableArray()
            for dict: AnyObject in itemList! {
                newItemList.addObject(dict as! NSDictionary)
            }
            userDefaults.removeObjectForKey("itemList")
            newItemList.addObject(dataset)
            userDefaults.setObject(newItemList, forKey: "itemList")
        } else {
            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList?.addObject(dataset)
            userDefaults.setObject(itemList, forKey: "itemList")
        }
        
        userDefaults.synchronize()
        self.navigationController?.popViewControllerAnimated(true)
        
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
