//
//  DetailsViewController.swift
//  TodoListApp
//
//  Created by Jack Zhou on 6/7/16.
//  Copyright © 2016 Jack Zhou. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var textNotes: UITextView!
    
    var todoItem: NSMutableDictionary = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textTitle.userInteractionEnabled = false
        textNotes.userInteractionEnabled = false
        
        textTitle.text = todoItem.objectForKey("itemTitle") as? String
        textNotes.text = todoItem.objectForKey("itemNotes") as! String
    }
    
    @IBAction func deleteItem(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let itemList = userDefaults.objectForKey("itemList") as! NSMutableArray
        let mutableItemList = NSMutableArray()
        for dict: AnyObject in itemList {
            mutableItemList.addObject(dict as! NSMutableDictionary)
        }
        
        mutableItemList.removeObject(todoItem)
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
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
